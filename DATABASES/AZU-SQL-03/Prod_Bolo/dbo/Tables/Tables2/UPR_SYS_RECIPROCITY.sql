CREATE TABLE [dbo].[UPR_SYS_RECIPROCITY] (
    [UPR_SYS_RECIPROCITY_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [RECIPROCITY_AGENCIES]   VARCHAR (8)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([UPR_SYS_RECIPROCITY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UPR_SYS_RECIPROCITY_u2_id_in]
    ON [dbo].[UPR_SYS_RECIPROCITY]([u2_id] ASC);

