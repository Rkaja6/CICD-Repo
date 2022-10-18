CREATE TABLE [dbo].[MT_SYS] (
    [u2_id]                    VARCHAR (255) NOT NULL,
    [EQUIP_INVENTORY_ACCT]     VARCHAR (10)  NULL,
    [INVENTORY_WRITE_OFF_ACCT] VARCHAR (10)  NULL,
    [MT_GAIN_LOSS_ACCT]        VARCHAR (10)  NULL,
    [MT_VOU_APP]               VARCHAR (10)  NULL,
    [MT_VOU_SRC]               VARCHAR (3)   NULL,
    [PROCEEDS_CLRG_ACCT]       VARCHAR (10)  NULL,
    [PROPERTY_WRITE_OFF_ACCT]  VARCHAR (10)  NULL,
    [WIP_ACCUM_DDA_CLRG_ACCT]  VARCHAR (12)  NULL,
    [time_stamp]               DATETIME      NULL,
    [u2_checksum]              VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

