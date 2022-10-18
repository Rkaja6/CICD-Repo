






Create View [PEL].[V_Rockcliff_Daily_Ops] AS
WITH TimeLog AS
(
	SELECT
		Min(JRTL.depthstart * 3.28084) as [Depth Start],
		MAX(JRTL.depthend * 3.28084) as [Depth End],
		SUM(JRTL.duration * 24) as [Hours],
		WB.des,
		JR.dttmstart as [Field Estimate Date],
		J.idrec as jobid
	FROM [20190221_WellViewTest].dbo.wvjobreporttimelog JRTL
	LEFT JOIN [20190221_WellViewTest].dbo.wvwellbore WB
		ON JRTL.idrecwellbore = WB.idrec
	INNER JOIN [20190221_WellViewTest].dbo.wvjobreport JR
		ON JRTL.idrecparent = JR.idrec
	INNER JOIN [20190221_WellViewTest].dbo.wvjob J
		ON JR.idrecparent = J.idrec
	WHERE JRTL.opscategory <> '201.MOB'
	OR JRTL.code1 <> '02MOB' 
	OR JRTL.code2 <> 'MOB'
	GROUP BY 
		JR.dttmstart,
		WB.des,
		J.idrec
)

select 
	wh.wellname,
	wh.wellida AS [API],
	TL.des as wellbore_description,
	TL.[Depth End],
	TL.[Hours],
	BB.[Daily Cost Sum],
	SUM(BB.[Daily Cost Sum]) OVER	(PARTITION BY WH.idwell, J.idrec ORDER BY DATEDIFF(day,COALESCE(DZ.dayzero,j.dttmstart),JR.dttmstart)) AS RunningTotalDailyCost,
	JR.dttmstart as [Field Estimate Date],
	jr.summaryops,
	jr.rpttmactops,
	j.dttmstart as [Job Start Date],
	DATEDIFF(day,COALESCE(DZ.dayzero,j.dttmstart),JR.dttmstart) AS [Days Since Job Start],
	j.dttmend as [Job End Date],
	j.jobtyp as [Job Type],
	j.jobsubtyp as [Job Subtype],
	j.status1 as [Job Status],
	j.targetform as [Target Formation],
	j.wvtyp
from [20190221_WellViewTest].dbo.wvjob J
INNER JOIN [20190221_WellViewTest].dbo.wvwellheader WH
ON J.idwell = WH.idwell
INNER JOIN [20190221_WellViewTest].dbo.wvjobreport JR
ON JR.idrecparent = J.idrec
-- Depths by day
LEFT JOIN 
	(
	SELECT
		[Depth End], 
		Hours, 
		[Field Estimate Date], 
		jobid,
		des
	FROM TimeLog 
	where jobid in 
		(
		Select jobid
		from TimeLog
		where [Depth End] is not null
		)
	UNION ALL	
	SELECT
		0 as [Depth End],
		24 as Hours,
		DATEADD(day, -1, MIN([Field Estimate Date])) as [Field Estimate Date],
		jobid,
		des
	FROM TimeLog
	GROUP BY
		jobid, 
		des
	) TL
ON TL.jobid = J.idrec
AND TL.[Field Estimate Date] = JR.dttmstart
-- Day Zero, based on Depth
LEFT JOIN
	(
	SELECT
		DATEADD(day, -1, MIN([Field Estimate Date])) as DayZero,
		jobid
	FROM TimeLog
	GROUP BY
		jobid
	) DZ
ON DZ.jobid = J.idrec
-- Costs by day
LEFT JOIN 
	(
	SELECT
		SUM(JRC.cost) AS [Daily Cost Sum],
		idrecparent
	FROM  [20190221_WellViewTest].dbo.wvjobreportcostgen JRC
	GROUP BY idrecparent
	) BB
ON BB.idrecparent = JR.idrec
where WH.operator like 'ROCKCLIFF%'