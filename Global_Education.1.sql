-- ------------------------Build a database

create database if not exists global_education;

-- ----------------- Create table and insert the data and make sure there is not null values.

create table if not exists education(Countries_and_areas varchar(20) not null primary key,

Latitude float(8,5) not null,
Longitude float(8,5) not null,
OOSR_Pre0Primary_Age_Male int not null,
OOSR_Pre0Primary_Age_Female int not null,
OOSR_Primary_Age_Male int not null,
OOSR_Primary_Age_Female int not null,
OOSR_Lower_Secondary_Age_Male int not null,
OOSR_Lower_Secondary_Age_Female int not null,
OOSR_Upper_Secondary_Age_Male int not null,
OOSR_Upper_Secondary_Age_Female int not null, Completion_Rate_Primary_Male int not null,
Completion_Rate_Primary_Female int not null, Completion_Rate_Lower_Secondary_Male int not null,Completion_Rate_Lower_Secondary_Female int not null,Completion_Rate_Upper_Secondary_Male int not null,
Completion_Rate_Upper_Secondary_Female int not null, Grade_2_3_Proficiency_Reading int not null,Grade_2_3_Proficiency_Math int not null,
Primary_End_Proficiency_Reading int not null,
Primary_End_Proficiency_Math int not null, Lower_Secondary_End_Proficiency_Reading int not null, Lower_Secondary_End_Proficiency_Math int not null,
Youth_15_24_Literacy_Rate_Male int not null, Youth_15_24_Literacy_Rate_Female int not null, Birth_Rate float(5,2) not null, Gross_Primary_Education_Enrollment float (5,2)not null,
Gross_Tertiary_Education_Enrollment float(5,2) not null, Unemployment_Rate float(5,2) not null

);
 -- -------------------------------
 -- -------------------------------How many unique countries does the data have?
 select distinct countries_and_areas from education;
 
 -- ----------Which country has the higher education enrollment rate?
 
 select Countries_and_areas, Gross_Primary_Education_Enrollment from
 education
 group by  Countries_and_areas
 order by Gross_Primary_Education_Enrollment desc;
 
  -- ----------Which country has the lowest education primary enrollment rate?
  
select count( Countries_and_areas),Countries_and_areas from
 education
 where Gross_Primary_Education_Enrollment = 0.00
 group by  Countries_and_areas
 order by Gross_Primary_Education_Enrollment asc;

-- ----------------- Which country has the higher rate of male people out of school in pre primary years?

-- ----  higher rate out school per country, in pre-primary years. "Male"

select Countries_and_areas,OOSR_Pre0Primary_Age_Male from
 education
 group by  Countries_and_areas
 order by OOSR_Pre0Primary_Age_Male desc;
 
 -- ---- What is the the lowest completion per male?
 
 select Countries_and_areas, OOSR_Pre0Primary_Age_Male from
 education
 where OOSR_Pre0Primary_Age_Male = 0
 group by  Countries_and_areas
 order by OOSR_Pre0Primary_Age_Male asc;
 
-- ----  What is the the higher completion per female? thos code can be apply for male/female also

select Completion_Rate_Primary_Female, Countries_and_areas from
 education
 group by  Countries_and_areas
 order by Completion_Rate_Primary_Female desc;
-- ---- What is the the lowest completion per female?
 
 select Completion_Rate_Lower_Secondary_Female, Countries_and_areas from
 education
 where Completion_Rate_Lower_Secondary_Female 
 group by  Countries_and_areas
 order by Completion_Rate_Lower_Secondary_Female desc; 
 -- ---------------------- Which countries have the higher Unployment rate according to lower rate completion?
 
 select Unemployment_Rate, Countries_and_areas from education
 group by Completion_Rate_Lower_Secondary_Male
 order by Unemployment_Rate desc;

 