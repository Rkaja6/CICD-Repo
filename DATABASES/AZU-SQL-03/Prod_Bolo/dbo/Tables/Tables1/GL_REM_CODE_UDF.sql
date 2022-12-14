CREATE TABLE [dbo].[GL_REM_CODE_UDF] (
    [GL_REM_CODE_UDF_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [EDIT_CODES]         VARCHAR (13)  NULL,
    [EDIT_VALUES]        VARCHAR (26)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GL_REM_CODE_UDF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_REM_CODE_UDF_u2_id_in]
    ON [dbo].[GL_REM_CODE_UDF]([u2_id] ASC);

