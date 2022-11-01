﻿







CREATE VIEW [BOLO].[V_TRANS] AS
SELECT 
	T.*,
	I.ACCT AS AP_ACCT,
	I.ADVICE_REMARKS, 
	I.AMT AS AP_AMT,
	I.DUE_DATE,
	I.IMAGE_REF,
	I.INVOICE_DATE,
	I.INVOICE_NO,
	I.PAID_IN_FULL_PERIOD,
	I.PAY_DISP,
	I.RECD_DATE,
	I.INT_AMT AS AP_INT_AMT,
	V.NAME1 AS Vendor,
	V.BASE_ID AS Vendor_ID,
	P.NAME1 AS Party, 
	J.DESCRIPTION as JE_DESCRIPTION, 
	J.CONTROL_TOTAL,
	J.REVERSAL_VOUCHER, 
	AFE.PROJECT AS AFE_Number,
	AFE.DESCRIPTION AS AFE_Description,
	AFE.STATUS AS AFE_Status
FROM [BOLO].[TRANS] T
LEFT JOIN BOLO.AP_INV I
	ON T.SOURCE_TABLE = 'AP.INV'
	AND T.VOUCHER = I.VOUCHER
LEFT JOIN BOLO.JE J
	ON T.SOURCE_TABLE = 'JE'
	AND T.VOUCHER = J.u2_id
LEFT JOIN BOLO.NAME V
	ON I.VENDOR = V.u2_id
LEFT JOIN BOLO.NAME P
	ON T.NAME = P.u2_id
LEFT JOIN BOLO.PROJ AFE
	ON T.PROJECT = AFE.u2_id