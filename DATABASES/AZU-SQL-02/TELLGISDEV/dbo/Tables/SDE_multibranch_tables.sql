CREATE TABLE [dbo].[SDE_multibranch_tables] (
    [registration_id] INT            NOT NULL,
    [start_moment]    DATETIME2 (7)  CONSTRAINT [start_moment_def] DEFAULT (CONVERT([datetime2](3),getutcdate())) NOT NULL,
    [behavior_map]    BINARY (16)    CONSTRAINT [behavior_map_def] DEFAULT (0x00) NOT NULL,
    [properties]      NVARCHAR (MAX) NULL,
    CONSTRAINT [registration_id_pk] PRIMARY KEY CLUSTERED ([registration_id] ASC),
    CONSTRAINT [mb_ref_fk] FOREIGN KEY ([registration_id]) REFERENCES [dbo].[SDE_table_registry] ([registration_id]) ON DELETE CASCADE
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_multibranch_tables] TO PUBLIC
    AS [dbo];

