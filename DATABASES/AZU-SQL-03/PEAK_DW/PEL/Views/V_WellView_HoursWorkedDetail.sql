

create view [PEL].[V_WellView_HoursWorkedDetail]
as
select 
	jr.dttmend as Date,
	pc.headcount as total_headcount,
	COALESCE(pc.durationworkreg * pc.headcount * 24,0) + COALESCE(pc.durationworkot * pc.headcount * 24,0) as worked_hours,
	pc.Company,
	pc.companytyp as CompanyType,
	j.jobtyp as JobType,
	j.jobsubtyp as JobSubType,
	j.wvtyp as JobWVType,
	j.dttmstart as JobStartDate,
	j.dttmend as JobEndDate,
	w.wellname,
	coalesce(J.objective, J.objectivegeo) AS Objective
from wv100.dbo.wvt_wvjobreportpersonnelcount pc
inner join wv100.dbo.wvt_wvjobreport jr
on jr.idrec = pc.idrecparent
inner join wv100.dbo.wvt_wvjob j
on j.idrec = jr.idrecparent
inner join wv100.dbo.wvt_wvwellheader w
on pc.idwell = w.idwell
where pc.company not like 'Tellurian%'
and jr.dttmend is not null