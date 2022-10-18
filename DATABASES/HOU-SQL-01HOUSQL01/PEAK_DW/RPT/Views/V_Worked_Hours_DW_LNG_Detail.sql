Create View RPT.[V_Worked_Hours_DW_LNG_Detail]
as 
select 
	 EOMONTH(hr.date) as month,
	 round(sum(hr.workedHours),0) as hrs_sum,
	 cnt.headcount,
	 hr.workertype,
	 hr.department
from rpt.Worked_Hours_Detail hr
left join
(
select 
	month, count(*) as headcount, WorkerType, Department
from 
(
select distinct 
	EOMONTH(date) as month,
	EmployeeID as WorkdayID,
	WorkerType,
	Department
from rpt.Worked_Hours_Detail
where Department = 'Driftwood LNG'
and year(date) = 2022
) A
group by month, workertype, department) cnt
on eomonth(hr.date) = cnt.month and
	hr.WorkerType = cnt.WorkerType and
	hr.Department = cnt.Department
where hr.Department = 'Driftwood LNG'
and year(hr.date) = 2022
group by EOMONTH(hr.date), hr.workertype, hr.department, cnt.headcount