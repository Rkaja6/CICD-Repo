CREATE TABLE [dbo].[i98] (
    [id_type] INT NOT NULL,
    [base_id] INT NOT NULL,
    [num_ids] INT NOT NULL,
    [last_id] INT NULL,
    CONSTRAINT [i98_pk] PRIMARY KEY CLUSTERED ([id_type] ASC, [num_ids] ASC, [base_id] ASC)
);

