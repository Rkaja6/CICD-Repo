create view V_DownTime
as
select 
	dtr.ObjectMerrickID as MerrickID, 
	lmot.Description,
	case 
		when lmot.Description = 'Completion' then c.WellPlusCompletionName
		when lmot.Description = 'Equipment' then e.EquipmentName
		when lmot.Description = 'Tank' then t.TankName
		else 'Unknown'
	end as UnitName,
	dc.DowntimeDescription,
	dtr.DowntimeHours,
	DATEADD(d,-1,dtr.OriginalDateEntered) as DowntimeDate,
	case 
		when dtr.Comments = 'NULL' then null
		when dtr.Comments = '' then null
		else dtr.Comments
	end as Comments,
	case
		when dtr.Reason = 'NULL' then null
		when dtr.Reason = '' then null
		else dtr.Reason
	end as Reason
from DownTimeReasonTb dtr
left join ListMerrickObjectTypesTb lmot
on lmot.Value = dtr.ObjectType
left join CompletionTb c
on c.MerrickID = dtr.ObjectMerrickID
and lmot.Description = 'Completion'
left join EquipmentTb e
on e.MerrickID = dtr.ObjectMerrickID
and lmot.Description = 'Equipment'
left join TankTb t
on t.MerrickID = dtr.ObjectMerrickID
and lmot.Description = 'Tank'
left join DowntimeCodeTb dc
on dc.DowntimeCode = dtr.DowntimeCode