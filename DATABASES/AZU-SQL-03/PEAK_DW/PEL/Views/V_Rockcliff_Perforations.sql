




create view 
[PEL].[V_Rockcliff_Perforations]
AS
select 
	W.WellName,
	W.WellAPI,
	W.WellID,
	P.idrec as PerfID,
	P.cluserrefno as ClusterNumber,
	P.intno as PerfIntervalNumber,
	P.depthbtm * 3.28084 as PerfBottomDepth,
	P.depthtop * 3.28084 as PerfTopDepth,
	P.dttm as PerfDate,
	ROUND(P.ShotDensity / 3.28084,0) as ShotDensity,
	P.ShotPlan,
	P.ShotTotal,
	P.typ as PerfType,
	(P.depthbtm - P.depthtop) * 3.28084 as PerfLength
from [PEL].[V_Rockcliff_Well] W
inner join [20190221_WellViewTest].dbo.wvperforation P
on P.idwell = W.WellID