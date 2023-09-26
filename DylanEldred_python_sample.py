#!/usr/bin/env python
# coding: utf-8

# In[1]:


#API Keys and Endpoints
act_nowkey = '1cfead6cf02043b7a466ddfba8b43241'
endpoint = f"https://api.covidactnow.org/v2/states.json?apiKey={act_nowkey}"
geo_key = 'AIzaSyA0ZMprIa60-PvDMUN7eZ9SGE9bDi75rSY'
bing_key = 'AuKVi8ZGcFmIM0D-pA8wagYBEnwrM5oJSpDS6RJDhOXV3T9tkj3xaqqIkR57i7ne'
#Imports
import requests
import pandas as pd
from IPython.display import HTML, display 
from ipywidgets import interact_manual
import warnings
warnings.filterwarnings('ignore')
import folium
import ipywidgets as widgets
get_ipython().system('pip install geopy')
from geopy.geocoders import Nominatim
from geopy.distance import geodesic


# In[2]:


def vax_data(act_nowkey): #This function calls the COVIDActNow API to get real time vaccination rates by state 
    endpoint = f"https://api.covidactnow.org/v2/states.json?apiKey={act_nowkey}"
    response = requests.get(endpoint)
    response.raise_for_status()
    data1 = response.json()
    df = pd.json_normalize(data1) #I used json_normalize since the original dataframe had some nested json values
    return df
display(HTML("<h1> Vaccination Rate by State <h1/>"))
df = vax_data(act_nowkey)
state_geo = 'https://raw.githubusercontent.com/python-visualization/folium/main/examples/data/us-states.json' #This dataset allows me to outline state boundries for a choropleth map
vax_map = folium.Map(location= [39,-99],zoom_start = 4) #I start the map focused on the center of the US,

folium.Choropleth(
    geo_data = state_geo, #Outlines US states
    name="choropleth",#Choropleths shade different states based on the value of a given column
    data = df,
    columns = ['state','metrics.vaccinationsCompletedRatio'], #I'm comparing states based on vaccinations that are completed.
    key_on = "feature.id",
    fill_color = "BuPu", #I chose to shade the map from blue to purple 
    fill_opacity = 0.7,
    line_opacity = 0.5,
    legend_name = "Vaccination Rate %",
    reset = True
).add_to(vax_map)
display(vax_map)

display(HTML("<h1> Find Vaccines Near You <h1/>"))#THis part of the program will return vaccine providers based on location input
def load_providers(zipcode,vaccine_choice,walkin): #Filters original dataframe based on zipcode and makes the columns more readable
    url = 'https://data.cdc.gov/resource/5jp2-pgaw.json' #I'm calling the CDC's vaccine provider API through Socrata
    params = {"loc_admin_zip": zipcode} #To prevent the call from returning too many providers at once, I limited the request to a given zipcode.
    response = requests.get(url, params = params)
    response.raise_for_status()
    data = response.json()
    vaccine_df = pd.json_normalize(data)
    vaccine_df['loc_admin_city'] = vaccine_df['loc_admin_city'].apply(lambda x: x.capitalize())
    #The data in the pandas dataframe wasn't very uniform in format, so I had to use lambda to format certain columns.
    #In this case, I am using lambda to make sure cities all looked like "Syracuse" and not "SYRACUSE"
    vaccine_df['loc_admin_street1'] = vaccine_df['loc_admin_street1'].apply(lambda x: x.title())
    #Same thing with the street. Some values looked like "300 HINDS HALL" and some were "300 Hinds Hall." Again, I wanted everything to be uniform
    try: #This is my first attempt at error handling. When submitting a request to the CDC API, not all providers had a column with a phone number
        vaccine_df['loc_phone'] = vaccine_df['loc_phone'].fillna('Not Available')
    #I used try/except to handle the KeyError (some misssing the phone number key) and replaced a missing phone number with "Not Available"
    except KeyError:
        for row in vaccine_df.to_records(): #I wasn't able to figure out how to do this with lambda, so I just looped over the rows in the dataframe
            vaccine_df['loc_phone'] = 'Not Available'
    #I used the same process with websites a I did with the phone numbers
    try:
        vaccine_df['web_address'] = vaccine_df['web_address'].fillna('Not Available') #fill.na(stuff) takes missing values and replaces it with (stuff) 
    except KeyError:
        for row in vaccine_df.to_records():
            vaccine_df['web_address'] = 'Not Available'
    #In the original data frame, the address was split into different columns street, city, state. I merged this values together and created a new column with a full address.
    vaccine_df['Address'] = vaccine_df['loc_admin_street1'] + ', ' + vaccine_df['loc_admin_city'] + ', ' + vaccine_df['loc_admin_state']
    #Here I used lambda to make the vaccination names more human-readable. I replaced the long, ugly name with a simple name
    vaccine_df['med_name'] = vaccine_df['med_name'].apply(lambda x: "Moderna" if x == "Moderna, COVID-19 Vaccine, 100mcg/0.5mL 10 dose" else ("Pfizer" if x == "Pfizer-BioNTech, COVID-19 Vaccine, 30 mcg/0.3mL" else "Johnson & Johnson"))
    #Similar to the website and phone number, not every dataframe had a column for walk-in appointment availability
    try: 
        vaccine_df['walkins_accepted'] = vaccine_df['walkins_accepted'].fillna("No")
        vaccine_df['walkins_accepted'] = vaccine_df['walkins_accepted'].apply(lambda x: "Yes" if x == True else "No")
    except KeyError:
        for row in vaccine_df.to_records():
            vaccine_df['walkins_accepted'] = 'No'
    #I created this filtered dataframe to only include the columns I wanted, instead of the 30 included with the original dataframe
    filtered_df = vaccine_df[['loc_name', 'Address','loc_admin_zip','loc_phone','web_address','med_name','walkins_accepted','latitude','longitude','loc_admin_city','loc_admin_state']]
    filtered_vaccine = filter_vaccine(vaccine_choice,filtered_df)
    filtered_walkin = find_walkin(walkin,filtered_vaccine)
    vaccine_directory = filtered_walkin[['loc_name','Address','loc_phone','web_address','walkins_accepted','latitude','longitude']]
    vaccine_directory.columns = ['Name','Address','Phone','Website','Walkins','latitude','longitude']
    vaccine_directory = vaccine_directory.drop_duplicates(subset = ['Name'])
    #Since some locations offered multiple vaccines, I didn't want copies of locations to exist in the dataframe.
    #pd.drop_duplicates allows you to drop any row that is repeated. I subset based on the name of the provider (Ex: Wegmans).
    #So if Wegmans had multiple entries in one location, it wouldn't intefere with plotting markers below
    return vaccine_directory

