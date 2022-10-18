CREATE TABLE [DW].[SatParty] (
    [RecordSource]       VARCHAR (50)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF_SatParty_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]        DATETIME2 (7) NULL,
    [Alt_Name]           VARCHAR (111) NULL,
    [Entity_Type]        VARCHAR (6)   NULL,
    [Land_1099_Exempt]   VARCHAR (6)   NULL,
    [Name_Line_1]        VARCHAR (35)  NULL,
    [Name_Line_2]        VARCHAR (35)  NULL,
    [Name_Line_3]        VARCHAR (33)  NULL,
    [Name_Control_1099]  VARCHAR (7)   NULL,
    [Residence_State]    VARCHAR (3)   NULL,
    [Sort_Key]           VARCHAR (87)  NULL,
    [Tax_Entity_Type]    VARCHAR (6)   NULL,
    [Tax_ID]             VARCHAR (11)  NULL,
    [W8]                 VARCHAR (2)   NULL,
    [W8_Eff_Date]        DATETIME      NULL,
    [W9]                 VARCHAR (2)   NULL,
    [W9_Eff_Date]        DATETIME      NULL,
    [InternalEntityFlag] VARCHAR (1)   NULL,
    [PartyHashKey]       BINARY (32)   NOT NULL,
    CONSTRAINT [PK_SatParty] PRIMARY KEY NONCLUSTERED ([PartyHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

