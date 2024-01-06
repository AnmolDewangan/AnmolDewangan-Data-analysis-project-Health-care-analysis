create database healthcare;
use healthcare;
select * from healthcare.new;
#__________________________________________________________________________________________________________

# 1. Number of Patients across various summaries
select sum(`patients included in the transfusion summary`) as transfusion_summary,
sum(`patients in serum phosphorus summary`) as Phosphorus_summary,
sum(`patients included in hospitalization summary`) as hospitalization_summary,
sum(`patients included in survival summary`) as survival_summary,
sum(`patients included in fistula summary`) as fistula_summary,
sum(`patients in long term catheter summary`)as catheter_summary,
sum(`patients in npcr summary`) as npcr_summary ,
sum(`patients in hypercalcemia summary`) as hypercalcemia_summary from `healthcare`.`new`;
#_________________________________________________________________________________________________________________
 
 #2 Profit Vs Non-Profit Stats
 
select count(case when `Profit or Non-Profit` ="Profit" then `profit or non-profit` end ) as profit ,
count(case when `profit or Non-Profit`="non Profit" then `profit or non-profit` end) as non_profit from `healthcare`.`new`;
#____________________________________________________________________________________________________________________________

#3 Chain Organizations w.r.t. Total Performance Score as No Score

SELECT 
    `Chain Organization`,
    SUM(`total performance score`) AS total_performance_score
FROM
    `healthcare`.`dialysisa (1)`
GROUP BY `Chain Organization`
ORDER BY total_performance_score DESC;
#___________________________________________________________________________________________________________

#4 Dialysis Stations Stats

SELECT 
    `Facility Name`, SUM(`# of Dialysis Stations`) AS Total_DS
FROM
    `healthcare`.`new`
GROUP BY `Facility Name`
ORDER BY Total_DS DESC
LIMIT 5;
#____________________________________________________________________________________________________-

#5 # of Category Text  - As Expected
select count( case when `Patient hospitalization category text`="As Expected" then `Patient hospitalization category text` end) as Hospitalization, 
count( case when `Patient Survival Category Text`="As Expected" then  `Patient Survival Category Text` end) as Survival, 
count( case when `Patient Infection category text`="As Expected" then  `Patient Infection category text` end) as Infection,
count( case when `Fistula Category Text`="As Expected" then  `Fistula Category Text` end) as Fistula,
count( case when `SWR category text`="As Expected" then  `SWR category text` end) as SWR,
count( case when `PPPW category text`="As Expected" then  `PPPW category text` end) as PPPW,
count( case when `Patient Transfusion category text`="As Expected" then  `Patient Transfusion category text` end) as Transfusion
from `healthcare`.`new`;
#____________________________________________________________________________________________________________________

#6 Average Payment Reduction Rate

select round(Avg(`PY2020 Payment Reduction Percentage`)*100,1) as Payment_Reduction_Rate from `healthcare`.`dialysisa (1)`;

#_____________________________________________________________________________________________________________________