def filter_vaccine(vaccine_choice,filtered_df): 
    #This function filters my pandas dataframe based on the choice of the user
    if vaccine_choice == "Moderna":
        filtered_vaccine = filtered_df[filtered_df['med_name'] == "Moderna"]
    elif vaccine_choice == "Pfizer":
        filtered_vaccine = filtered_df[filtered_df['med_name'] == "Pfizer"]
    elif vaccine_choice == "Johnson & Johnson":
        filtered_vaccine = filtered_df[filtered_df['med_name'] == "Johnson & Johnson"]
    else: #I included this in case the user wanted to select from any vaccines available
        filtered_vaccine = filtered_df
    return filtered_vaccine

def find_walkin(walkin,filtered_vaccine): 
    #This filters the dataframe based on if the user needs a walk-in (vs. a scheduled) appointment
    if walkin == "Yes":
        filtered_walkin = filtered_vaccine[filtered_vaccine['walkins_accepted'] == 'Yes']
    elif walkin == "No":
        filtered_walkin = filtered_vaccine[filtered_vaccine['walkins_accepted'] == 'No']
    else: filtered_walkin = filtered_vaccine
    return filtered_walkin

zips = pd.read_csv('https://gist.githubusercontent.com/erichurst/7882666/raw/5bdc46db47d9515269ab12ed6fb2850377fd869e/US%2520Zip%2520Codes%2520from%25202013%2520Government%2520Data')
#This is a really cool dataset I found that gives precise coordinates for zipcodes.
def get_zipCoord(zipcode): #From the zipcode dataframe I wrote a function tht returns a lat, lon tuple from a given zipcode
    try:
        zipcode = float(zipcode)
        zips1 = zips[zips['ZIP'] == zipcode]
        lat = zips1.iat[0,1]
        lon = zips1.iat[0,2]
        return lat, lon
    except ValueError: #More error handling, if the user enters something like "23124145" or "aaaaaa" then it will print this statement.
        print("Please enter a valid, 5-digit zipcode. Ex: 13088")
#My program is unfortunately limited by the zipcode dataset I have. I did notice through tests that there were some zipcodeds that didn't work since they werent in that github file.
def get_centered_map(zipcode): #Similar to HW13, I created a function that returns a centered map, except I did it based on zipcode instead of state.
    lat = get_zipCoord(zipcode)[0]
    lon = get_zipCoord(zipcode)[1]
    vmap = folium.Map(location= [lat,lon], zoom_start = 12)
    return vmap

