* Dylan Eldred Distinction Code


*cd "C:\Users\deldred\OneDrive - Syracuse University\Desktop\DylanEldred_code_samples\DylanEldred_sample_datasets"





set more off

clear
quietly infix              ///
  int     year      1-4    ///
  long    serial    5-9    ///
  byte    month     10-11  ///
  double  cpsid     12-25  ///
  byte    asecflag  26-26  ///
  double  asecwth   27-36  ///
  byte    statefip  37-38  ///
  byte    pernum    39-40  ///
  double  cpsidp    41-54  ///
  double  asecwt    55-64  ///
  int     relate    65-68  ///
  byte    age       69-70  ///
  byte    sex       71-71  ///
  int     race      72-74  ///
  byte    marst     75-75  ///
  byte    educ99    76-77  ///
  int     occ90ly   78-80  ///
  byte    firmsize  81-81  ///
  double  incwage   82-89  ///
  byte    inclugh   90-90  ///
  byte    hinscaid  91-91  ///
  byte    union     92-92  ///
  using cps_occ_safety.dat

replace asecwth  = asecwth  / 10000
replace asecwt   = asecwt   / 10000

format cpsid    %14.0f
format asecwth  %10.4f
format cpsidp   %14.0f
format asecwt   %10.4f
format incwage  %8.0f

label var year     `"Survey year"'
label var serial   `"Household serial number"'
label var month    `"Month"'
label var cpsid    `"CPSID, household record"'
label var asecflag `"Flag for ASEC"'
label var asecwth  `"Annual Social and Economic Supplement Household weight"'
label var statefip `"State (FIPS code)"'
label var pernum   `"Person number in sample unit"'
label var cpsidp   `"CPSID, person record"'
label var asecwt   `"Annual Social and Economic Supplement Weight"'
label var relate   `"Relationship to household head"'
label var age      `"Age"'
label var sex      `"Sex"'
label var race     `"Race"'
label var marst    `"Marital status"'
label var educ99   `"Educational attainment, 1990"'
label var occ90ly  `"Occupation last year, 1990 basis"'
label var firmsize `"Number of employees"'
label var incwage  `"Wage and salary income"'
label var inclugh  `"Included in employer group health plan  last year"'
label var hinscaid `"Any Medicaid/SCHIP/other public insurance (summary)"'
label var union    `"Union membership"'

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define asecflag_lbl 1 `"ASEC"'
label define asecflag_lbl 2 `"March Basic"', add
label values asecflag asecflag_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefip_lbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefip_lbl 71 `"Michigan-Wisconsin"', add
label define statefip_lbl 72 `"Minnesota-Iowa"', add
label define statefip_lbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefip_lbl 74 `"Delaware-Virginia"', add
label define statefip_lbl 75 `"North Carolina-South Carolina"', add
label define statefip_lbl 76 `"Alabama-Mississippi"', add
label define statefip_lbl 77 `"Arkansas-Oklahoma"', add
label define statefip_lbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefip_lbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefip_lbl 80 `"Alaska-Washington-Hawaii"', add
label define statefip_lbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefip_lbl 83 `"South Carolina-Georgia"', add
label define statefip_lbl 84 `"Kentucky-Tennessee"', add
label define statefip_lbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefip_lbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefip_lbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefip_lbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefip_lbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define relate_lbl 0101 `"Head/householder"'
label define relate_lbl 0201 `"Spouse"', add
label define relate_lbl 0202 `"Opposite sex spouse"', add
label define relate_lbl 0203 `"Same sex spouse"', add
label define relate_lbl 0301 `"Child"', add
label define relate_lbl 0303 `"Stepchild"', add
label define relate_lbl 0501 `"Parent"', add
label define relate_lbl 0701 `"Sibling"', add
label define relate_lbl 0901 `"Grandchild"', add
label define relate_lbl 1001 `"Other relatives, n.s."', add
label define relate_lbl 1113 `"Partner/roommate"', add
label define relate_lbl 1114 `"Unmarried partner"', add
label define relate_lbl 1116 `"Opposite sex unmarried partner"', add
label define relate_lbl 1117 `"Same sex unmarried partner"', add
label define relate_lbl 1115 `"Housemate/roomate"', add
label define relate_lbl 1241 `"Roomer/boarder/lodger"', add
label define relate_lbl 1242 `"Foster children"', add
label define relate_lbl 1260 `"Other nonrelatives"', add
label define relate_lbl 9100 `"Armed Forces, relationship unknown"', add
label define relate_lbl 9200 `"Age under 14, relationship unknown"', add
label define relate_lbl 9900 `"Relationship unknown"', add
label define relate_lbl 9999 `"NIU"', add
label values relate relate_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"NIU"', add
label values sex sex_lbl

label define race_lbl 100 `"White"'
label define race_lbl 200 `"Black"', add
label define race_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_lbl 650 `"Asian or Pacific Islander"', add
label define race_lbl 651 `"Asian only"', add
label define race_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_lbl 700 `"Other (single) race, n.e.c."', add
label define race_lbl 801 `"White-Black"', add
label define race_lbl 802 `"White-American Indian"', add
label define race_lbl 803 `"White-Asian"', add
label define race_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_lbl 805 `"Black-American Indian"', add
label define race_lbl 806 `"Black-Asian"', add
label define race_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_lbl 808 `"American Indian-Asian"', add
label define race_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 810 `"White-Black-American Indian"', add
label define race_lbl 811 `"White-Black-Asian"', add
label define race_lbl 812 `"White-American Indian-Asian"', add
label define race_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 818 `"Black-American Indian-Asian"', add
label define race_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 820 `"Two or three races, unspecified"', add
label define race_lbl 830 `"Four or five races, unspecified"', add
label define race_lbl 999 `"Blank"', add
label values race race_lbl

label define marst_lbl 1 `"Married, spouse present"'
label define marst_lbl 2 `"Married, spouse absent"', add
label define marst_lbl 3 `"Separated"', add
label define marst_lbl 4 `"Divorced"', add
label define marst_lbl 5 `"Widowed"', add
label define marst_lbl 6 `"Never married/single"', add
label define marst_lbl 7 `"Widowed or Divorced"', add
label define marst_lbl 9 `"NIU"', add
label values marst marst_lbl

label define educ99_lbl 00 `"NIU"'
label define educ99_lbl 01 `"No school completed"', add
label define educ99_lbl 04 `"1st-4th grade"', add
label define educ99_lbl 05 `"5th-8th grade"', add
label define educ99_lbl 06 `"9th grade"', add
label define educ99_lbl 07 `"10th grade"', add
label define educ99_lbl 08 `"11th grade"', add
label define educ99_lbl 09 `"12th grade, no diploma"', add
label define educ99_lbl 10 `"High school graduate, or GED"', add
label define educ99_lbl 11 `"Some college, no degree"', add
label define educ99_lbl 12 `"Associate degree, type of program not specified"', add
label define educ99_lbl 13 `"Associate degree, occupational program"', add
label define educ99_lbl 14 `"Associate degree, academic program"', add
label define educ99_lbl 15 `"Bachelors degree"', add
label define educ99_lbl 16 `"Masters degree"', add
label define educ99_lbl 17 `"Professional degree"', add
label define educ99_lbl 18 `"Doctorate degree"', add
label values educ99 educ99_lbl

