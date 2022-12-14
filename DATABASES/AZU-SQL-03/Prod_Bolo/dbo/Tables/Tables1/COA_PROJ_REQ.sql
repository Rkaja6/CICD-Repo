CREATE TABLE [dbo].[COA_PROJ_REQ] (
    [COA_PROJ_REQ_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [PROJ_REQ]        VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([COA_PROJ_REQ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [COA_PROJ_REQ_u2_id_in]
    ON [dbo].[COA_PROJ_REQ]([u2_id] ASC);

