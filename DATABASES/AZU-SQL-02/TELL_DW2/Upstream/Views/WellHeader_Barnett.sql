CREATE VIEW [Upstream].[WellHeader_Barnett]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Barnett'