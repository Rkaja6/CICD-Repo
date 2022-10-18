




create view [PEL].[V_Rockcliff_Well]
as
Select
	wh.idwell as WellID,
	--wb.idrec as WellBoreID,
	wh.Wellname, 
	wh.wellida as WellAPI,
	--wb.depthstart,
	--wb.des as WellBoreDescription,
	--wb.profiletyp,
	--wb.purpose,
	wh.fieldname,
	wh.basin,
	wh.county,
	wh.currentwellstatus1 as WellStatus,
	wh.dttmrr as DateRR,
	wh.dttmspud as DateSpud,
	wh.elvground * 3.28084 as GroundElevationFt,
	wh.latitude,
	wh.longitude,
	wh.latlongdatum,
	wh.usernum1 as NRI,
	wh.usernum2 AS WI,
	wh.utmx,
	wh.utmy
from [20190221_WellViewTest].dbo.wvwellheader wh
--left join [20190221_WellViewTest].dbo.wvwellbore wb
--ON wb.idwell = wh.idwell
where wh.operator = 'ROCKCLIFF ENERGY MGMT LLC'