CREATE TABLE [dbo].[PROD_MO_THEO_CONN_TYPE] (
    [PROD_MO_THEO_CONN_TYPE_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]                      VARCHAR (255)   NULL,
    [AGGREGATE_OUTPUT_MMBTU]     NUMERIC (19, 2) NULL,
    [AGGREGATE_OUTPUT_VOL]       NUMERIC (19, 2) NULL,
    [AGGREGATE_OUTPUT_WATER_VOL] NUMERIC (19, 2) NULL,
    [BTU_FACTOR]                 NUMERIC (19, 4) NULL,
    [CONNECTION_TYPES]           VARCHAR (10)    NULL,
    [INJECTED]                   NUMERIC (19, 2) NULL,
    [INJECTED_MMBTU]             NUMERIC (19, 2) NULL,
    [NOT_USED_14]                VARCHAR (6)     NULL,
    [OUTPUT_MMBTU]               NUMERIC (19, 2) NULL,
    [OUTPUT_VOL]                 NUMERIC (19, 2) NULL,
    [OUTPUT_WATER_VOL]           NUMERIC (19, 2) NULL,
    [USED]                       NUMERIC (19, 2) NULL,
    [USED_MMBTU]                 NUMERIC (19, 2) NULL,
    [VOLUME_METHOD]              VARCHAR (6)     NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_MO_THEO_CONN_TYPE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_MO_T_u2_id_43006]
    ON [dbo].[PROD_MO_THEO_CONN_TYPE]([u2_id] ASC);

