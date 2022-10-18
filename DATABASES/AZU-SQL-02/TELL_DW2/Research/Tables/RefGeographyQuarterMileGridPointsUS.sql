CREATE TABLE [Research].[RefGeographyQuarterMileGridPointsUS] (
    [TranslatedCoordinateX] INT        NOT NULL,
    [TranslatedCoordinateY] INT        NOT NULL,
    [SWLongitude]           FLOAT (53) NOT NULL,
    [SWLatitude]            FLOAT (53) NOT NULL,
    CONSTRAINT [PK_RefGeographyQuarterMileGridPointsUS] PRIMARY KEY CLUSTERED ([TranslatedCoordinateX] ASC, [TranslatedCoordinateY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_RefGeographyQuarterMileGridPointsUS_LongitudeLatitude]
    ON [Research].[RefGeographyQuarterMileGridPointsUS]([SWLongitude] ASC, [SWLatitude] ASC);

