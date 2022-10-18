CREATE VIEW [Upstream].[WellHeader_Anadarko]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'Anadarko'