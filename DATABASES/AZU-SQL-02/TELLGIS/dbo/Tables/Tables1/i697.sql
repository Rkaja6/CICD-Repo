CREATE TABLE [dbo].[i697] (
    [id_type] INT    NOT NULL,
    [base_id] BIGINT NOT NULL,
    [num_ids] INT    NOT NULL,
    [last_id] BIGINT NULL,
    CONSTRAINT [i697_pk] PRIMARY KEY CLUSTERED ([id_type] ASC, [num_ids] ASC, [base_id] ASC)
);

