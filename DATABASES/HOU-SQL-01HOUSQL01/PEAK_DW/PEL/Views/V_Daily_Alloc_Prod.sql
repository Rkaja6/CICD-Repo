





create view [PEL].[V_Daily_Alloc_Prod]
as
select 
	f.name as FlowNetworkName,
	u.NAME as UnitName, 
	ad.DTTM as [Date],
	ad.VolProdAllocOil,
	ad.VolProdAllocGas,
	ad.VolProdAllocWater,
	ad.VolProdGathGas,
	ad.VolProdGathWater,
	ad.VolLostGas,
	ad.VolDispSaleGas,
	ad.VolDispFuelGas,
	ad.WIGAS/100 as WorkingInterest,
	ad.NRIGAS/100 AS Gas_NRI,
	COALESCE(p.PRESTUB, Nonop_Pressures.PRESTUB) as Tubing_Pressure,
	COALESCE(p.PRESUser2, Nonop_Pressures.PRESUSER2) as Casing_Pressure,
	P.SZCHOKE as Chokesize,
	s.METHODPROD AS Producing_Method,
	dt.TYPDOWNTM as Downtime_Type,
	dt.DTTMSTART as Downtime_StartDate,
	--dt.DTTMEND as Downtime_EndDate,
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
	fac.name as FacilityName
from [pv30CalcUnitsUS].[dbo].PVUNITALLOCMONTHDAY ad
inner join [pv30CalcUnitsUS].dbo.PVUNITALLOCMONTH am on ad.IDRECPARENT = am.IDREC
inner join [pv30CalcUnitsUS].dbo.pvunit u on am.IDRECPARENT = u.IDREC
left join [pv30CalcUnitsUS].[dbo].pvflownetheader f on f.idflownet = ad.idflownet
left join [pv30CalcUnitsUS].[dbo].pvunitcompparam p on ad.idrecparam = p.idrec
left join [pv30CalcUnitsUS].[dbo].PVUNITCOMPSTATUS s on ad.IDRECSTATUS = s.idrec
left join [pv30CalcUnitsUS].[dbo].PVFACILITY fac on ad.IDRECFACILITY = fac.IDREC
left join [pv30CalcUnitsUS].[dbo].pvunitcompdowntm dt on ad.IDRECDOWNTIME = dt.idrec
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
	and Nonop_Pressures.DTTM = ad.DTTM
where U.TYP1 = 'pvunitcomp'
and (ad.VolProdAllocOil is not null
	or ad.VolProdAllocGas is not null
	or ad.VolProdAllocWater is not null
	or ad.VolProdGathGas is not null
	or ad.VolProdGathWater is not null
	or ad.VolLostGas is not null
	or ad.VolDispSaleGas is not null
	or ad.VolDispFuelGas is not null)