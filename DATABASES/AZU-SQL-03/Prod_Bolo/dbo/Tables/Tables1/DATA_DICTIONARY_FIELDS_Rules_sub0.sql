CREATE TABLE [dbo].[DATA_DICTIONARY_FIELDS_Rules_sub0] (
    [subValueId]                      VARCHAR (255)  NOT NULL,
    [DATA_DICTIONARY_FIELDS_Rules_ID] VARCHAR (255)  NULL,
    [Rules]                           VARCHAR (1000) NULL,
    [time_stamp]                      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DATA_DICT_DATA_DICT_44146]
    ON [dbo].[DATA_DICTIONARY_FIELDS_Rules_sub0]([DATA_DICTIONARY_FIELDS_Rules_ID] ASC);

