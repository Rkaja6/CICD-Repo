CREATE TABLE [DW].[HubAddress] (
    [RecordSource]   VARCHAR (50)  NOT NULL,
    [LoadDate]       DATETIME2 (7) CONSTRAINT [DF_HubAddress_LoadDate] DEFAULT (getdate()) NOT NULL,
    [NAME_u2_id]     VARCHAR (50)  NOT NULL,
    [AddressHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubAddress] PRIMARY KEY NONCLUSTERED ([AddressHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubAddress_Name_u2_id] UNIQUE NONCLUSTERED ([NAME_u2_id] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

