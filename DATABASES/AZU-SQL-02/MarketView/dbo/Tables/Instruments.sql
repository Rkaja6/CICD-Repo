CREATE TABLE [dbo].[Instruments] (
    [CONVERSION_FACTOR]                DECIMAL (28, 10) NULL,
    [CURRENCY]                         NVARCHAR (255)   NULL,
    [DISPLAY_CONTRACT_EXPIRATION_DATE] NVARCHAR (255)   NULL,
    [EXCHANGE_CODE]                    NVARCHAR (255)   NULL,
    [EXPIRATION_DATE]                  NVARCHAR (255)   NULL,
    [INSTRUMENT_ID]                    NVARCHAR (255)   NULL,
    [LOT_UNITS]                        NVARCHAR (255)   NULL,
    [PUT_CALL]                         NVARCHAR (255)   NULL,
    [SECURITY_TYPE]                    NVARCHAR (255)   NULL,
    [SESSION]                          TINYINT          NULL,
    [SYMBOL_DESCRIPTION]               NVARCHAR (255)   NULL,
    [UNDERLIER]                        NVARCHAR (255)   NULL,
    [text]                             NVARCHAR (255)   NULL,
    [INSTRUMENTS_Id]                   NUMERIC (20)     NULL
);

