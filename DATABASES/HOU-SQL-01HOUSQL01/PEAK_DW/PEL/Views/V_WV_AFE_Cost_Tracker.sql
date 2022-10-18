CREATE VIEW PEL.V_WV_AFE_Cost_Tracker
AS
WITH cte_Well as
(
SELECT w.[idwell]
      ,w.wellname
  FROM [wv100].[dbo].[wvwellheader] w
),
cte_Budget as
(
  select  j.idwell, j.jobsubtyp, a.afenumber, a.typ, a.dttmafe, b.amount, b.code1, b.code2, b.des
  from wv100.dbo.wvjobafecost b
  left join wv100.dbo.wvjobafe a
  on a.idrec = b.idrecparent
  left join wv100.dbo.wvjob j
  on j.idrec = a.idrecparent
  where b.amount <> 0
  ),
cte_Actual as 
(
select j.idwell, j.jobsubtyp, a.afenumber, a.typ, c.amount, c.code1, c.code2, c.code3 as activitydate, c.code4 as bolo_transaction_id, c.des, c.finalinvoicedttm, c.invoicerefno, c.note, c.vendor, c.vendorcode
  from wv100.dbo.wvjobafefinalinvoicecost c
  left join wv100.dbo.wvjobafe a
  on a.idrec = c.idrecparent
  left join wv100.dbo.wvjob j
  on j.idrec = a.idrecparent
  where c.amount <> 0
),
cte_FieldEst as
(
  select j.idwell, j.jobsubtyp, r.dttmstart, f.code1, f.code2, f.cost, f.des, f.note, f.ticketno, f.vendor
    from wv100.dbo.wvjobreportcostgen f
left join wv100.dbo.wvjobreport r
on r.idrec = f.idrecparent
  left join wv100.dbo.wvjob j
  on j.idrec = r.idrecparent
  where f.cost <> 0
)

SELECT
	W.wellname, 
	JobSubType,
	AmountType,
	AfeNumber,
	ActivityDate,
	Major,
	Minor,
	Amount,
	LTRIM(RTRIM(Description)) AS Description,
	Vendor,
	InvoiceTicket,
	Note
FROM
	(
	SELECT
		'BUDGET' AS AmountType, idwell, jobsubtyp as JobSubType, AfeNumber, dttmafe as ActivityDate, code1 AS Major, code2 as Minor, amount as Amount, 
		des as Description, NULL as Vendor, NULL as InvoiceTicket, NULL as Note
	FROM cte_Budget
	UNION ALL
	SELECT
		'ACTUAL' AS AmountType, idwell, jobsubtyp as JobSubType, AfeNumber, cast(activitydate as date) as ActivityDate, code1 AS Major, code2 as Minor, amount as Amount, 
		des as Description, Vendor, invoicerefno as InvoiceTicket, Note
	FROM cte_Actual
	UNION ALL
	SELECT
		'FIELD ESTIMATE' AS AmountType, idwell, jobsubtyp as JobSubType, NULL as AfeNumber, dttmstart as ActivityDate, code1 AS Major, code2 as Minor, cost as Amount, 
		des as Description, Vendor, ticketno as InvoiceTicket, Note
	FROM cte_FieldEst
	) A
LEFT JOIN cte_Well W
	on A.idwell = W.idwell