CREATE TABLE [dbo].[SDE_versions] (
    [name]              NVARCHAR (64) NOT NULL,
    [owner]             NVARCHAR (32) NOT NULL,
    [version_id]        INT           NOT NULL,
    [status]            INT           NOT NULL,
    [state_id]          BIGINT        NOT NULL,
    [description]       NVARCHAR (64) NULL,
    [parent_name]       NVARCHAR (64) NULL,
    [parent_owner]      NVARCHAR (32) NULL,
    [parent_version_id] INT           NULL,
    [creation_time]     DATETIME      NOT NULL,
    CONSTRAINT [versions_pk] PRIMARY KEY CLUSTERED ([version_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [versions_uk] UNIQUE NONCLUSTERED ([name] ASC, [owner] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ver_state_ix]
    ON [dbo].[SDE_versions]([state_id] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_versions] TO PUBLIC
    AS [dbo];

