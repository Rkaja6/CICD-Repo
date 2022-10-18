

/******************************
** Name: [vw_BOLOAddressStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/18/19
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Dee       Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOAddressStageData] AS
SELECT  
	HASHBYTES('SHA2_256', u2_id) AS [AddressHashKey],
	'BOLO NAME' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	CONVERT(VARCHAR(50), u2_id)	AS NAME_u2_id,
	[ADDRESS1] as [Address_Line_1],
	[ADDRESS2] as [Address_Line_2],
	[ADDRESS3] as [Address_Line_3],
	[City],
	[State],
	[Zip],
	[Country],
	[NAME1] as [Name_Line_1],
	[NAME2] as [Name_Line_2],
	[NAME3] as [Name_Line_3],
	[Name_Control_1099],
	[Residence_State],
	[TEN99_ADDRESS] as [Address_1099],
    [TEN99_CITY] as [City_1099],
    [TEN99_STATE] as [State_1099],
    [TEN99_TIN_TYPE] as [TIN_Type_1099],
    [TEN99_ZIP] as [Zip_1099],
    [TIN_2nd_Notice],
	HASHBYTES('SHA2_256', CONCAT(u2_id,'|',BASE_ID)) AS [PartyAddressHashKey],
	HASHBYTES('SHA2_256', BASE_ID) AS [PartyHashKey]
FROM 
	[StageBOLO].[NAME] N WITH (NOLOCK)