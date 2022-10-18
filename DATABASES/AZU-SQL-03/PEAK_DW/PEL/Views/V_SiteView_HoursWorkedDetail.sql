






create view [PEL].[V_SiteView_HoursWorkedDetail]
as
select 
	jr.dttmend as Date,
	pc.headcount as total_headcount,
	COALESCE(pc.durationworkreg * pc.headcount * 24,0) + COALESCE(pc.durationworkot * pc.headcount * 24,0) as worked_hours,
	pc.Company,
	pc.companytyp as CompanyType,
	j.typ1 as JobType,
	j.typ2 as JobSubType,
	j.dttmstart as JobStartDate,
	j.dttmend as JobEndDate,
	s.SiteName,
	j.ProjectName,
	j.contact1 as JobContact
from sv50.dbo.svt_svjobreportpersonnelcount pc
inner join sv50.dbo.svt_svjobreport jr
on jr.idrec = pc.idrecparent
inner join sv50.dbo.svt_svjob j
on j.idrec = jr.idrecparent
inner join sv50.dbo.svt_svsiteheader s
on pc.idsite = s.idsite
where pc.company not like 'Tellurian%'
and jr.dttmend is not null