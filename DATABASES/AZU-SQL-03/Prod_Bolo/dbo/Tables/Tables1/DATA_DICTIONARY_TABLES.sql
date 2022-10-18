CREATE TABLE [dbo].[DATA_DICTIONARY_TABLES] (
    [u2_id]                   VARCHAR (255) NOT NULL,
    [Base_Table_Name]         VARCHAR (20)  NULL,
    [DD_Field_Alias]          VARCHAR (20)  NULL,
    [DESC_]                   VARCHAR (32)  NULL,
    [Hidden]                  VARCHAR (20)  NULL,
    [NEXUS_TABLE_pk]          VARCHAR (30)  NULL,
    [Nexus_Table_Description] VARCHAR (122) NULL,
    [Nexus_Table_Name]        VARCHAR (44)  NULL,
    [Prefix]                  VARCHAR (38)  NULL,
    [Subtype_Field]           VARCHAR (20)  NULL,
    [Subtype_Match_Type]      VARCHAR (20)  NULL,
    [Subtype_Value]           VARCHAR (20)  NULL,
    [Unidata_File_Name]       VARCHAR (30)  NULL,
    [Unidata_Orig_File_Name]  VARCHAR (30)  NULL,
    [XRef_I_Types]            VARCHAR (20)  NULL,
    [XRef_Tables]             VARCHAR (20)  NULL,
    [time_stamp]              DATETIME      NULL,
    [u2_checksum]             VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

