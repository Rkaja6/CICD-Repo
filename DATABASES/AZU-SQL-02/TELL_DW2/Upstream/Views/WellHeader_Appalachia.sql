CREATE VIEW [Upstream].[WellHeader_Appalachia]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Appalachia'