label define occ90ly_lbl 003 `"Legislators"'
label define occ90ly_lbl 004 `"Chief executives and public administrators"', add
label define occ90ly_lbl 007 `"Financial managers"', add
label define occ90ly_lbl 008 `"Human resources and labor relations managers"', add
label define occ90ly_lbl 013 `"Managers and specialists in marketing, advertising, and public relations"', add
label define occ90ly_lbl 014 `"Managers in education and related fields"', add
label define occ90ly_lbl 015 `"Managers of medicine and health occupations"', add
label define occ90ly_lbl 016 `"Postmasters and mail superintendents"', add
label define occ90ly_lbl 017 `"Managers of food-serving and lodging establishments"', add
label define occ90ly_lbl 018 `"Managers of properties and real estate"', add
label define occ90ly_lbl 019 `"Funeral directors"', add
label define occ90ly_lbl 021 `"Managers of service organizations, n.e.c."', add
label define occ90ly_lbl 022 `"Managers and administrators, n.e.c."', add
label define occ90ly_lbl 023 `"Accountants and auditors"', add
label define occ90ly_lbl 024 `"Insurance underwriters"', add
label define occ90ly_lbl 025 `"Other financial specialists"', add
label define occ90ly_lbl 026 `"Management analysts"', add
label define occ90ly_lbl 027 `"Personnel, HR, training, and labor relations specialists"', add
label define occ90ly_lbl 028 `"Purchasing agents and buyers, of farm products"', add
label define occ90ly_lbl 029 `"Buyers, wholesale and retail trade"', add
label define occ90ly_lbl 033 `"Purchasing managers, agents and buyers, n.e.c."', add
label define occ90ly_lbl 034 `"Business and promotion agents"', add
label define occ90ly_lbl 035 `"Construction inspectors"', add
label define occ90ly_lbl 036 `"Inspectors and compliance officers, outside construction"', add
label define occ90ly_lbl 037 `"Management support occupations"', add
label define occ90ly_lbl 043 `"Architects"', add
label define occ90ly_lbl 044 `"Aerospace engineer"', add
label define occ90ly_lbl 045 `"Metallurgical and materials engineers, variously phrased"', add
label define occ90ly_lbl 047 `"Petroleum, mining, and geological engineers"', add
label define occ90ly_lbl 048 `"Chemical engineers"', add
label define occ90ly_lbl 053 `"Civil engineers"', add
label define occ90ly_lbl 055 `"Electrical engineer"', add
label define occ90ly_lbl 056 `"Industrial engineers"', add
label define occ90ly_lbl 057 `"Mechanical engineers"', add
label define occ90ly_lbl 059 `"Not-elsewhere-classified engineers"', add
label define occ90ly_lbl 064 `"Computer systems analysts and computer scientists"', add
label define occ90ly_lbl 065 `"Operations and systems researchers and analysts"', add
label define occ90ly_lbl 066 `"Actuaries"', add
label define occ90ly_lbl 067 `"Statisticians"', add
label define occ90ly_lbl 068 `"Mathematicians and mathematical scientists"', add
label define occ90ly_lbl 069 `"Physicists and astronomers"', add
label define occ90ly_lbl 073 `"Chemists"', add
label define occ90ly_lbl 074 `"Atmospheric and space scientists"', add
label define occ90ly_lbl 075 `"Geologists"', add
label define occ90ly_lbl 076 `"Physical scientists, n.e.c."', add
label define occ90ly_lbl 077 `"Agricultural and food scientists"', add
label define occ90ly_lbl 078 `"Biological scientists"', add
label define occ90ly_lbl 079 `"Foresters and conservation scientists"', add
label define occ90ly_lbl 083 `"Medical scientists"', add
label define occ90ly_lbl 084 `"Physicians"', add
label define occ90ly_lbl 085 `"Dentists"', add
label define occ90ly_lbl 086 `"Veterinarians"', add
label define occ90ly_lbl 087 `"Optometrists"', add
label define occ90ly_lbl 088 `"Podiatrists"', add
label define occ90ly_lbl 089 `"Other health and therapy"', add
label define occ90ly_lbl 095 `"Registered nurses"', add
label define occ90ly_lbl 096 `"Pharmacists"', add
label define occ90ly_lbl 097 `"Dietitians and nutritionists"', add
label define occ90ly_lbl 098 `"Respiratory therapists"', add
label define occ90ly_lbl 099 `"Occupational therapists"', add
label define occ90ly_lbl 103 `"Physical therapists"', add
label define occ90ly_lbl 104 `"Speech therapists"', add
label define occ90ly_lbl 105 `"Therapists, n.e.c."', add
label define occ90ly_lbl 106 `"Physicians' assistants"', add
label define occ90ly_lbl 113 `"Earth, environmental, and marine science instructors"', add
label define occ90ly_lbl 114 `"Biological science instructors"', add
label define occ90ly_lbl 115 `"Chemistry instructors"', add
label define occ90ly_lbl 116 `"Physics instructors"', add
label define occ90ly_lbl 118 `"Psychology instructors"', add
label define occ90ly_lbl 119 `"Economics instructors"', add
label define occ90ly_lbl 123 `"History instructors"', add
label define occ90ly_lbl 125 `"Sociology instructors"', add
label define occ90ly_lbl 127 `"Engineering instructors"', add
label define occ90ly_lbl 128 `"Math instructors"', add
label define occ90ly_lbl 139 `"Education instructors"', add
label define occ90ly_lbl 145 `"Law instructors"', add
label define occ90ly_lbl 147 `"Theology instructors"', add
label define occ90ly_lbl 149 `"Home economics instructors"', add
label define occ90ly_lbl 150 `"Humanities profs/instructors, college, nec"', add
label define occ90ly_lbl 154 `"Subject instructors (HS/college)"', add
label define occ90ly_lbl 155 `"Kindergarten and earlier school teachers"', add
label define occ90ly_lbl 156 `"Primary school teachers"', add
label define occ90ly_lbl 157 `"Secondary school teachers"', add
label define occ90ly_lbl 158 `"Special education teachers"', add
label define occ90ly_lbl 159 `"Teachers , n.e.c."', add
label define occ90ly_lbl 163 `"Vocational and educational counselors"', add
label define occ90ly_lbl 164 `"Librarians"', add
label define occ90ly_lbl 165 `"Archivists and curators"', add
label define occ90ly_lbl 166 `"Economists, market researchers, and survey researchers"', add
label define occ90ly_lbl 167 `"Psychologists"', add
label define occ90ly_lbl 168 `"Sociologists"', add
label define occ90ly_lbl 169 `"Social scientists, n.e.c."', add
label define occ90ly_lbl 173 `"Urban and regional planners"', add
label define occ90ly_lbl 174 `"Social workers"', add
label define occ90ly_lbl 175 `"Recreation workers"', add
label define occ90ly_lbl 176 `"Clergy and religious workers"', add
label define occ90ly_lbl 178 `"Lawyers"', add
label define occ90ly_lbl 179 `"Judges"', add
label define occ90ly_lbl 183 `"Writers and authors"', add
label define occ90ly_lbl 184 `"Technical writers"', add
label define occ90ly_lbl 185 `"Designers"', add
label define occ90ly_lbl 186 `"Musician or composer"', add
label define occ90ly_lbl 187 `"Actors, directors, producers"', add
label define occ90ly_lbl 188 `"Art makers: painters, sculptors, craft-artists, and print-makers"', add
label define occ90ly_lbl 189 `"Photographers"', add
label define occ90ly_lbl 193 `"Dancers"', add
label define occ90ly_lbl 194 `"Art/entertainment performers and related"', add
label define occ90ly_lbl 195 `"Editors and reporters"', add
label define occ90ly_lbl 198 `"Announcers"', add
label define occ90ly_lbl 199 `"Athletes, sports instructors, and officials"', add
label define occ90ly_lbl 200 `"Professionals, n.e.c."', add
label define occ90ly_lbl 203 `"Clinical laboratory technologies and technicians"', add
label define occ90ly_lbl 204 `"Dental hygenists"', add
label define occ90ly_lbl 205 `"Health record tech specialists"', add
label define occ90ly_lbl 206 `"Radiologic tech specialists"', add
label define occ90ly_lbl 207 `"Licensed practical nurses"', add
label define occ90ly_lbl 208 `"Health technologists and technicians, n.e.c."', add
label define occ90ly_lbl 213 `"Electrical and electronic (engineering) technicians"', add
label define occ90ly_lbl 214 `"Engineering technicians, n.e.c."', add
label define occ90ly_lbl 215 `"Mechanical engineering technicians"', add
label define occ90ly_lbl 217 `"Drafters"', add
label define occ90ly_lbl 218 `"Surveyors, cartographers, mapping scientists and technicians"', add
label define occ90ly_lbl 223 `"Biological technicians"', add
label define occ90ly_lbl 224 `"Chemical technicians"', add
label define occ90ly_lbl 225 `"Other science technicians"', add
label define occ90ly_lbl 226 `"Airplane pilots and navigators"', add
label define occ90ly_lbl 227 `"Air traffic controllers"', add
label define occ90ly_lbl 228 `"Broadcast equipment operators"', add
label define occ90ly_lbl 229 `"Computer software developers"', add
label define occ90ly_lbl 233 `"Programmers of numerically controlled machine tools"', add
label define occ90ly_lbl 234 `"Legal assistants, paralegals, legal support, etc"', add
label define occ90ly_lbl 235 `"Technicians, n.e.c."', add
label define occ90ly_lbl 243 `"Supervisors and proprietors of sales jobs"', add
label define occ90ly_lbl 253 `"Insurance sales occupations"', add
label define occ90ly_lbl 254 `"Real estate sales occupations"', add
label define occ90ly_lbl 255 `"Financial services sales occupations"', add
label define occ90ly_lbl 256 `"Advertising and related sales jobs"', add
label define occ90ly_lbl 258 `"Sales engineers"', add
label define occ90ly_lbl 274 `"Salespersons, n.e.c."', add
label define occ90ly_lbl 275 `"Retail sales clerks"', add
label define occ90ly_lbl 276 `"Cashiers"', add
label define occ90ly_lbl 277 `"Door-to-door sales, street sales, and news vendors"', add
label define occ90ly_lbl 283 `"Sales demonstrators / promoters / models"', add
label define occ90ly_lbl 290 `"Sales workers--allocated (1990 internal census)"', add
label define occ90ly_lbl 303 `"Office supervisors"', add
label define occ90ly_lbl 308 `"Computer and peripheral equipment operators"', add
label define occ90ly_lbl 313 `"Secretaries"', add
label define occ90ly_lbl 314 `"Stenographers"', add
label define occ90ly_lbl 315 `"Typists"', add
label define occ90ly_lbl 316 `"Interviewers, enumerators, and surveyors"', add
label define occ90ly_lbl 317 `"Hotel clerks"', add
label define occ90ly_lbl 318 `"Transportation ticket and reservation agents"', add
label define occ90ly_lbl 319 `"Receptionists"', add
label define occ90ly_lbl 323 `"Information clerks, nec"', add
label define occ90ly_lbl 326 `"Correspondence and order clerks"', add
label define occ90ly_lbl 328 `"Human resources clerks, except payroll and timekeeping"', add
label define occ90ly_lbl 329 `"Library assistants"', add
label define occ90ly_lbl 335 `"File clerks"', add
label define occ90ly_lbl 336 `"Records clerks"', add
label define occ90ly_lbl 337 `"Bookkeepers and accounting and auditing clerks"', add
label define occ90ly_lbl 338 `"Payroll and timekeeping clerks"', add
label define occ90ly_lbl 343 `"Cost and rate clerks (financial records processing)"', add
label define occ90ly_lbl 344 `"Billing clerks and related financial records processing"', add
label define occ90ly_lbl 345 `"Duplication machine operators / office machine operators"', add
label define occ90ly_lbl 346 `"Mail and paper handlers"', add
label define occ90ly_lbl 347 `"Office machine operators, n.e.c."', add
label define occ90ly_lbl 348 `"Telephone operators"', add
label define occ90ly_lbl 349 `"Other telecom operators"', add
label define occ90ly_lbl 354 `"Postal clerks, excluding mail carriers"', add
label define occ90ly_lbl 355 `"Mail carriers for postal service"', add
label define occ90ly_lbl 356 `"Mail clerks, outside of post office"', add
label define occ90ly_lbl 357 `"Messengers"', add
label define occ90ly_lbl 359 `"Dispatchers"', add
label define occ90ly_lbl 361 `"Inspectors, n.e.c."', add
label define occ90ly_lbl 364 `"Shipping and receiving clerks"', add
label define occ90ly_lbl 365 `"Stock and inventory clerks"', add
label define occ90ly_lbl 366 `"Meter readers"', add
label define occ90ly_lbl 368 `"Weighers, measurers, and checkers"', add
label define occ90ly_lbl 373 `"Material recording, scheduling, production, planning, and expediting clerks"', add
label define occ90ly_lbl 375 `"Insurance adjusters, examiners, and investigators"', add
label define occ90ly_lbl 376 `"Customer service reps, investigators and adjusters, except insurance"', add
label define occ90ly_lbl 377 `"Eligibility clerks for government programs; social welfare"', add
label define occ90ly_lbl 378 `"Bill and account collectors"', add
label define occ90ly_lbl 379 `"General office clerks"', add
label define occ90ly_lbl 383 `"Bank tellers"', add
label define occ90ly_lbl 384 `"Proofreaders"', add
label define occ90ly_lbl 385 `"Data entry keyers"', add
label define occ90ly_lbl 386 `"Statistical clerks"', add
label define occ90ly_lbl 387 `"Teacher's aides"', add
label define occ90ly_lbl 389 `"Administrative support jobs, n.e.c."', add
label define occ90ly_lbl 390 `"Professional, technical, and kindred workers--allocated (1990 internal census)"', add
label define occ90ly_lbl 391 `"Clerical and kindred workers--allocated (1990 internal census)"', add
label define occ90ly_lbl 405 `"Housekeepers, maids, butlers, stewards, and lodging quarters cleaners"', add
label define occ90ly_lbl 407 `"Private household cleaners and servants"', add
label define occ90ly_lbl 408 `"Private household workers--allocated (1990 internal census)"', add
label define occ90ly_lbl 415 `"Supervisors of guards"', add
label define occ90ly_lbl 417 `"Fire fighting, prevention, and inspection"', add
label define occ90ly_lbl 418 `"Police, detectives, and private investigators"', add
label define occ90ly_lbl 423 `"Other law enforcement: sheriffs, bailiffs, correctional institution officers"', add
label define occ90ly_lbl 425 `"Crossing guards and bridge tenders"', add
label define occ90ly_lbl 426 `"Guards, watchmen, doorkeepers"', add
label define occ90ly_lbl 427 `"Protective services, n.e.c."', add
label define occ90ly_lbl 434 `"Bartenders"', add
label define occ90ly_lbl 435 `"Waiter/waitress"', add
label define occ90ly_lbl 436 `"Cooks, variously defined"', add
label define occ90ly_lbl 438 `"Food counter and fountain workers"', add
label define occ90ly_lbl 439 `"Kitchen workers"', add
label define occ90ly_lbl 443 `"Waiter's assistant"', add
label define occ90ly_lbl 444 `"Misc food prep workers"', add
label define occ90ly_lbl 445 `"Dental assistants"', add
label define occ90ly_lbl 446 `"Health aides, except nursing"', add
label define occ90ly_lbl 447 `"Nursing aides, orderlies, and attendants"', add
label define occ90ly_lbl 448 `"Supervisors of cleaning and building service"', add
label define occ90ly_lbl 453 `"Janitors"', add
label define occ90ly_lbl 454 `"Elevator operators"', add
label define occ90ly_lbl 455 `"Pest control occupations"', add
label define occ90ly_lbl 456 `"Supervisors of personal service jobs, n.e.c."', add
label define occ90ly_lbl 457 `"Barbers"', add
label define occ90ly_lbl 458 `"Hairdressers and cosmetologists"', add
label define occ90ly_lbl 459 `"Recreation facility attendants"', add
label define occ90ly_lbl 461 `"Guides"', add
label define occ90ly_lbl 462 `"Ushers"', add
label define occ90ly_lbl 463 `"Public transportation attendants and inspectors"', add
label define occ90ly_lbl 464 `"Baggage porters"', add
label define occ90ly_lbl 465 `"Welfare service aides"', add
label define occ90ly_lbl 468 `"Child care workers"', add
label define occ90ly_lbl 469 `"Personal service occupations, nec"', add
label define occ90ly_lbl 473 `"Farmers (owners and tenants)"', add
label define occ90ly_lbl 474 `"Horticultural specialty farmers"', add
label define occ90ly_lbl 475 `"Farm managers, except for horticultural farms"', add
label define occ90ly_lbl 476 `"Managers of horticultural specialty farms"', add
label define occ90ly_lbl 479 `"Farm workers"', add
label define occ90ly_lbl 480 `"Farm laborers and farm foreman--allocated (1990 internal census)"', add
label define occ90ly_lbl 483 `"Marine life cultivation workers"', add
label define occ90ly_lbl 484 `"Nursery farming workers"', add
label define occ90ly_lbl 485 `"Supervisors of agricultural occupations"', add
label define occ90ly_lbl 486 `"Gardeners and groundskeepers"', add
label define occ90ly_lbl 487 `"Animal caretakers except on farms"', add
label define occ90ly_lbl 488 `"Graders and sorters of agricultural products"', add
label define occ90ly_lbl 489 `"Inspectors of agricultural products"', add
label define occ90ly_lbl 496 `"Timber, logging, and forestry workers"', add
label define occ90ly_lbl 498 `"Fishers, hunters, and kindred"', add
label define occ90ly_lbl 503 `"Supervisors of mechanics and repairers"', add
label define occ90ly_lbl 505 `"Automobile mechanics"', add
label define occ90ly_lbl 507 `"Bus, truck, and stationary engine mechanics"', add
label define occ90ly_lbl 508 `"Aircraft mechanics"', add
label define occ90ly_lbl 509 `"Small engine repairers"', add
label define occ90ly_lbl 514 `"Auto body repairers"', add
label define occ90ly_lbl 516 `"Heavy equipment and farm equipment mechanics"', add
label define occ90ly_lbl 518 `"Industrial machinery repairers"', add
label define occ90ly_lbl 519 `"Machinery maintenance occupations"', add
label define occ90ly_lbl 523 `"Repairers of industrial electrical equipment"', add
label define occ90ly_lbl 525 `"Repairers of data processing equipment"', add
label define occ90ly_lbl 526 `"Repairers of household appliances and power tools"', add
label define occ90ly_lbl 527 `"Telecom and line installers and repairers"', add
label define occ90ly_lbl 533 `"Repairers of electrical equipment, n.e.c."', add
label define occ90ly_lbl 534 `"Heating, air conditioning, and refigeration mechanics"', add
label define occ90ly_lbl 535 `"Precision makers, repairers, and smiths"', add
label define occ90ly_lbl 536 `"Locksmiths and safe repairers"', add
label define occ90ly_lbl 538 `"Office machine repairers and mechanics"', add
label define occ90ly_lbl 539 `"Repairers of mechanical controls and valves"', add
label define occ90ly_lbl 543 `"Elevator installers and repairers"', add
label define occ90ly_lbl 544 `"Millwrights"', add
label define occ90ly_lbl 549 `"Mechanics and repairers, n.e.c."', add
label define occ90ly_lbl 558 `"Supervisors of construction work"', add
label define occ90ly_lbl 563 `"Masons, tilers, and carpet installers"', add
label define occ90ly_lbl 567 `"Carpenters"', add
label define occ90ly_lbl 573 `"Drywall installers"', add
label define occ90ly_lbl 575 `"Electricians"', add
label define occ90ly_lbl 577 `"Electric power installers and repairers"', add
label define occ90ly_lbl 579 `"Painters, construction and maintenance"', add
label define occ90ly_lbl 583 `"Paperhangers"', add
label define occ90ly_lbl 584 `"Plasterers"', add
label define occ90ly_lbl 585 `"Plumbers, pipe fitters, and steamfitters"', add
label define occ90ly_lbl 588 `"Concrete and cement workers"', add
label define occ90ly_lbl 589 `"Glaziers"', add
label define occ90ly_lbl 593 `"Insulation workers"', add
label define occ90ly_lbl 594 `"Paving, surfacing, and tamping equipment operators"', add
label define occ90ly_lbl 595 `"Roofers and slaters"', add
label define occ90ly_lbl 596 `"Sheet metal duct installers"', add
label define occ90ly_lbl 597 `"Structural metal workers"', add
label define occ90ly_lbl 598 `"Drillers of earth"', add
label define occ90ly_lbl 599 `"Construction trades, n.e.c."', add
label define occ90ly_lbl 614 `"Drillers of oil wells"', add
label define occ90ly_lbl 615 `"Explosives workers"', add
label define occ90ly_lbl 616 `"Miners"', add
label define occ90ly_lbl 617 `"Other mining occupations"', add
label define occ90ly_lbl 628 `"Production supervisors or foremen"', add
label define occ90ly_lbl 634 `"Tool and die makers and die setters"', add
label define occ90ly_lbl 637 `"Machinists"', add
label define occ90ly_lbl 643 `"Boilermakers"', add
label define occ90ly_lbl 644 `"Precision grinders and filers"', add
label define occ90ly_lbl 645 `"Patternmakers and model makers"', add
label define occ90ly_lbl 646 `"Lay-out workers"', add
label define occ90ly_lbl 649 `"Engravers"', add
label define occ90ly_lbl 653 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ90ly_lbl 657 `"Cabinetmakers and bench carpenters"', add
label define occ90ly_lbl 658 `"Furniture and wood finishers"', add
label define occ90ly_lbl 659 `"Other precision woodworkers"', add
label define occ90ly_lbl 666 `"Dressmakers and seamstresses"', add
label define occ90ly_lbl 667 `"Tailors"', add
label define occ90ly_lbl 668 `"Upholsterers"', add
label define occ90ly_lbl 669 `"Shoe repairers"', add
label define occ90ly_lbl 674 `"Other precision apparel and fabric workers"', add
label define occ90ly_lbl 675 `"Hand molders and shapers, except jewelers"', add
label define occ90ly_lbl 677 `"Optical goods workers"', add
label define occ90ly_lbl 678 `"Dental laboratory and medical appliance technicians"', add
label define occ90ly_lbl 679 `"Bookbinders"', add
label define occ90ly_lbl 684 `"Other precision and craft workers"', add
label define occ90ly_lbl 686 `"Butchers and meat cutters"', add
label define occ90ly_lbl 687 `"Bakers"', add
label define occ90ly_lbl 688 `"Batch food makers"', add
label define occ90ly_lbl 693 `"Adjusters and calibrators"', add
label define occ90ly_lbl 694 `"Water and sewage treatment plant operators"', add
label define occ90ly_lbl 695 `"Power plant operators"', add
label define occ90ly_lbl 696 `"Plant and system operators, stationary engineers"', add
label define occ90ly_lbl 699 `"Other plant and system operators"', add
label define occ90ly_lbl 703 `"Lathe, milling, and turning machine operatives"', add
label define occ90ly_lbl 706 `"Punching and stamping press operatives"', add
label define occ90ly_lbl 707 `"Rollers, roll hands, and finishers of metal"', add
label define occ90ly_lbl 708 `"Drilling and boring machine operators"', add
label define occ90ly_lbl 709 `"Grinding, abrading, buffing, and polishing workers"', add
label define occ90ly_lbl 713 `"Forge and hammer operators"', add
label define occ90ly_lbl 717 `"Fabricating machine operators, n.e.c."', add
label define occ90ly_lbl 719 `"Molders, and casting machine operators"', add
label define occ90ly_lbl 723 `"Metal platers"', add
label define occ90ly_lbl 724 `"Heat treating equipment operators"', add
label define occ90ly_lbl 726 `"Wood lathe, routing, and planing machine operators"', add
label define occ90ly_lbl 727 `"Sawing machine operators and sawyers"', add
label define occ90ly_lbl 728 `"Shaping and joining machine operator (woodworking)"', add
label define occ90ly_lbl 729 `"Nail and tacking machine operators  (woodworking)"', add
label define occ90ly_lbl 733 `"Other woodworking machine operators"', add
label define occ90ly_lbl 734 `"Printing machine operators, n.e.c."', add
label define occ90ly_lbl 735 `"Photoengravers and lithographers"', add
label define occ90ly_lbl 736 `"Typesetters and compositors"', add
label define occ90ly_lbl 738 `"Winding and twisting textile/apparel operatives"', add
label define occ90ly_lbl 739 `"Knitters, loopers, and toppers textile operatives"', add
label define occ90ly_lbl 743 `"Textile cutting machine operators"', add
label define occ90ly_lbl 744 `"Textile sewing machine operators"', add
label define occ90ly_lbl 745 `"Shoemaking machine operators"', add
label define occ90ly_lbl 747 `"Pressing machine operators (clothing)"', add
label define occ90ly_lbl 748 `"Laundry workers"', add
label define occ90ly_lbl 749 `"Misc textile machine operators"', add
label define occ90ly_lbl 753 `"Cementing and gluing maching operators"', add
label define occ90ly_lbl 754 `"Packers, fillers, and wrappers"', add
label define occ90ly_lbl 755 `"Extruding and forming machine operators"', add
label define occ90ly_lbl 756 `"Mixing and blending machine operatives"', add
label define occ90ly_lbl 757 `"Separating, filtering, and clarifying machine operators"', add
label define occ90ly_lbl 759 `"Painting machine operators"', add
label define occ90ly_lbl 763 `"Roasting and baking machine operators (food)"', add
label define occ90ly_lbl 764 `"Washing, cleaning, and pickling machine operators"', add
label define occ90ly_lbl 765 `"Paper folding machine operators"', add
label define occ90ly_lbl 766 `"Furnace, kiln, and oven operators, apart from food"', add
label define occ90ly_lbl 768 `"Crushing and grinding machine operators"', add
label define occ90ly_lbl 769 `"Slicing and cutting machine operators"', add
label define occ90ly_lbl 773 `"Motion picture projectionists"', add
label define occ90ly_lbl 774 `"Photographic process workers"', add
label define occ90ly_lbl 779 `"Machine operators, n.e.c."', add
label define occ90ly_lbl 783 `"Welders and metal cutters"', add
label define occ90ly_lbl 784 `"Solderers"', add
label define occ90ly_lbl 785 `"Assemblers of electrical equipment"', add
label define occ90ly_lbl 789 `"Hand painting, coating, and decorating occupations"', add
label define occ90ly_lbl 796 `"Production checkers and inspectors"', add
label define occ90ly_lbl 799 `"Graders and sorters in manufacturing"', add
label define occ90ly_lbl 803 `"Supervisors of motor vehicle transportation"', add
label define occ90ly_lbl 804 `"Truck, delivery, and tractor drivers"', add
label define occ90ly_lbl 808 `"Bus drivers"', add
label define occ90ly_lbl 809 `"Taxi cab drivers and chauffeurs"', add
label define occ90ly_lbl 813 `"Parking lot attendants"', add
label define occ90ly_lbl 815 `"Transport equipment operatives--allocated (1990 internal census)"', add
label define occ90ly_lbl 823 `"Railroad conductors and yardmasters"', add
label define occ90ly_lbl 824 `"Locomotive operators (engineers and firemen)"', add
label define occ90ly_lbl 825 `"Railroad brake, coupler, and switch operators"', add
label define occ90ly_lbl 829 `"Ship crews and marine engineers"', add
label define occ90ly_lbl 834 `"Water transport infrastructure tenders and crossing guards"', add
label define occ90ly_lbl 844 `"Operating engineers of construction equipment"', add
label define occ90ly_lbl 848 `"Crane, derrick, winch, and hoist operators"', add
label define occ90ly_lbl 853 `"Excavating and loading machine operators"', add
label define occ90ly_lbl 859 `"Misc material moving occupations"', add
label define occ90ly_lbl 865 `"Helpers, constructions"', add
label define occ90ly_lbl 866 `"Helpers, surveyors"', add
label define occ90ly_lbl 869 `"Construction laborers"', add
label define occ90ly_lbl 874 `"Production helpers"', add
label define occ90ly_lbl 875 `"Garbage and recyclable material collectors"', add
label define occ90ly_lbl 876 `"Materials movers: stevedores and longshore workers"', add
label define occ90ly_lbl 877 `"Stock handlers"', add
label define occ90ly_lbl 878 `"Machine feeders and offbearers"', add
label define occ90ly_lbl 883 `"Freight, stock, and materials handlers"', add
label define occ90ly_lbl 885 `"Garage and service station related occupations"', add
label define occ90ly_lbl 887 `"Vehicle washers and equipment cleaners"', add
label define occ90ly_lbl 888 `"Packers and packagers by hand"', add
label define occ90ly_lbl 889 `"Laborers outside construction"', add
label define occ90ly_lbl 890 `"Laborers, except farm--allocated (1990 internal census)"', add
label define occ90ly_lbl 905 `"Military"', add
label define occ90ly_lbl 991 `"Unemployed"', add
label define occ90ly_lbl 999 `"NIU"', add
label values occ90ly occ90ly_lbl

label define firmsize_lbl 0 `"NIU"'
label define firmsize_lbl 1 `"Under 10"', add
label define firmsize_lbl 2 `"10 to 24"', add
label define firmsize_lbl 3 `"Under 25"', add
label define firmsize_lbl 4 `"10 to 49"', add
label define firmsize_lbl 5 `"25 to 99"', add
label define firmsize_lbl 6 `"50 to 99"', add
label define firmsize_lbl 7 `"100 to 499"', add
label define firmsize_lbl 8 `"500 to 999"', add
label define firmsize_lbl 9 `"1000+"', add
label values firmsize firmsize_lbl

label define inclugh_lbl 0 `"NIU"'
label define inclugh_lbl 1 `"No"', add
label define inclugh_lbl 2 `"Yes"', add
label values inclugh inclugh_lbl

