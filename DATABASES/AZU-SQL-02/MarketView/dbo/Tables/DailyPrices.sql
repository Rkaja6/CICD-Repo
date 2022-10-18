CREATE TABLE [dbo].[DailyPrices] (
    [CLOSE]              DECIMAL (28, 10) NULL,
    [EXPIRATION_DATE]    DATETIME         NULL,
    [HIGH]               DECIMAL (28, 10) NULL,
    [INSTRUMENT_ID]      NVARCHAR (255)   NULL,
    [LOW]                DECIMAL (28, 10) NULL,
    [OPEN]               DECIMAL (28, 10) NULL,
    [OPEN_INTEREST]      TINYINT          NULL,
    [SETTLEFORCLOSE]     NVARCHAR (255)   NULL,
    [SYMBOL_DESCRIPTION] NVARCHAR (255)   NULL,
    [TRADE_DATETIME]     DATETIME         NULL,
    [UNDERLIER]          NVARCHAR (255)   NULL,
    [VOLUME]             TINYINT          NULL,
    [text]               NVARCHAR (255)   NULL,
    [INSTRUMENTS_Id]     NUMERIC (20)     NULL
);

