CREATE TABLE [dbo].[CN_CC_MAP_MAP] (
    [CN_CC_MAP_MAP_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [ALT_DIST]         VARCHAR (3)   NULL,
    [FROM_CC]          VARCHAR (13)  NULL,
    [TO_CC]            VARCHAR (13)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CN_CC_MAP_MAP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CN_CC_MAP_MAP_u2_id_in]
    ON [dbo].[CN_CC_MAP_MAP]([u2_id] ASC);

