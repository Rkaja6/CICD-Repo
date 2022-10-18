
create view [dbo].[V_CHECK_UID_STG] as 
select top 100 percent 
	A.*
from [dbo].[V_Combined_STG] A
inner join
(
select [UID], ROUND([Base 50th Percentile],0) as base_salary, count( *) as [rowcount]
from 
	(Select Distinct [UID], [Base 25th Percentile], [Base 50th Percentile], [Base 75th Percentile], [Base 90th Percentile]
	FROM [dbo].[V_Combined_STG]
	) AA
group by [uid], ROUND([Base 50th Percentile],0) having COUNT(*)>1
) B on A.UID = B.UID
order by A.uid