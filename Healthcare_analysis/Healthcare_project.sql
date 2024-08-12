show databases;

create database Healthcare;
use Healthcare;

show tables;

select count(*) from healthcare_data;
select * from healthcare_data;

### EDA 

desc healthcare_data;

# Check the null values

select count(*) from healthcare_data
where age = '';

select cast(avg(age) as decimal(10,0)) as Average_age
from healthcare_data where age is not null;

set sql_safe_updates = 0;

with Avg_age as (
select avg(age) as Average_age
from healthcare_data
where age is not null)
update healthcare_data
set age = (select Average_age from avg_age)
where age = '';

------------------------------------
# count of Ethnicity 

select Ethnicity, count(*) as total_count
from healthcare_data
group by Ethnicity
order by total_count desc;

# Fill the null value using mode. mode == 'Black'

update healthcare_data
set Ethnicity = 'Black'
where Ethnicity = '';


--------------------------------

select * from healthcare_data;

select Socioeconomic_Status, count(*) as total_count
from healthcare_data
group by Socioeconomic_Status
order by total_count desc;

# fill the missing value using mode. mode = 'High'

update healthcare_data
set Socioeconomic_Status = 'High'
where Socioeconomic_Status = '';


-----------------------------------------

select * from healthcare_data;

desc healthcare_data;

# drop unwanted columns 

alter table healthcare_data
drop column Chronic_Illness_History;

alter table healthcare_data
drop column vital_Signs, 
drop column Imaging_Results,
drop column Complications,
drop column Use_of_Apps;


alter table healthcare_data
drop column Lab_Test_Results,
drop column Engagement_level, 
drop column Compliance, 
drop column care_coordination;

alter table healthcare_data
drop column Adherence;

-----------------------------------------------



select Geographic_Location, count(*) as total_count
from healthcare_data
group by Geographic_Location
order by total_count desc;

# fill the null value using mode. mode = 'Urban'

update healthcare_data
set Geographic_Location = 'Urban'
where Geographic_Location = '';


---------------------------------------------------

select * from healthcare_data;

select Insurance_Status, count(*) as total_count
from healthcare_data
group by Insurance_Status
order by total_count desc;


update healthcare_data
set Insurance_Status = 'Yes'
where Insurance_Status = '';


------------------------------------------------------

select * from healthcare_data;



select family_medical_history, count(*) as total_count
from healthcare_data
group by family_medical_history
order by total_count desc;

# mode of 'family medical history' > Heart Disease

select past_medical_condition, count(past_medical_condition) as total_count
from healthcare_data
group by past_medical_condition
order by total_count desc;

# mode of 'past medical condition' > Hypertension

select previous_surgeries, count(*) as total_count
from healthcare_data
group by previous_surgeries
order by total_count desc;

# mode of 'previous surgeries' > Yes

select Allergies, count(*) as total_count
from healthcare_data
group by Allergies
order by total_count desc;

# mode of 'Allergies' > None

select Dietary_Habits, count(*) as total_count
from healthcare_data
group by Dietary_Habits
order by total_count desc;

# mode of 'Dietary_Habits' > High-carb diet

select Physical_Activity, count(*) as total_count
from healthcare_data
group by Physical_Activity
order by total_count desc;

# mode of physical activity > Moderate

select Sleep_Patterns, count(*) as total_count
from healthcare_data
group by Sleep_Patterns
order by total_count desc;

# mode of sleep patterns > Normal

select Substance_Use, count(*) as total_count
from healthcare_data
group by Substance_Use
order by total_count desc;

# mode of substance_use > None

select Stress_levels, count(*) as total_count
from healthcare_data
group by Stress_levels
order by total_count desc;

# mode of stress level > Moderate

select Medication_type, count(*) as total_count
from healthcare_data
group by Medication_type
order by total_count desc;

# mode of medication type > Insulin

select Dosage, count(*) as total_count
from healthcare_data
group by Dosage
order by total_count desc;

# mode of Dosage > 30u

select Side_effects, count(*) as total_count
from healthcare_data
group by Side_effects
order by total_count desc;

# mode of side effects > None

select Symptoms, count(*) as total_count
from healthcare_data
group by Symptoms
order by total_count desc;

# mode of symptoms > Fatigue

select Mental_health, count(*) as total_count
from healthcare_data
group by Mental_health
order by total_count desc;

# mode of mental health > Good

select Social_support, count(*) as total_count
from healthcare_data
group by Social_support
order by total_count desc;

# mode of social support > High

select Quality_of_life, count(*) as total_count
from healthcare_data
group by Quality_of_life
order by total_count desc;

# mode of quality of life > Good

select * from healthcare_data;

select avg(cost_of_treatment) from healthcare_data;

with average_of_cost as (
select cast(avg(cost_of_treatment) as decimal(10,0)) as average
from healthcare_data
where cost_of_treatment is not null)
update healthcare_data
set cost_of_treatment = (select average from average_of_cost)
where cost_of_treatment = '';



select * from healthcare_data;


------------------------------------------------------------------

# Filling all remaining misssing values at a time 

update healthcare_data
set family_medical_history = case when family_medical_history = '' then 'Heart Disease' else family_medical_history end,
    past_medical_condition = case when past_medical_condition = '' then 'Hypertension' else past_medical_condition end;


update healthcare_data
set Previous_surgeries = case when Previous_surgeries = '' then 'Yes' else Previous_surgeries end,
    Allergies = case when Allergies = '' then 'None' else Allergies end,
    Dietary_Habits = case when Dietary_Habits = '' then 'High-carb_diet' else Dietary_Habits end, 
    Physical_Activity = case when Physical_Activity = '' then 'Moderate' else Physical_Activity end, 
    sleep_patterns = case when sleep_patterns = '' then 'Normal' else sleep_patterns end, 
    substance_use = case when substance_use = '' then 'None' else substance_use end, 
    stress_levels = case when stress_levels = '' then 'Moderate' else stress_levels end, 
    medication_type = case when medication_type = '' then 'Insulin' else medication_type end, 
    dosage = case when dosage = '' then '30u' else dosage end, 
    side_effects = case when side_effects = '' then 'None' else side_effects end, 
    symptoms = case when symptoms = '' then 'Fatigue' else symptoms end, 
    mental_health = case when mental_health = '' then 'Good' else mental_health end, 
    social_support = case when social_support = '' then 'High' else social_support end, 
    quality_of_life = case when quality_of_life = '' then 'Good' else quality_of_life end;
    
    
    -----------------------------------------------------------------------------------
    
    
    select * from healthcare_data;
    














