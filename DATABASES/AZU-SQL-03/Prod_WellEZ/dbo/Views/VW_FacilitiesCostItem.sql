CREATE VIEW [dbo].[VW_FacilitiesCostItem]
AS
SELECT   
   ROW_NUMBER() OVER(ORDER BY job_number, report_Date, line_number) AS [facilitiescostitem_id],
   1340 AS [reportTypeId],
    [well_id],
   [report_Date],
   [line_number],
   [job_number],
   [VendorId],
   [UserDefined_1],
   [UserDefined_2],
   [UserDefined_3],
   [UserDefined_4],
   [UserDefined_5],
   [Remarks],
   [PickList_1],
   [PickList_2],
   [PickList_3],
   [PickList_4],
   [PickList_5],
   [ItemCode],
   [ExpenseDescription],
   [Cost],
   [location_id],
   [UomUserDefined_1],
   [UomUserDefined_2],
   [UomUserDefined_3],
   [UomUserDefined_4],
   [UomUserDefined_5],
   [UomPickList_1],
   [UomPickList_2],
   [UomPickList_3],
   [UomPickList_4],
   [UomPickList_5],
   [RowID]
FROM FacilitiesCostItem [CostItem]
WHERE 
    SubExpenseDescription IS NULL