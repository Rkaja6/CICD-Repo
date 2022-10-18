CREATE TABLE [DW].[_LinkHashKeyTranslation] (
    [OldHashKey]   CHAR (32)     NOT NULL,
    [NewHashKey]   BINARY (32)   NOT NULL,
    [BusinessKey]  VARCHAR (MAX) NOT NULL,
    [HubTableName] VARCHAR (200) NOT NULL
);

