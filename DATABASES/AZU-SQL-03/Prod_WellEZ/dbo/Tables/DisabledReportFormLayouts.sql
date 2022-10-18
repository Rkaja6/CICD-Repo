CREATE TABLE [dbo].[DisabledReportFormLayouts] (
    [disabledreportformlayouts_id] INT    IDENTITY (1, 1) NOT NULL,
    [reportTypeId]                 BIGINT NOT NULL,
    CONSTRAINT [PK_DisabledReportFormLayouts] PRIMARY KEY CLUSTERED ([disabledreportformlayouts_id] ASC)
);

