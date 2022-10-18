
/******************************
** Name:  [sp_TransformInsertStagedPartyAddressData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/12/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/12/2019   Dee       Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedPartyAddressData] AS

BEGIN

--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--INSERT Records that don't exist at all into the Party Hub
INSERT INTO 
	[DW].[HubParty]
(	   
	[PartyHashKey],
	[RecordSource],
	[LoadDate],
	[NAME_Base_ID]
)
SELECT
	stg.[PartyHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[NAME_Base_ID]
FROM
	 [DW].[vw_BOLOPartyStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.HubParty hub  WITH (NOLOCK)
		WHERE stg.PartyHashKey = hub.PartyHashKey
		) 
	AND	stg.PartyHashKey IS NOT NULL


--INSERT Records that don't exist at all into the Address Hub
INSERT INTO 
	[DW].[HubAddress]
(	   
	[AddressHashKey],
	[RecordSource],
	[LoadDate],
	NAME_u2_id
)
SELECT
	stg.[AddressHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.NAME_u2_id
FROM
	 [DW].[vw_BOLOAddressStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.HubAddress hub  WITH (NOLOCK)
		WHERE stg.AddressHashKey = hub.AddressHashKey
		) 
	AND	stg.AddressHashKey IS NOT NULL


--INSERT Records that don't exist at all into the Party Address Link
INSERT INTO 
	[DW].LinkPartyAddress
(	   
	[PartyAddressHashKey],
	[PartyHashKey],
	[AddressHashKey],
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.PartyAddressHashKey,
	stg.PartyHashKey,
	stg.[AddressHashKey],
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	 [DW].[vw_BOLOAddressStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.LinkPartyAddress link  WITH (NOLOCK)
		WHERE stg.AddressHashKey = link.AddressHashKey
		AND stg.PartyHashKey = link.PartyHashKey
		) 
	AND	stg.PartyAddressHashKey IS NOT NULL

--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new Party records
BEGIN TRANSACTION

--Get list of PartyHashKeys that have changed
IF OBJECT_ID('tempdb..#party_changes') IS NOT NULL DROP TABLE #party_changes

SELECT DISTINCT
	stg.PartyHashKey
INTO
	#party_changes
FROM 
	dw.vw_BOLOPartyStageData stg
LEFT JOIN
	dw.SatParty sat WITH (NOLOCK)
ON
	stg.PartyHashKey = sat.PartyHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Alt_Name, '') <> ISNULL(sat.Alt_Name, '')
	OR ISNULL(stg.Entity_Type, '') <> ISNULL(sat.Entity_Type, '')
	OR ISNULL(stg.Land_1099_Exempt, '') <> ISNULL(sat.Land_1099_Exempt, '')
	OR ISNULL(stg.Name_Line_1, '') <> ISNULL(sat.Name_Line_1, '')
	OR ISNULL(stg.Name_Line_2, '') <> ISNULL(sat.Name_Line_2, '')
	OR ISNULL(stg.Name_Line_3, '') <> ISNULL(sat.Name_Line_3, '')
	OR ISNULL(stg.Name_Control_1099, '') <> ISNULL(sat.Name_Control_1099, '')
	OR ISNULL(stg.Residence_State, '') <> ISNULL(sat.Residence_State, '')
	OR ISNULL(stg.Sort_Key, '') <> ISNULL(sat.Sort_Key, '')
	OR ISNULL(stg.Tax_Entity_Type, '') <> ISNULL(sat.Tax_Entity_Type, '')
	OR ISNULL(stg.Tax_ID, '') <> ISNULL(sat.Tax_ID, '')
	OR ISNULL(stg.W8, '') <> ISNULL(sat.W8, '')
	OR ISNULL(stg.W8_Eff_Date, '') <> ISNULL(sat.W8_Eff_Date, '')
	OR ISNULL(stg.W9, '') <> ISNULL(sat.W9, '')
	OR ISNULL(stg.W9_Eff_Date, '') <> ISNULL(sat.W9_Eff_Date, '')
	OR ISNULL(stg.InternalEntityFlag, '') <> ISNULL(sat.InternalEntityFlag, '')

--INSERT new IDs into the Party Sat
INSERT INTO 
	DW.SatParty
(
	PartyHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Alt_Name,
	Entity_Type,
	Land_1099_Exempt,
	Name_Line_1,
	Name_Line_2,
	Name_Line_3,
	Name_Control_1099,
	Residence_State,
	Sort_Key,
	Tax_Entity_Type,
	Tax_ID,
	W8,
	W8_Eff_Date,
	W9,
	W9_Eff_Date,
	InternalEntityFlag
)
SELECT
	stg.PartyHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.LoadEndDate,
	stg.Alt_Name,
	stg.Entity_Type,
	stg.Land_1099_Exempt,
	stg.Name_Line_1,
	stg.Name_Line_2,
	stg.Name_Line_3,
	stg.Name_Control_1099,
	stg.Residence_State,
	stg.Sort_Key,
	stg.Tax_Entity_Type,
	stg.Tax_ID,
	stg.W8,
	stg.W8_Eff_Date,
	stg.W9,
	stg.W9_Eff_Date,
	stg.InternalEntityFlag
FROM 
	dw.vw_BOLOPartyStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatParty sat  WITH (NOLOCK)
		WHERE stg.PartyHashKey = sat.PartyHashKey
		) 
	AND	stg.PartyHashKey IS NOT NULL

--INSERT changed data for exisitng IDs in the Party Sat
INSERT INTO 
	DW.SatParty
(
	PartyHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Alt_Name,
	Entity_Type,
	Land_1099_Exempt,
	Name_Line_1,
	Name_Line_2,
	Name_Line_3,
	Name_Control_1099,
	Residence_State,
	Sort_Key,
	Tax_Entity_Type,
	Tax_ID,
	W8,
	W8_Eff_Date,
	W9,
	W9_Eff_Date,
	InternalEntityFlag
)
SELECT DISTINCT
	stg.PartyHashKey,
	stg.RecordSource,
	stg.LoadDate,
	NULL as LoadEndDate,
	stg.Alt_Name,
	stg.Entity_Type,
	stg.Land_1099_Exempt,
	stg.Name_Line_1,
	stg.Name_Line_2,
	stg.Name_Line_3,
	stg.Name_Control_1099,
	stg.Residence_State,
	stg.Sort_Key,
	stg.Tax_Entity_Type,
	stg.Tax_ID,
	stg.W8,
	stg.W8_Eff_Date,
	stg.W9,
	stg.W9_Eff_Date,
	stg.InternalEntityFlag
FROM 
	dw.vw_BOLOPartyStageData stg
LEFT JOIN
	dw.SatParty sat WITH (NOLOCK)
ON
	stg.PartyHashKey = sat.PartyHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Alt_Name, '') <> ISNULL(sat.Alt_Name, '')
	OR ISNULL(stg.Entity_Type, '') <> ISNULL(sat.Entity_Type, '')
	OR ISNULL(stg.Land_1099_Exempt, '') <> ISNULL(sat.Land_1099_Exempt, '')
	OR ISNULL(stg.Name_Line_1, '') <> ISNULL(sat.Name_Line_1, '')
	OR ISNULL(stg.Name_Line_2, '') <> ISNULL(sat.Name_Line_2, '')
	OR ISNULL(stg.Name_Line_3, '') <> ISNULL(sat.Name_Line_3, '')
	OR ISNULL(stg.Name_Control_1099, '') <> ISNULL(sat.Name_Control_1099, '')
	OR ISNULL(stg.Residence_State, '') <> ISNULL(sat.Residence_State, '')
	OR ISNULL(stg.Sort_Key, '') <> ISNULL(sat.Sort_Key, '')
	OR ISNULL(stg.Tax_Entity_Type, '') <> ISNULL(sat.Tax_Entity_Type, '')
	OR ISNULL(stg.Tax_ID, '') <> ISNULL(sat.Tax_ID, '')
	OR ISNULL(stg.W8, '') <> ISNULL(sat.W8, '')
	OR ISNULL(stg.W8_Eff_Date, '') <> ISNULL(sat.W8_Eff_Date, '')
	OR ISNULL(stg.W9, '') <> ISNULL(sat.W9, '')
	OR ISNULL(stg.W9_Eff_Date, '') <> ISNULL(sat.W9_Eff_Date, '')
	OR ISNULL(stg.InternalEntityFlag, '') <> ISNULL(sat.InternalEntityFlag, '')

--UPDATE load end dates for changed data
UPDATE
	SatParty
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatParty z WITH (NOLOCK)
		WHERE
			z.PartyHashKey = a.PartyHashKey
		AND 
			z.LoadDate > a.LoadDate
		)
FROM 
	SatParty a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #party_changes b
	WHERE b.PartyHashKey = a.PartyHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#party_changes') IS NOT NULL DROP TABLE #party_changes

COMMIT TRANSACTION

WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--Get list of AddressHashKeys that have changed
IF OBJECT_ID('tempdb..#address_changes') IS NOT NULL DROP TABLE #address_changes

SELECT DISTINCT
	stg.AddressHashKey
INTO
	#address_changes
FROM 
	dw.vw_BOLOAddressStageData stg
LEFT JOIN
	dw.SatAddress sat WITH (NOLOCK)
ON
	stg.AddressHashKey = sat.AddressHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Address_Line_1, '') <> ISNULL(sat.Address_Line_1, '')
	OR ISNULL(stg.Address_Line_2, '') <> ISNULL(sat.Address_Line_2, '')
	OR ISNULL(stg.Address_Line_3, '') <> ISNULL(sat.Address_Line_3, '')
	OR ISNULL(stg.City, '') <> ISNULL(sat.City, '')
	OR ISNULL(stg.[State], '') <> ISNULL(sat.[State], '')
	OR ISNULL(stg.Zip, '') <> ISNULL(sat.Zip, '')
	OR ISNULL(stg.Country, '') <> ISNULL(sat.Country, '')
	OR ISNULL(stg.Name_Line_1, '') <> ISNULL(sat.Name_Line_1, '')
	OR ISNULL(stg.Name_Line_2, '') <> ISNULL(sat.Name_Line_2, '')
	OR ISNULL(stg.Name_Line_3, '') <> ISNULL(sat.Name_Line_3, '')
	OR ISNULL(stg.Name_Control_1099, '') <> ISNULL(sat.Name_Control_1099, '')
	OR ISNULL(stg.Residence_State, '') <> ISNULL(sat.Residence_State, '')
	OR ISNULL(stg.Address_1099, '') <> ISNULL(sat.Address_1099, '')
	OR ISNULL(stg.City_1099, '') <> ISNULL(sat.City_1099, '')
	OR ISNULL(stg.State_1099, '') <> ISNULL(sat.State_1099, '')
	OR ISNULL(stg.TIN_Type_1099, '') <> ISNULL(sat.TIN_Type_1099, '')
	OR ISNULL(stg.Zip_1099, '') <> ISNULL(sat.Zip_1099, '')
	OR ISNULL(stg.TIN_2nd_Notice, '') <> ISNULL(sat.TIN_2nd_Notice, '')

--INSERT new IDs into the Address Sat
INSERT INTO 
	DW.SatAddress
(
	AddressHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Address_Line_1,
	Address_Line_2,
	Address_Line_3,
	City,
	[State],
	Zip,
	Country,
	Name_Line_1,
	Name_Line_2,
	Name_Line_3,
	Name_Control_1099,
	Residence_State,
	Address_1099,
	City_1099,
	State_1099,
	TIN_Type_1099,
	Zip_1099,
	TIN_2nd_Notice
)
SELECT
	stg.AddressHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.LoadEndDate,
	stg.Address_Line_1,
	stg.Address_Line_2,
	stg.Address_Line_3,
	stg.City,
	stg.[State],
	stg.Zip,
	stg.Country,
	stg.Name_Line_1,
	stg.Name_Line_2,
	stg.Name_Line_3,
	stg.Name_Control_1099,
	stg.Residence_State,
	stg.Address_1099,
	stg.City_1099,
	stg.State_1099,
	stg.TIN_Type_1099,
	stg.Zip_1099,
	stg.TIN_2nd_Notice
FROM 
	dw.vw_BOLOAddressStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatAddress sat  WITH (NOLOCK)
		WHERE stg.AddressHashKey = sat.AddressHashKey
		) 
	AND	stg.AddressHashKey IS NOT NULL

--INSERT changed data for exisitng IDs in the Address Sat
INSERT INTO 
	DW.SatAddress
(
	AddressHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Address_Line_1,
	Address_Line_2,
	Address_Line_3,
	City,
	[State],
	Zip,
	Country,
	Name_Line_1,
	Name_Line_2,
	Name_Line_3,
	Name_Control_1099,
	Residence_State,
	Address_1099,
	City_1099,
	State_1099,
	TIN_Type_1099,
	Zip_1099,
	TIN_2nd_Notice
)
SELECT DISTINCT
	stg.AddressHashKey,
	stg.RecordSource,
	stg.LoadDate,
	NULL as LoadEndDate,
	stg.Address_Line_1,
	stg.Address_Line_2,
	stg.Address_Line_3,
	stg.City,
	stg.[State],
	stg.Zip,
	stg.Country,
	stg.Name_Line_1,
	stg.Name_Line_2,
	stg.Name_Line_3,
	stg.Name_Control_1099,
	stg.Residence_State,
	stg.Address_1099,
	stg.City_1099,
	stg.State_1099,
	stg.TIN_Type_1099,
	stg.Zip_1099,
	stg.TIN_2nd_Notice
FROM 
	dw.vw_BOLOAddressStageData stg
LEFT JOIN
	dw.SatAddress sat WITH (NOLOCK)
ON
	stg.AddressHashKey = sat.AddressHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Address_Line_1, '') <> ISNULL(sat.Address_Line_1, '')
	OR ISNULL(stg.Address_Line_2, '') <> ISNULL(sat.Address_Line_2, '')
	OR ISNULL(stg.Address_Line_3, '') <> ISNULL(sat.Address_Line_3, '')
	OR ISNULL(stg.City, '') <> ISNULL(sat.City, '')
	OR ISNULL(stg.[State], '') <> ISNULL(sat.[State], '')
	OR ISNULL(stg.Zip, '') <> ISNULL(sat.Zip, '')
	OR ISNULL(stg.Country, '') <> ISNULL(sat.Country, '')
	OR ISNULL(stg.Name_Line_1, '') <> ISNULL(sat.Name_Line_1, '')
	OR ISNULL(stg.Name_Line_2, '') <> ISNULL(sat.Name_Line_2, '')
	OR ISNULL(stg.Name_Line_3, '') <> ISNULL(sat.Name_Line_3, '')
	OR ISNULL(stg.Name_Control_1099, '') <> ISNULL(sat.Name_Control_1099, '')
	OR ISNULL(stg.Residence_State, '') <> ISNULL(sat.Residence_State, '')
	OR ISNULL(stg.Address_1099, '') <> ISNULL(sat.Address_1099, '')
	OR ISNULL(stg.City_1099, '') <> ISNULL(sat.City_1099, '')
	OR ISNULL(stg.State_1099, '') <> ISNULL(sat.State_1099, '')
	OR ISNULL(stg.TIN_Type_1099, '') <> ISNULL(sat.TIN_Type_1099, '')
	OR ISNULL(stg.Zip_1099, '') <> ISNULL(sat.Zip_1099, '')
	OR ISNULL(stg.TIN_2nd_Notice, '') <> ISNULL(sat.TIN_2nd_Notice, '')

--UPDATE load end dates for changed data
UPDATE
	SatAddress
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatAddress z WITH (NOLOCK)
		WHERE
			z.AddressHashKey = a.AddressHashKey
		AND 
			z.LoadDate > a.LoadDate
		)
FROM 
	SatAddress a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #address_changes b
	WHERE b.AddressHashKey = a.AddressHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#address_changes') IS NOT NULL DROP TABLE #address_changes

COMMIT TRANSACTION

END