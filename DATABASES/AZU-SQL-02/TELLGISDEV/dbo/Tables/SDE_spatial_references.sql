CREATE TABLE [dbo].[SDE_spatial_references] (
    [srid]          INT            NOT NULL,
    [description]   NVARCHAR (64)  NULL,
    [auth_name]     NVARCHAR (255) NULL,
    [auth_srid]     INT            NULL,
    [falsex]        FLOAT (53)     NOT NULL,
    [falsey]        FLOAT (53)     NOT NULL,
    [xyunits]       FLOAT (53)     NOT NULL,
    [falsez]        FLOAT (53)     NOT NULL,
    [zunits]        FLOAT (53)     NOT NULL,
    [falsem]        FLOAT (53)     NOT NULL,
    [munits]        FLOAT (53)     NOT NULL,
    [xycluster_tol] FLOAT (53)     NULL,
    [zcluster_tol]  FLOAT (53)     NULL,
    [mcluster_tol]  FLOAT (53)     NULL,
    [object_flags]  INT            NOT NULL,
    [srtext]        VARCHAR (1024) NOT NULL,
    CONSTRAINT [spatial_ref_pk] PRIMARY KEY CLUSTERED ([srid] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [spatial_ref_xyunits] CHECK ([xyunits]>=(1)),
    CONSTRAINT [spatial_ref_zunits] CHECK ([zunits]>=(1))
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_spatial_references] TO PUBLIC
    AS [dbo];

