﻿CREATE TABLE [StagePeloton].[wvwellboresize] (
    [idwell]            VARCHAR (32)  NOT NULL,
    [idrecparent]       VARCHAR (32)  NULL,
    [idrec]             VARCHAR (32)  NOT NULL,
    [depthbtmactual]    FLOAT (53)    NULL,
    [depthbtmprop]      FLOAT (53)    NULL,
    [depthtopactual]    FLOAT (53)    NULL,
    [depthtopprop]      FLOAT (53)    NULL,
    [des]               VARCHAR (100) NULL,
    [dttmend]           DATETIME      NULL,
    [dttmpropend]       DATETIME      NULL,
    [dttmstart]         DATETIME      NULL,
    [dttmpropstart]     DATETIME      NULL,
    [sz]                FLOAT (53)    NULL,
    [syslockmeui]       SMALLINT      NULL,
    [syslockchildrenui] SMALLINT      NULL,
    [syslockme]         SMALLINT      NULL,
    [syslockchildren]   SMALLINT      NULL,
    [syslockdate]       DATETIME      NULL,
    [sysmoddate]        DATETIME      NULL,
    [sysmoduser]        VARCHAR (50)  NULL,
    [syscreatedate]     DATETIME      NULL,
    [syscreateuser]     VARCHAR (50)  NULL,
    [systag]            VARCHAR (255) NULL
);
