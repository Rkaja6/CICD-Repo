CREATE VIEW [Upstream].[WellHeader_Bakken]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Bakken'