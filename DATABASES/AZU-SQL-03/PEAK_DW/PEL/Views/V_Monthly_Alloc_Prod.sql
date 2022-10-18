






create view [PEL].[V_Monthly_Alloc_Prod]
as
select 
	f.name as FlowNetworkName,
	u.NAME as UnitName, 
	am.DTTMSTART as Month_Start_Date,
	am.DTTMEND as Month_End_Date,
	am.VolProdAllocOil,
	am.VolProdAllocGas,
	am.VolProdAllocWater,
	am.VolProdGathGas,
	am.VolProdGathWater,
	am.VolLostGas,
	am.VolDispSaleGas,
	am.VolDispFuelGas,
	am.WIGAS/100 as WorkingInterest,
	am.NRIGAS/100 AS Gas_NRI,
	COALESCE(p.PRESTUB, Nonop_Pressures.PRESTUB) as Tubing_Pressure,
	COALESCE(p.PRESUSER2, Nonop_Pressures.PRESUSER2) as Casing_Pressure,
	P.SZCHOKE as Chokesize,
	s.METHODPROD AS Producing_Method,
	dt.TYPDOWNTM as Downtime_Type,
	dt.DTTMSTART as Downtime_StartDate,
	dt.DTTMEND as Downtime_EndDate,
	dt.CODEDOWNTM1 as Downtime_Code,
	U.unitidregulatory AS RegulatoryID,
	U.unitida AS API,
	U.unitidb AS ARIES_Propnum,
	U.Operator,
	U.District,
	U.Area,
	U.Field, 
	U.stateprov as State,
	U.County,
	U.PadName,
	U.usertxt4 AS GatheringSystem,
	U.usernum1 AS Cost_Center_Number,
	fac.NAME as FacilityName
from [pv30CalcUnitsUS].[dbo].pvunitallocmonth am
inner join [pv30CalcUnitsUS].dbo.pvunit u on am.IDRECPARENT = u.IDREC
left join [pv30CalcUnitsUS].[dbo].pvflownetheader f on f.idflownet = am.idflownet
left join [pv30CalcUnitsUS].[dbo].pvunitcompparam p on am.idrecparam = p.idrec
left join [pv30CalcUnitsUS].[dbo].PVUNITCOMPSTATUS s on am.IDRECSTATUS = s.idrec
left join [pv30CalcUnitsUS].[dbo].PVFACILITY fac on am.IDRECFACILITY = fac.IDREC
left join [pv30CalcUnitsUS].[dbo].pvunitcompdowntm dt on am.IDRECDOWNTIME = dt.idrec
left join 
	(
	-- need to take the max pressure in case there are more than 1 records for a single day/unit
	SELECT
		C.IDRECPARENT,
		C.IDFLOWNET,
		PP.DTTM,
		MAX(PP.PRESTUB) AS PRESTUB,
		MAX(PP.PRESUSER2) AS PRESUSER2
	FROM [pv30CalcUnitsUS].[dbo].pvunitcomp c 
	left join [pv30CalcUnitsUS].[dbo].pvunitcompparam pp 
		on pp.IDRECPARENT = C.IDREC
	left join [pv30CalcUnitsUS].[dbo].pvflownetheader f on f.idflownet = C.idflownet
	WHERE f.NAME = 'NON OPERATED'
	GROUP BY
		C.IDRECPARENT,
		C.IDFLOWNET,
		PP.DTTM
	) AS Nonop_Pressures
	on u.IDREC = Nonop_Pressures.IDRECPARENT
	and u.IDFLOWNET = Nonop_Pressures.IDFLOWNET
	and Nonop_Pressures.DTTM = am.DTTMEND
where U.TYP1 = 'pvunitcomp'
and (am.VolProdAllocOil is not null
	or am.VolProdAllocGas is not null
	or am.VolProdAllocWater is not null
	or am.VolProdGathGas is not null
	or am.VolProdGathWater is not null
	or am.VolLostGas is not null
	or am.VolDispSaleGas is not null
	or am.VolDispFuelGas is not null)