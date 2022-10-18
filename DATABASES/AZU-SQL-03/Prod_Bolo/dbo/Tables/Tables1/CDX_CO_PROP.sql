CREATE TABLE [dbo].[CDX_CO_PROP] (
    [CDX_CO_PROP_ID]     VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [BOOK_RI_FLAGS]      VARCHAR (4)   NULL,
    [CDX_PROPERTY_CODES] VARCHAR (16)  NULL,
    [CONTRACTS]          VARCHAR (25)  NULL,
    [COST_CENTERS]       VARCHAR (7)   NULL,
    [DIV_IDS]            VARCHAR (6)   NULL,
    [PROP_SEV_CPT]       VARCHAR (11)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CDX_CO_PROP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CDX_CO_PROP_u2_id_in]
    ON [dbo].[CDX_CO_PROP]([u2_id] ASC);

