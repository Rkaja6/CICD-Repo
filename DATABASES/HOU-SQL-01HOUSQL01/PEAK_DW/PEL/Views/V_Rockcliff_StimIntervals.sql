









create view
[PEL].[V_Rockcliff_StimIntervals]
as

with Prop as 
	(
	SELECT 
		SUM(Amount) as Amount,
		SUM(amountdesign) AS AmountDesign,
		idrecparent,
		sz,
		typ1,
		ROW_NUMBER() OVER (PARTITION BY idrecparent ORDER BY (sz + typ1)) AS Row_Number
	FROM [20190221_WellViewTest].dbo.wvstimintprop
	GROUP BY 
		idrecparent,
		sz,
		typ1
	)

select 
	P.WellName,
	P.WellAPI,
	P.WellID,
	SI.idrec as StimIntID,
	S.typ1 as StimType,
	P.StageNumber,
	P.StageTopDepth,
	P.StageBottomDepth,
	SI.depthtop * 3.28084 AS StimIntTopDepth,
	SI.depthbtm * 3.28084 AS StimIntBottomDepth,
	P.NumberOfClusters,
	P.TotalPerfLength,
	P.AvgShotDensity,
	P.TotalShotPlan,
	P.TotalShot,
	P.PerfType,
	P.MinPerfDate,
	P.MaxPerfDate,
	SI.dttmstart as StimStartDate,
	SI.dttmend as StimEndDate,
	SI.deliverymode,
	SI.fracgradient / 22.6205948 as FracGradient,
	SI.fracgradientend / 22.6205948 as FracGradientEnd,
	SI.masspropinfrm * 2.2046226 AS ProppantInFormation,
	SI.masspropdesign * 2.2046226 AS ProppantDesign,
	SI.masspropinwellbore * 2.2046226 AS ProppantInWellbore,
	SI.masspropreturn * 2.2046226 AS ProppantReturn,
	SI.massproptotal * 2.2046226 AS ProppantTotal,
	SI.prestreatavg / 6.89475729 as PresTreatAvg,
	SI.prestreatmax / 6.89475729 as PresTreatMax,
	(SI.ratecleanavg / 1440) * 6.28981 as RateCleanAvg,
	(SI.ratecleanmax  / 1440) * 6.28981 as RateCleanMax,
	(SI.rateslurryavg  / 1440) * 6.28981 as RateSlurryAvg,
	(SI.rateslurrymax  / 1440) * 6.28981 as RateSlurryMax,
	SI.shutinpresfinal / 6.89475729 as ShutInPresFinal,
	SI.volcleantotal * 6.28981 as VolCleanTotal,
	SI.volslurrytotal * 6.28981 as VolSlurryTotal,
	P1.typ1 as PropType1,
	P1.sz as PropType1Size,
	P1.AmountDesign * 2.2046226 as PropType1Design,
	P1.Amount * 2.2046226 as PropType1Amt,
	P2.typ1 as PropType2,
	P2.sz as PropType2Size,
	P2.AmountDesign * 2.2046226 as PropType2Design,
	P2.Amount * 2.2046226 as PropType2Amt,
	P3.typ1 as PropType3,
	P3.sz as PropType3Size,
	P3.AmountDesign * 2.2046226 as PropType3Design,
	P3.Amount * 2.2046226 as PropType3Amt,
	P4.typ1 as PropType4,
	P4.sz as PropType4Size,
	P4.AmountDesign * 2.2046226 as PropType4Design,
	P4.Amount * 2.2046226 as PropType4Amt
from 
	(
	select
		WellName,
		WellAPI,
		WellID,
		MAX(ClusterNumber) As NumberOfClusters,
		PerfIntervalNumber AS StageNumber,
		MAX(PerfBottomDepth) AS StageBottomDepth,
		MIN(PerfTopDepth) AS StageTopDepth,
		AVG(ShotDensity) as AvgShotDensity,
		SUM(ShotPlan) as TotalShotPlan,
		SUM(ShotTotal) as TotalShot,
		MAX(PerfDate) as MaxPerfDate,
		MIN(PerfDate) as MinPerfDate,
		PerfType,
		SUM(PerfLength) as TotalPerfLength
	from [PEL].[V_Rockcliff_Perforations] 
	GROUP BY
		WellName,
		WellAPI,
		WellID,
		PerfIntervalNumber,
		PerfType
	) P
left join [20190221_WellViewTest].dbo.wvstimint SI
	on SI.idwell = P.WellID
	and SI.intrefno = p.StageNumber
left join [20190221_WellViewTest].dbo.wvstim S
	ON SI.idrecparent = S.idrec
left join Prop as p1
	on P1.idrecparent = SI.idrec
	AND P1.Row_Number = 1
left join Prop as p2
	on P2.idrecparent = SI.idrec
	AND P2.Row_Number = 2
left join Prop as p3
	on P3.idrecparent = SI.idrec
	AND P3.Row_Number = 3
left join Prop as p4
	on P4.idrecparent = SI.idrec
	AND P4.Row_Number = 4