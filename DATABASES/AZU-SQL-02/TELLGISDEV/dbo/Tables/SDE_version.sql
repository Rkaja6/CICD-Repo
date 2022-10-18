CREATE TABLE [dbo].[SDE_version] (
    [MAJOR]          INT           NOT NULL,
    [MINOR]          INT           NOT NULL,
    [BUGFIX]         INT           NOT NULL,
    [DESCRIPTION]    NVARCHAR (96) NOT NULL,
    [RELEASE]        INT           NOT NULL,
    [SDESVR_REL_LOW] INT           NOT NULL,
    CONSTRAINT [version_pk] PRIMARY KEY CLUSTERED ([MAJOR] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_version] TO PUBLIC
    AS [dbo];