label define hinscaid_lbl 1 `"Not covered"'
label define hinscaid_lbl 2 `"Covered"', add
label values hinscaid hinscaid_lbl

label define union_lbl 0 `"NIU"'
label define union_lbl 1 `"No union coverage"', add
label define union_lbl 2 `"Member of labor union"', add
label define union_lbl 3 `"Covered by union but not a member"', add
label values union union_lbl



*Drop people who are unemployed or self-employed
drop if occ90ly == 999
drop if occ90ly == 991

*Restrict sample to 18 to 65
drop if (age < 18) | (age >65)


*Simon considers firms < 25 to be small firms and firms > 100 to be large.
*She excludes firms with 25 to 99 workers since different states have different definitions of "small firms," with some using 25 as the cutoff and others using 50

***Potential model limitation***
*CPS questionnaire asks individuals about the size of their employer firm in terms of bins (10 to 24, 25 to 99, etc). Ideally, we would want to only exclude 25 to 50 to retain as many individuals as possible. However, the bins don't allow for that range. The closest we can get is excluding firms with 25 to 99 workers, which is what Simon (2005) does. 

*To avoid conflicting definitons of "small firm" we drop workers from firms with [25,99]. This is inclusive of varying defintions by state.
drop if firmsize == 5

*Create a dummy variable for small firms (# employees < 25)
gen small_firm = firmsize < 5

*Similar process for large firms (# employees > 100)
gen large_firm = firmsize >= 7

*Simon codes states as being a reform state if they enacted reform in year t - 2. This accounts for individuals being able to purchase the insurance in year t - 1.*

**# Coding Reforms

*First, generate variable if state ever had full reform
*Following states implemented full reform at some point from 1991-1996:
*AK,CA,CO,CT,DE,FL,IA,ID,KS,KY,LA,MA,MD,ME,MN,MO,MT,NC,ND,NE,NH,NJ,NM,NY,OH,OK,RI,SC,SD,TN,TX,VA,VT,WA,WY
*Code generated from Python
gen r1 = statefip == 2 | statefip == 6 | statefip == 8 | statefip == 9 | statefip == 10 | statefip == 12 | statefip == 19 | statefip == 16 | statefip == 20 | statefip == 21 | statefip == 22 | statefip == 25 | statefip == 24 | statefip == 23 | statefip == 27 | statefip == 29 | statefip == 30 | statefip == 37 | statefip == 38 | statefip == 31 | statefip == 33 | statefip == 34 | statefip == 35 | statefip == 36 | statefip == 39 | statefip == 40 | statefip == 44 | statefip == 45 | statefip == 46 | statefip == 47 | statefip == 48 | statefip == 51 | statefip == 50 | statefip == 53 | statefip == 56


*Next, generate variable if state ever had partial reform
*Code generated from Python
gen r2 = statefip == 5 | statefip == 4 | statefip == 8 | statefip == 10 | statefip == 12 | statefip == 19 | statefip == 13 | statefip == 17 | statefip == 18 | statefip == 20 | statefip == 22 | statefip == 23 | statefip == 29 | statefip == 28 | statefip == 38 | statefip == 31 | statefip == 33 | statefip == 35 | statefip == 40 | statefip == 41 | statefip == 45 | statefip == 46 | statefip == 49 | statefip == 55 | statefip == 54 


*Next, generate variable if state ever had barebones reform

gen r3 = statefip == 5 | statefip == 4 | statefip == 8 | statefip == 9 | statefip == 10 | statefip == 12 | statefip == 13 | statefip == 19 | statefip == 16 | statefip == 17 | statefip == 20 | statefip == 21 | statefip == 25 | statefip == 24 | statefip == 27 | statefip == 29 | statefip == 28 | statefip == 30 | statefip == 37 | statefip == 38 | statefip == 31 | statefip == 34 | statefip == 35 | statefip == 32 | statefip == 40 | statefip == 41 | statefip == 44 | statefip == 47 | statefip == 51 | statefip == 53 | statefip == 55 | statefip == 54 | statefip == 56 


*Generating post1 variable. This indicates whether full reform was active in a given state in a given year
gen post1 = (statefip == 2 & (year >= 1994 & year <= 1996)) |(statefip == 6 & (year >= 1994 & year <= 1996)) |(statefip == 8 & (year >= 1996 & year <= 1996)) |(statefip == 9 & (year >= 1992 & year <= 1996)) |(statefip == 10 & (year >= 1994 & year <= 1996)) |(statefip == 12 & (year >= 1994 & year <= 1996)) |(statefip == 16 & (year >= 1994 & year <= 1996)) |(statefip == 19 & (year >= 1993 & year <= 1996)) |(statefip == 20 & (year >= 1993 & year <= 1996)) |(statefip == 21 & (year >= 1996 & year <= 1996)) |(statefip == 22 & (year >= 1995 & year <= 1996)) |(statefip == 23 & (year >= 1994 & year <= 1996)) |(statefip == 24 & (year >= 1995 & year <= 1996)) |(statefip == 25 & (year >= 1992 & year <= 1996)) |(statefip == 27 & (year >= 1994 & year <= 1996)) |(statefip == 29 & (year >= 1995 & year <= 1996)) |(statefip == 30 & (year >= 1994 & year <= 1996)) |(statefip == 31 & (year >= 1995 & year <= 1996)) |(statefip == 33 & (year >= 1996 & year <= 1996)) |(statefip == 34 & (year >= 1995 & year <= 1996)) |(statefip == 35 & (year >= 1996 & year <= 1996)) |(statefip == 36 & (year >= 1994 & year <= 1996)) |(statefip == 37 & (year >= 1992 & year <= 1996)) |(statefip == 38 & (year >= 1995 & year <= 1996)) |(statefip == 39 & (year >= 1993 & year <= 1996)) |(statefip == 40 & (year >= 1995 & year <= 1996)) |(statefip == 44 & (year >= 1993 & year <= 1996)) |(statefip == 45 & (year >= 1996 & year <= 1996)) |(statefip == 46 & (year >= 1996 & year <= 1996)) |(statefip == 47 & (year >= 1994 & year <= 1996)) |(statefip == 48 & (year >= 1995 & year <= 1996)) |(statefip == 50 & (year >= 1993 & year <= 1996)) |(statefip == 51 & (year >= 1994 & year <= 1996)) |(statefip == 53 & (year >= 1994 & year <= 1996)) |(statefip == 56 & (year >= 1993 & year <= 1996))

*Generating post2 variable. This indicates whether partial reform  was active in a given state in a given year
gen post2 = (statefip == 4 & (year >= 1994 & year <= 1996)) |(statefip == 5 & (year >= 1992 & year <= 1996)) |(statefip == 8 & (year >= 1995 & year <= 1995)) |(statefip == 10 & (year >= 1992 & year <= 1993)) |(statefip == 12 & (year >= 1992 & year <= 1993)) |(statefip == 13 & (year >= 1992 & year <= 1996)) |(statefip == 17 & (year >= 1995 & year <= 1996)) |(statefip == 18 & (year >= 1993 & year <= 1996)) |(statefip == 19 & (year >= 1992 & year <= 1992)) |(statefip == 20 & (year >= 1992 & year <= 1992)) |(statefip == 22 & (year >= 1992 & year <= 1994)) |(statefip == 23 & (year >= 1991 & year <= 1993)) |(statefip == 28 & (year >= 1996 & year <= 1996)) |(statefip == 29 & (year >= 1994 & year <= 1994)) |(statefip == 31 & (year >= 1992 & year <= 1994)) |(statefip == 33 & (year >= 1994 & year <= 1995)) |(statefip == 35 & (year >= 1992 & year <= 1995)) |(statefip == 38 & (year >= 1992 & year <= 1994)) |(statefip == 40 & (year >= 1993 & year <= 1994)) |(statefip == 41 & (year >= 1992 & year <= 1996)) |(statefip == 45 & (year >= 1992 & year <= 1995)) |(statefip == 46 & (year >= 1992 & year <= 1995)) |(statefip == 49 & (year >= 1996 & year <= 1996)) |(statefip == 54 & (year >= 1992 & year <= 1996)) |(statefip == 55 & (year >= 1993 & year <= 1996)) 

*Generating post23 variable. This indicates whether barebones reform  was active in a given state in a given year
gen post3 = (statefip == 4 & (year >= 1992 & year <= 1996)) |(statefip == 5 & (year >= 1993 & year <= 1996)) |(statefip == 8 & (year >= 1992 & year <= 1996)) |(statefip == 9 & (year >= 1992 & year <= 1996)) |(statefip == 10 & (year >= 1994 & year <= 1996)) |(statefip == 12 & (year >= 1994 & year <= 1996)) |(statefip == 13 & (year >= 1994 & year <= 1996)) |(statefip == 16 & (year >= 1996 & year <= 1996)) |(statefip == 17 & (year >= 1992 & year <= 1994)) |(statefip == 19 & (year >= 1992 & year <= 1996)) |(statefip == 20 & (year >= 1993 & year <= 1996)) |(statefip == 21 & (year >= 1991 & year <= 1996)) |(statefip == 24 & (year >= 1992 & year <= 1996)) |(statefip == 25 & (year >= 1992 & year <= 1996)) |(statefip == 27 & (year >= 1994 & year <= 1996)) |(statefip == 28 & (year >= 1993 & year <= 1996)) |(statefip == 29 & (year >= 1992 & year <= 1996)) |(statefip == 30 & (year >= 1992 & year <= 1996)) |(statefip == 31 & (year >= 1992 & year <= 1996)) |(statefip == 32 & (year >= 1992 & year <= 1996)) |(statefip == 34 & (year >= 1992 & year <= 1996)) |(statefip == 35 & (year >= 1992 & year <= 1996)) |(statefip == 37 & (year >= 1993 & year <= 1996)) |(statefip == 38 & (year >= 1992 & year <= 1996)) |(statefip == 40 & (year >= 1991 & year <= 1996)) |(statefip == 41 & (year >= 1992 & year <= 1996)) |(statefip == 44 & (year >= 1991 & year <= 1996)) |(statefip == 47 & (year >= 1994 & year <= 1996)) |(statefip == 51 & (year >= 1991 & year <= 1996)) |(statefip == 53 & (year >= 1993 & year <= 1996)) |(statefip == 54 & (year >= 1992 & year <= 1996)) |(statefip == 55 & (year >= 1993 & year <= 1996)) |(statefip == 56 & (year >= 1993 & year <= 1996))


*Classify individuals who were included in their employers health plan in the previous year
drop if inclugh == 0
gen inc_health = inclugh == 2


*State fixed effects
xi: reg inc_health i.statefip

*state by year
xi: reg inc_health i.statefip*i.year


*Generating interaction variables
*Small firm workers, state with full reform, reform is active in given year = 1
gen rpost1 = r1*post1*small_firm

*Small firm workers, state with partial reform, reform is active in given year = 1
gen rpost2 = r2*post2*small_firm

*Small firm workers, state with barebones reform, reform is active in given year = 1
gen rpost3 = r3*post3*small_firm

**#
gen cov = rpost1 * rpost2 * rpost3
*Regression
*Outcome: Included in employer's health insurance plan in the previous year
*Variables: (full reform state, reform active), (partial reform state, reform active), (barebones reform state, reform active), works for a small firm (< 25 employees), state by year fixed effects

*xi: reg inc_health rpost1 rpost2 rpost3  small_firm i.statefip i.year

*xi: probit inc_health rpost1 rpost2 rpost3  small_firm i.statefip i.year

**# Actual Regression

*Merge Fatality Rate Data
merge m:1 occ90ly using total_emp, generate(death)

**# Summary Statistics
*Calculating demographic means accross three levels of reform, comparing before and after the reform took place
*Variables of interest include: average age, average level of education, average income/wage, % white/nonwhite, % married, % union membership, and % of residents working in risky occupations



*Drop values where fatality rate is missing
drop if f_rate == .

*There are 282 unique occupations in the sample
codebook occ90ly

*Summarize fatality rates and get percentiles for thresholds
summarize f_rate, detail


*Classifying white/nonwhite 
gen white = (race == 100)

*Married 

gen married = (marst == 1 | marst == 2)



*Next time: continue tabbing summary statistics:

*Treatment Group: Worker in treatment state who works a risky job
*Defining risky occupation if fatality rate is higher than the median


gen risk_occ = (f_rate > 2.96)

*Resubmitted IPUMS extract to include union membership, education



***Risky occupations by reform/non reform before/after

**Barebones Reform before/after
*reminder: ri variable == 1 if the given state ever had i reform. posti == 1 if i reform is active within the given state in the given year

*Before
summarize risk_occ if (r1 == 1 & post1 == 0)

*After
*reminder: rposti is the interaction between ri and posti and == 1
summarize risk_occ if rpost1 == 1



**Partial Reform before/after
*Before
summarize risk_occ if (r2 == 1 & post2 == 0)

*After
summarize risk_occ if rpost2 == 1


**Full Reform before/after
*Before
summarize risk_occ if (r3 == 1 & post3 == 0)

*After
summarize risk_occ if rpost3 == 1

*** Age 

**Barebones
*Before
summarize age if (r1 == 1 & post1 == 0)

*After
*reminder: rposti is the interaction between ri and posti and == 1
summarize age if rpost1 == 1



**Partial Reform before/after
*Before
summarize age if (r2 == 1 & post2 == 0)

*After
summarize age if rpost2 == 1


**Full Reform before/after
*Before
summarize age if (r3 == 1 & post3 == 0)

*After
summarize age if rpost3 == 1



***Union
gen union_cov = (union == 2) | (union == 3)
*Includes workers who are union members or covered by a union, despite not being members themselves

**Barebones
*Before
summarize union_cov if (r1 == 1 & post1 == 0)

*After
*reminder: rposti is the interaction between ri and posti and == 1
summarize union_cov if rpost1 == 1



**Partial Reform before/after
*Before
summarize union_cov if (r2 == 1 & post2 == 0)

*After
summarize union_cov if rpost2 == 1


**Full Reform before/after
*Before
summarize union_cov if (r3 == 1 & post3 == 0)

*After
summarize union_cov if rpost3 == 1



***Married

**Barebones
*Before
summarize married if (r1 == 1 & post1 == 0)

*After
*reminder: rposti is the interaction between ri and posti and == 1
summarize married if rpost1 == 1


**Partial Reform before/after
*Before
summarize married if (r2 == 1 & post2 == 0)

*After
summarize married if rpost2 == 1


**Full Reform before/after
*Before
summarize married if (r3 == 1 & post3 == 0)

*After
summarize married if rpost3 == 1


*** Wage


**Barebones
*Before
summarize incwage if (r1 == 1 & post1 == 0)

*After
*reminder: rposti is the interaction between ri and posti and == 1
summarize incwage if rpost1 == 1


**Partial Reform before/after
*Before
summarize incwage if (r2 == 1 & post2 == 0)

*After
summarize incwage if rpost2 == 1


**Full Reform before/after
*Before
summarize incwage if (r3 == 1 & post3 == 0)

*After
summarize incwage if rpost3 == 1



**# Regression: Coverage Rates for Workers in Risky Occupations
drop if year > 1998
*Regression to include the entire sample

gen lnwage = ln(incwage)
drop if lnwage == .

gen age2 = age*age

xi: probit inc_health rpost1 rpost2 rpost3  small_firm union age age2 married lnwage i.statefip i.year



*Regression including only workers in risky occupations (fatality rate above median)
**#

xi: probit inc_health rpost1 rpost2 rpost3  small_firm  union age lnwage married i.statefip i.year if risk_occ == 1


*Try changing the risk cutoff. 75th percentile

gen risk_occ2 = (f_rate > 5.74)

xi: probit inc_health rpost1 rpost2 rpost3  small_firm  union age lnwage married i.statefip i.year if risk_occ2 == 0


*90th percentile
gen risk_occ3 = (f_rate > 10.97)

*Try interacting fatality rate with rpost1

gen sm_riskpost1 = rpost1 * risk_occ

gen sm_riskpost2 = rpost2 * risk_occ

gen sm_riskpost3 = rpost3 * risk_occ


*Interaction between risky and small_firm

gen risk_small = risk_occ * small_firm


*Interacting risky with just post 

gen riskpost1 = r1*post1*risk_occ
gen riskpost2 = r2*post2*risk_occ
gen riskpost3 = r3*post3*risk_occ





*Add in more interactions:
*Regression  should include interaction terms and individual variables
*Ex: Reform, risky occupation, small firms
* Reform*risky*small, reform*risky, reform*small, risky*small_firm

**#
xi: probit inc_health sm_riskpost1 sm_riskpost2 sm_riskpost3 rpost1 rpost2 rpost3 riskpost1 riskpost2 riskpost3 risk_small small_firm f_rate union age age2 lnwage i.statefip i.year


*New way of generating quartiles
*xtile creates a new variable based on a specified number of quantiles
xtile f_cat = f_rate, nq(4)

xi: probit inc_health sm_riskpost1 sm_riskpost2 sm_riskpost3 rpost1 rpost2 rpost3 riskpost1 riskpost2 riskpost3 risk_small small_firm risk_occ union age age2 lnwage i.statefip i.year, vce(robust)









