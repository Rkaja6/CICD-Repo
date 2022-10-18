CREATE TABLE [TEMP].[ARSYSTBL] (
    [TABLESET]                 VARCHAR (12)  NOT NULL,
    [TBL_ALIAS]                VARCHAR (8)   NOT NULL,
    [DESCRIPTN]                VARCHAR (254) NULL,
    [ODBCSRC]                  VARCHAR (60)  NULL,
    [TABLENAME]                VARCHAR (60)  NULL,
    [PARENT]                   VARCHAR (60)  NULL,
    [FOREIGNKEY]               VARCHAR (60)  NULL,
    [MODEL]                    VARCHAR (1)   NULL,
    [PERIOD]                   VARCHAR (1)   NULL,
    [SUNITS]                   VARCHAR (6)   NULL,
    [TYPE]                     VARCHAR (1)   NULL,
    [EDITABLE]                 VARCHAR (1)   NULL,
    [COMBTABLE]                VARCHAR (1)   NULL,
    [COMBRULE]                 VARCHAR (60)  NULL,
    [COPYSUM]                  VARCHAR (1)   NULL,
    [COPYPROP]                 VARCHAR (1)   NULL,
    [HASLONG]                  VARCHAR (1)   NULL,
    [ENABLE_DROPDOWN_TABLE]    VARCHAR (1)   NULL,
    [ENABLE_EDITOR_VALIDATION] VARCHAR (1)   NULL,
    [DROPDOWN_TABLENAME]       VARCHAR (60)  NULL
);

