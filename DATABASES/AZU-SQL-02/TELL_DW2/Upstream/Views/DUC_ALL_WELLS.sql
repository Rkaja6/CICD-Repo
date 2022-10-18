CREATE VIEW [Upstream].[DUC_ALL_WELLS]
	AS 
	SELECT 
		API14,
		Date_Spud as DUC_DATE,
		Date_Spud,
		Date_First_Production,
		1 AS DUC_INDEX
	FROM Upstream.WellHeader WITH (NOLOCK)
	UNION ALL

	SELECT
		API14,
		Date_First_Production as DUC_DATE,
		Date_Spud,
		Date_First_Production,
		-1 AS DUC_INDEX
	FROM Upstream.WellHeader WITH (NOLOCK)