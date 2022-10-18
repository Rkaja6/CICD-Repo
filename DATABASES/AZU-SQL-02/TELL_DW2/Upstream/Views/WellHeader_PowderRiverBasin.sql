CREATE VIEW [Upstream].[WellHeader_PowderRiverBasin]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Anadarko'