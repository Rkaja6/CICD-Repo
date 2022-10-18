





Create View [PEL].[V_WV_Daily_Ops] AS
WITH TimeLog AS
(
	SELECT
		Min(JRTL.depthstart * 3.28084) as [Depth Start],
		MAX(JRTL.depthend * 3.28084) as [Depth End],
		SUM(JRTL.duration * 24) as [Hours],
		WB.des,
		JR.dttmstart as [Field Estimate Date],
		J.idrec as jobid
	FROM wv100.dbo.wvjobreporttimelog JRTL
	LEFT JOIN wv100.dbo.wvwellbore WB
		ON JRTL.idrecwellbore = WB.idrec
	INNER JOIN wv100.dbo.wvjobreport JR
		ON JRTL.idrecparent = JR.idrec
	INNER JOIN wv100.dbo.wvjob J
		ON JR.idrecparent = J.idrec
	WHERE JRTL.code1 NOT IN ('1','DP01')
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
	ROW_NUMBER() OVER (PARTITION BY WH.idwell, J.idrec ORDER BY JR.dttmstart) AS [Job Report Number],
	jr.dttmstart as [Job Report Date],
	j.dttmstart as [Job Start Date],
	DATEDIFF(day,COALESCE(DZ.dayzero,j.dttmstart),JR.dttmstart) AS [Days Since Job Start],
	j.dttmend as [Job End Date],
	j.jobtyp as [Job Type],
	j.jobsubtyp as [Job Subtype],
	j.status1 as [Job Status],
	j.targetform as [Target Formation],
	j.wvtyp
from wv100.dbo.wvjob J
INNER JOIN wv100.dbo.wvwellheader WH
ON J.idwell = WH.idwell
INNER JOIN wv100.dbo.wvjobreport JR
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
	FROM  wv100.dbo.wvjobreportcostgen JRC
	GROUP BY idrecparent
	) BB
ON BB.idrecparent = JR.idrec