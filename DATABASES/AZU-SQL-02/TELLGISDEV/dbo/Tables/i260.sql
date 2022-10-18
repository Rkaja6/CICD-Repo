﻿CREATE TABLE [dbo].[i260] (
    [id_type] INT    NOT NULL,
    [base_id] BIGINT NOT NULL,
    [num_ids] INT    NOT NULL,
    [last_id] BIGINT NULL,
    CONSTRAINT [i260_pk] PRIMARY KEY CLUSTERED ([id_type] ASC, [num_ids] ASC, [base_id] ASC)
);

