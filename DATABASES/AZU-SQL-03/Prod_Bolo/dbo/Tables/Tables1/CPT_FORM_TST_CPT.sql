CREATE TABLE [dbo].[CPT_FORM_TST_CPT] (
    [CPT_FORM_TST_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [TEST_CPTS]           VARCHAR (8)     NULL,
    [TEST_CPT_AMTS]       NUMERIC (19, 2) NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CPT_FORM_TST_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CPT_FORM_TST_CPT_u2_id_in]
    ON [dbo].[CPT_FORM_TST_CPT]([u2_id] ASC);

