CREATE VIEW [Upstream].[WellHeader_Haynesville]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Haynesville'