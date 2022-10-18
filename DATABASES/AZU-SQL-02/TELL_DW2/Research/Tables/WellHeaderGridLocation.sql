CREATE TABLE [Research].[WellHeaderGridLocation] (
    [API14]                 VARCHAR (20) NOT NULL,
    [TranslatedCoordinateX] INT          NOT NULL,
    [TranslatedCoordinateY] INT          NOT NULL,
    CONSTRAINT [PK_WellHeaderGridLocation] PRIMARY KEY CLUSTERED ([API14] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_WellHeaderGridLocation_TranslatedCoordinateX_TranslatedCoordinateY]
    ON [Research].[WellHeaderGridLocation]([TranslatedCoordinateX] ASC, [TranslatedCoordinateY] ASC);

