
CREATE VIEW [dbo].[VW_Custom1CostSubItem]
AS
SELECT   
   ROW_NUMBER() OVER(ORDER BY job_number, report_Date, line_number) AS [custom1costsubitem_id],
   1380 AS [reportTypeId],
    [well_id],
   [report_Date],
   line_number AS [sub_line_number],
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
   [CostItem].[ExpenseDescription] AS [ExpenseDescription],
   [CostItem].[SubExpenseDescription] AS [Description],
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
FROM Custom1CostItem [CostItem]
WHERE 
    SubExpenseDescription IS NOT NULL