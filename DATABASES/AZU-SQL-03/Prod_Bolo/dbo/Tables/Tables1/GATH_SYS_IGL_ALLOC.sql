CREATE TABLE [dbo].[GATH_SYS_IGL_ALLOC] (
    [GATH_SYS_IGL_ALLOC_ID]  VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [IGL_ALLOC_ORDER]        VARCHAR (5)   NULL,
    [IGL_ALLOC_SUB_FAC_PROD] VARCHAR (5)   NULL,
    [TRANSFORMED_DATE]       DATETIME      NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GATH_SYS_IGL_ALLOC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GATH_SYS_IGL_ALLOC_u2_id_in]
    ON [dbo].[GATH_SYS_IGL_ALLOC]([u2_id] ASC);

