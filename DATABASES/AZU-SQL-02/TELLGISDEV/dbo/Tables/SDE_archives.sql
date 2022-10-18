CREATE TABLE [dbo].[SDE_archives] (
    [archiving_regid] INT           NOT NULL,
    [history_regid]   INT           NOT NULL,
    [from_date]       NVARCHAR (32) NOT NULL,
    [to_date]         NVARCHAR (32) NOT NULL,
    [archive_date]    BIGINT        NOT NULL,
    [archive_flags]   BIGINT        NOT NULL,
    CONSTRAINT [archives_pk] PRIMARY KEY CLUSTERED ([archiving_regid] ASC),
    CONSTRAINT [archives_fk1] FOREIGN KEY ([archiving_regid]) REFERENCES [dbo].[SDE_table_registry] ([registration_id]),
    CONSTRAINT [archives_fk2] FOREIGN KEY ([history_regid]) REFERENCES [dbo].[SDE_table_registry] ([registration_id]),
    CONSTRAINT [archives_uk] UNIQUE NONCLUSTERED ([history_regid] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_archives] TO PUBLIC
    AS [dbo];

