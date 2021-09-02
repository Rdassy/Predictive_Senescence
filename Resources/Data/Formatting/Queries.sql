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