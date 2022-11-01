﻿CREATE TABLE [StagePeloton].[wvjobreportcostgen] (
    [idwell]                       VARCHAR (32)  NOT NULL,
    [idrecparent]                  VARCHAR (32)  NULL,
    [syscarryfwdp]                 SMALLINT      NULL,
    [idrec]                        VARCHAR (32)  NOT NULL,
    [code1]                        VARCHAR (100) NULL,
    [code2]                        VARCHAR (100) NULL,
    [code3]                        VARCHAR (100) NULL,
    [code4]                        VARCHAR (100) NULL,
    [code5]                        VARCHAR (100) NULL,
    [code6]                        VARCHAR (100) NULL,
    [cost]                         FLOAT (53)    NULL,
    [des]                          VARCHAR (100) NULL,
    [idrecafecustom]               VARCHAR (32)  NULL,
    [idrecafecustomtk]             VARCHAR (26)  NULL,
    [idrecintervalproblemcustom]   VARCHAR (32)  NULL,
    [idrecintervalproblemcustomtk] VARCHAR (26)  NULL,
    [idrecphasecustom]             VARCHAR (32)  NULL,
    [idrecphasecustomtk]           VARCHAR (26)  NULL,
    [intervalproblempct]           FLOAT (53)    NULL,
    [note]                         VARCHAR (255) NULL,
    [opscategory]                  VARCHAR (50)  NULL,
    [polineno]                     VARCHAR (50)  NULL,
    [pono]                         VARCHAR (50)  NULL,
    [sn]                           VARCHAR (50)  NULL,
    [ticketno]                     VARCHAR (50)  NULL,
    [unschedtyp]                   VARCHAR (100) NULL,
    [userboolean1]                 SMALLINT      NULL,
    [usertxt1]                     VARCHAR (50)  NULL,
    [vendor]                       VARCHAR (100) NULL,
    [vendorcode]                   VARCHAR (100) NULL,
    [vendorsubcode]                VARCHAR (100) NULL,
    [workorderno]                  VARCHAR (50)  NULL,
    [sysseq]                       INT           NULL,
    [syslockmeui]                  SMALLINT      NULL,
    [syslockchildrenui]            SMALLINT      NULL,
    [syslockme]                    SMALLINT      NULL,
    [syslockchildren]              SMALLINT      NULL,
    [syslockdate]                  DATETIME      NULL,
    [sysmoddate]                   DATETIME      NULL,
    [sysmoduser]                   VARCHAR (50)  NULL,
    [syscreatedate]                DATETIME      NULL,
    [syscreateuser]                VARCHAR (50)  NULL,
    [systag]                       VARCHAR (255) NULL
);
