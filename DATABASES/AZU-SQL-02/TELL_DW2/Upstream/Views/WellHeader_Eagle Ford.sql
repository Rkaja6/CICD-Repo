CREATE VIEW [Upstream].[WellHeader_Eagle Ford]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Eagle Ford'