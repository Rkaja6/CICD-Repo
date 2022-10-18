CREATE VIEW [Upstream].[WellHeader_DJ-Niobrara]
	AS SELECT * FROM Upstream.WellHeader WITH (NOLOCK)
	WHERE Play = 'DJ-Niobrara'