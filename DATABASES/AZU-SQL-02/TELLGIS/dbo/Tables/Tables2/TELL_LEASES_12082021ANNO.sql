CREATE TABLE [dbo].[TELL_LEASES_12082021ANNO] (
    [OBJECTID]            INT              NOT NULL,
    [FeatureID]           INT              NULL,
    [ZOrder]              INT              NULL,
    [AnnotationClassID]   INT              NULL,
    [Element]             VARBINARY (MAX)  NULL,
    [SymbolID]            INT              NULL,
    [Status]              SMALLINT         NULL,
    [TextString]          NVARCHAR (255)   NULL,
    [FontName]            NVARCHAR (255)   NULL,
    [FontSize]            NUMERIC (38, 8)  NULL,
    [Bold]                SMALLINT         NULL,
    [Italic]              SMALLINT         NULL,
    [Underline]           SMALLINT         NULL,
    [VerticalAlignment]   SMALLINT         NULL,
    [HorizontalAlignment] SMALLINT         NULL,
    [XOffset]             NUMERIC (38, 8)  NULL,
    [YOffset]             NUMERIC (38, 8)  NULL,
    [Angle]               NUMERIC (38, 8)  NULL,
    [FontLeading]         NUMERIC (38, 8)  NULL,
    [WordSpacing]         NUMERIC (38, 8)  NULL,
    [CharacterWidth]      NUMERIC (38, 8)  NULL,
    [CharacterSpacing]    NUMERIC (38, 8)  NULL,
    [FlipAngle]           NUMERIC (38, 8)  NULL,
    [Override]            INT              NULL,
    [SHAPE]               [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]   VARBINARY (MAX)  NULL,
    CONSTRAINT [R586_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g549_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [I4284Status]
    ON [dbo].[TELL_LEASES_12082021ANNO]([Status] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I4284AnnotationC]
    ON [dbo].[TELL_LEASES_12082021ANNO]([AnnotationClassID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [G4284FeatureID]
    ON [dbo].[TELL_LEASES_12082021ANNO]([FeatureID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S549_idx]
    ON [dbo].[TELL_LEASES_12082021ANNO] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -10394206.3081581, XMIN = -10400049.3484276, YMAX = 3747120.2740057, YMIN = 3732002.77149802),
            CELLS_PER_OBJECT = 16
          );

