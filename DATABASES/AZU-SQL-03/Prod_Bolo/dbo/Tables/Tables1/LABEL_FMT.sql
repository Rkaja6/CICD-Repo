CREATE TABLE [dbo].[LABEL_FMT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COLUMNS]     NUMERIC (9)   NULL,
    [DESCRIPTION] VARCHAR (46)  NULL,
    [INDENT]      NUMERIC (9)   NULL,
    [NUL]         VARCHAR (6)   NULL,
    [PRSTYLE_REF] VARCHAR (10)  NULL,
    [ROW_ID]      NUMERIC (9)   NULL,
    [SKIP]        NUMERIC (9)   NULL,
    [SPC]         NUMERIC (9)   NULL,
    [SZ]          NUMERIC (9)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

