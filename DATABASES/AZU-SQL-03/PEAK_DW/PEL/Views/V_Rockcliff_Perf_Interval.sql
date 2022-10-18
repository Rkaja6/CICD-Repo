












Create view [PEL].[V_Rockcliff_Perf_Interval]
AS
-- all stim intervals, and associated perfs
select
	wh.WellID,
	wh.WellName,
	wh.WellAPI,
	SI.idrec as StimIntID,
	P.idrec as PerfID,
	SI.depthtop * 3.28084   AS StimTopDepth,
	SI.depthbtm * 3.28084  AS StimBottomDepth,
	SI.dttmstart AS StimStartDate,
	SI.dttmend AS StimEndDate,
	SI.intrefno as StimIntervalNumber,
	P.depthtop * 3.28084  AS PerfTopDepth,
	P.depthbtm * 3.28084  AS PerfBottomDepth,
	P.dttm AS PerfDate,
	P.intno AS PerfIntervalNumber,
	P.cluserrefno AS PerfClusterNumber
from PEAK_DW.[PEL].[V_Rockcliff_Well] WH
INNER join [20190221_WellViewTest].dbo.wvstimint SI
ON WH.WellID = SI.idwell
left join [20190221_WellViewTest].dbo.wvperforation P
ON WH.WellID = P.idwell
AND	SI.depthtop <= P.depthtop
AND SI.depthbtm >= P.depthbtm
--AND P.dttm <= SI.dttmend

UNION ALL

-- Remaining perfs without associated stim intervals
select
	wh.WellID,
	wh.WellName,
	wh.WellAPI,
	SI.idrec as StimIntID,
	P.idrec as PerfID,
	SI.depthtop * 3.28084   AS StimTopDepth,
	SI.depthbtm * 3.28084  AS StimBottomDepth,
	SI.dttmstart AS StimStartDate,
	SI.dttmend AS StimEndDate,
	SI.intrefno as StimIntervalNumber,
	P.depthtop * 3.28084  AS PerfTopDepth,
	P.depthbtm * 3.28084  AS PerfBottomDepth,
	P.dttm AS PerfDate,
	P.intno AS PerfIntervalNumber,
	P.cluserrefno AS PerfClusterNumber
from PEAK_DW.[PEL].[V_Rockcliff_Well] WH
INNER join [20190221_WellViewTest].dbo.wvperforation P
ON WH.WellID = P.idwell
Left join [20190221_WellViewTest].dbo.wvstimint SI
ON WH.WellID = SI.idwell
AND	SI.depthtop <= P.depthtop
AND SI.depthbtm >= P.depthbtm
--AND P.dttm <= SI.dttmend
WHERE SI.idrec is null