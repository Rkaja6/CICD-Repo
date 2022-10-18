CREATE VIEW [Upstream].[WellHeader_Permian]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Permian'