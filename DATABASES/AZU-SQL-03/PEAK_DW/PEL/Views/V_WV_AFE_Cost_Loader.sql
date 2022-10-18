



CREATE VIEW [PEL].[V_WV_AFE_Cost_Loader]
AS
  WITH WV AS
	(
	SELECT 
		JA.afenumber,
		J.idrec as Job_ID,
		J.dttmend AS Job_End_Date,
		J.jobtyp as Job_Type,
		JA.typ AS Job_AFE_Type
	FROM wv100.dbo.wvjobafe JA
	INNER join wv100.dbo.wvjob J 
	on J.idrec = jA.idrecparent
	)
  
  select 
	  WellView.Job_Type as job_jobtyp,
	  Bolo.[AFE_Number] as jobafe_afenumber,
	  WellView.Job_AFE_Type as jobafe_typ,
	  Bolo.Major as jobafeFIC_code1,
	  Bolo.Minor as jobafeFIC_code2,
	  Bolo.Amount as jobafeFIC_amount,
	  wvcoa.AcctDescription as jobafeFIC_des,
	  Bolo.INVOICE_DATE as jobafeFIC_finalinvoicedttm,
	  Bolo.INVOICE_NO as jobafeFIC_invoicerefno,
	  Bolo.Vendor as jobafeFIC_vendor,
	  Bolo.Vendor_ID as jobafeFIC_vendorcode,
	  Bolo.ACTIVITY_DATE as jobafeFIC_code3,
	  Bolo.Transaction_ID as jobafeFIC_code4,
	  LEFT(Bolo.DESCRIPTION,255) AS jobafeFIC_note
  FROM [PEAK_DW].[BOLO].[V_AFE_Trans_with_Budget] Bolo
  INNER JOIN 
	(
	SELECT
		A.afenumber,
		A.Job_ID, 
		A.Job_Type,
		A.Job_AFE_Type,
		A.Job_End_Date,
		B.Job_End_Date AS Surface_Job_End_Date
	FROM WV A
	LEFT JOIN WV B
	ON A.afenumber = B.afenumber
	AND A.Job_Type = B.Job_Type
	AND B.Job_AFE_Type = 'Drill & Complete - Surface'
	) WellView
  on Bolo.AFE_Number = WellView.afenumber
  LEFT JOIN PEAK_DW.ETL.WellView_COA wvcoa
  ON Bolo.Account_Code = wvcoa.AcctCode
  WHERE Gross_Net_Flag = 'G'
  AND Actual_or_Budget_Flag = 'A'
  AND 
	(
	WellView.Job_Type = 'Drilling' AND Bolo.Major in ('830','840')
	OR
	WellView.Job_Type = 'Completion' AND Bolo.Major in ('850','860','875')
	OR 
	WellView.Job_Type = 'Workover' AND Bolo.Major in ('888')
	OR
	WellView.Job_Type = 'Plug & Abandon' AND Bolo.Major in ('886')
	)
  AND
	(
	WellView.Job_AFE_Type = 'Drill & Complete - Surface' AND BOLO.ACTIVITY_DATE <= COALESCE(WellView.Surface_Job_End_Date, GETDATE())
	OR 
	WellView.Job_AFE_Type = 'Drill & Complete - Horizontal' AND BOLO.ACTIVITY_DATE > COALESCE(WellView.Surface_Job_End_Date, GETDATE())
	OR 
	WellView.Job_AFE_Type NOT IN ('Drill & Complete - Surface', 'Drill & Complete - Horizontal')
	)