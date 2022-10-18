CREATE TABLE [DW].[LinkPartyAddress] (
    [PartyHashKey]        CHAR (32)     NOT NULL,
    [AddressHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]        VARCHAR (50)  NOT NULL,
    [LoadDate]            DATETIME2 (7) CONSTRAINT [DF_LinkPartyAddress__LoadDate] DEFAULT (getdate()) NOT NULL,
    [PartyAddressHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_LinkPartyAddress] PRIMARY KEY NONCLUSTERED ([PartyAddressHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