def getDirections(start,finish,my_key): #This function is from small group 11 and will return directions between two points. I set the starting point as your home address and the end as the provider's address.
    endpoint = 'http://dev.virtualearth.net/REST/v1/Routes'
    query_string = {'wp.1': start, 'wp.2': finish, 'key': bing_key}
    response = requests.get(endpoint, params = query_string)
    data = response.json()
    steps = data['resourceSets'][0]['resources'][0]['routeLegs'][0]['itineraryItems']
    directions = []
    for ele in steps:
        directions.append(ele['instruction']['text'])
    return directions

geolocator = Nominatim(user_agent="eldreddyl") #I didn't want to just use google Geocode like we did in class, so I did some exploring and learned the basics of the geopy package
def geoCode(address):
    location = geolocator.geocode(address) #The function takes in an address and returns a full address. This is useful since if you enter just "900 Irving Ave", the program can still find precise coordinates by returning "900 Irving Ave, Syracuse, NY"
    #Again, there are some limitations since the package is making an educated guess based on the user input, but it seems to do a decent job.
    lat = location.latitude # I liked geopy a lot because you can get the latitude/longitude by just using location.latitude.
    lon = location.longitude #This was a whole lot easier than sifting through a json response and trying to pull out what I need.
    return lat, lon

#I thought it would be important to include the distance of the provider from the user's house
#I was able to achieve this using the geodesic package. I set the parameters as the user's house and the provider's location.
def get_distance(home,provider_coord): 
    home_coord = geoCode(home)
    return geodesic(home_coord,provider_coord).miles #.miles returns the distance in miles

end_address = [] #Initiallizing the 
names = []
directions = {} #Setting the directions as an empty dictionary. This will be explained later. Basially I want to create a dictionary wherte 
#I was looking through the interact docs and thought the 'RadioButtons' option fit well witht the design. It basically works like a multiple choice question.
@interact_manual(vaccine_choice = widgets.RadioButtons(options= ['Any','Johnson & Johnson', 'Moderna', 'Pfizer'],
                    description = 'Vaccine',
                    disabled = False), zipcode = "", walkin = widgets.RadioButtons(options= ['Yes', 'No','Any'],
                    description = 'Walk-In?',
                    disabled = False), home = "" )
def drawMap(zipcode, vaccine_choice,walkin,home): #Parameters are the zipcode you want the vaccine from, your choice of vaccine, if you need a walk-in, and your home address
    vmap = get_centered_map(zipcode) #Initialize the map at the zipcode you entered
    vaccine_directory = load_providers(zipcode,vaccine_choice,walkin) #create a vaccine dataframe specific to your zipcode and choice of vaccine ****
    for row in vaccine_directory.to_records(): #This chunk of code is for the markers. First I loop through each row of the filtered dataframe
        lat = row['latitude']
        lon = row['longitude']
        provider_coord = (lat,lon)
        distance = get_distance(home,provider_coord) #calculating the distance between your house and the provider
        html = f''' <font size="-3">
        NAME: {row['Name']} <br> 
        ADDRESS: {row['Address']} <br> 
        PHONE: {row['Phone']} <br> 
        WEBSITE: {row['Website']} <br> 
        WALK-INS? {row['Walkins']} <br>
        DISTANCE: {distance:.3f} miles </font> 
        '''
        #Using f-string formatting to get a nicer looking number or else the distance ends up looking like 2.12124488258291 miles
        #I decided to use HTML because it made the marker popup look a lot cleaner
        iframe = folium.IFrame(html)
        popup = folium.Popup(iframe,min_width = 175, max_width = 175) #I increased the width of the popup to fit everything (default = 100)
        icon = folium.Icon(icon = 'info-sign') #I customized the little popup image
        marker = folium.Marker(location = [lat,lon],popup = popup, icon = icon)
        vmap.add_child(marker)
    hlat = geoCode(home)[0] #Following 2 lines are the coordinates of your house
    hlon = geoCode(home)[1]
    folium.Marker(location = [hlat, hlon],popup = 'Home', # I thought it would look better if I included a marker for the location of your house so you could compare it to the provider markers
                 icon = folium.Icon(color = 'red', icon = 'home')).add_to(vmap)    
    display(vmap)
    display(HTML("<h1> Directions to Providers <h1/>"))
    for row in vaccine_directory.to_records(): #Loop through the vaccine dataframe
        provider = row['Address']
        name = row['Name']
        end_address.append(provider) #append the address to the empty list above so I can loop through it again
        names.append(name) #append the name to the empty list
    directions = {names[i]: end_address[i] for i in range(len(names))} #I created a dictionary that has the following format:
    # {name: address}
    for i in directions.keys(): #Loop throught the dictionary that I created
        display(HTML(f"<h2> Directions to {i}")) #Display the name of the vaccine provider 
        for i in directions.values():
            route = getDirections(home,i,bing_key) #Get the directions from your house to the provider
            print(route)

