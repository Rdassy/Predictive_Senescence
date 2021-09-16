--Create a table with Human ID, Age and RTL
select t.ID,
b.LA019 as Age,
t.FINAL_T_S as RTL
into Human_Age_vs_Telo
from human_bio_raw as b
inner join human_telomere_raw as t
on b.HHID = t.HHID
AND b.PN = t.PD
order by b.LA019;


-- select * from Human_Age_vs_Telo
-- drop table Human_Age_vs_Telo


--Create a table with bird ID, Age and RTL
select d.BirdID as "Bird ID", d.AgeY as "Age", d.RTL as "RTL" 
into Bird_Age_vs_Telo
from birds_data_raw as d
order by d.BirdID;

-- Select * from bird_age_vs_telo

-- Drop Human Data -- unusable
drop table human_telomere_raw, human_bio_raw, human_age_vs_telo


-- select * from birds_data_raw

-- Make Bird_Territories_Data Table
select d.birdid, AVG(d.sex)::numeric(10,0) as Sex, AVG(d.agey)::numeric(10,2) as Age, AVG(rtl)::numeric(10,2) as RTL, Max(d.terr)::numeric(10,2) as Territory, Max(d.brf)::numeric(10,0) as Dominant_Female, Max(d.brm)::numeric(10,0) as Dominant_Male
into Bird_Territories_Data
from birds_data_raw as d
group by d.birdid
order by d.birdid;

-- drop table Bird_Territories_Data

-- select * from Bird_Territories_Data
-- order by Bird_Territories_Data.Territory;


-- select * from bird_age_vs_telo

-- Make Territory_vs_Age Table
select x.territory, AVG(x.rtl)::numeric(10,2) as Average_RTL, AVG(x.age)::numeric(10,2) as "Average_Age"
into Territory_vs_Age
from bird_territories_data as x
group by x.territory
order by x.territory;

select * from Territory_vs_Age

-- Make Dominant_Female_vs_Age Table
select x.Dominant_Female, AVG(x.rtl)::numeric(10,2) as Average_RTL, AVG(x.age)::numeric(10,2) as "Average_Age"
into Dominant_Female_vs_Age
from bird_territories_data as x
group by x.Dominant_Female
order by x.Dominant_Female;

select * from Dominant_Female_vs_Age

-- Make Dominant_Male_vs_Age Table
select x.Dominant_Male, AVG(x.rtl)::numeric(10,2) as Average_RTL, AVG(x.age)::numeric(10,2) as "Average_Age"
into Dominant_Male_vs_Age
from bird_territories_data as x
group by x.Dominant_Male
order by x.Dominant_Male;

select * from Dominant_Male_vs_Age

-- Make Mum_vs_Age Table
select x.Mum, AVG(x.rtl)::numeric(10,2) as Average_RTL, AVG(x.agey)::numeric(10,2) as Average_Age
into Mum_vs_Age
from birds_data_raw as x
group by x.Mum
order by x.Mum;

select * from Mum_vs_Age

-- Make Dad_vs_Age Table
select x.Dad, AVG(x.rtl)::numeric(10,2) as Average_RTL, AVG(x.agey)::numeric(10,2) as Average_Age
into Dad_vs_Age
from birds_data_raw as x
group by x.Dad
order by x.Dad;

select * from Dad_vs_Age