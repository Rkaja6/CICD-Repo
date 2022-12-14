CREATE TABLE [StagePeloton].[wvjob] (
    [idwell]               VARCHAR (32)   NOT NULL,
    [idrec]                VARCHAR (32)   NOT NULL,
    [chartofaccounts]      VARCHAR (50)   NULL,
    [client]               VARCHAR (50)   NULL,
    [complexityindex]      VARCHAR (50)   NULL,
    [costfinalactual]      FLOAT (53)     NULL,
    [currencycode]         VARCHAR (10)   NULL,
    [currencyexchangerate] FLOAT (53)     NULL,
    [dttmend]              DATETIME       NULL,
    [dttmspud]             DATETIME       NULL,
    [dttmstart]            DATETIME       NULL,
    [dttmstartplan]        DATETIME       NULL,
    [idrectub]             VARCHAR (32)   NULL,
    [idrectubtk]           VARCHAR (26)   NULL,
    [idrecwellbore]        VARCHAR (32)   NULL,
    [idrecwellboretk]      VARCHAR (26)   NULL,
    [jobida]               VARCHAR (50)   NULL,
    [jobidb]               VARCHAR (50)   NULL,
    [jobidc]               VARCHAR (50)   NULL,
    [jobsubtyp]            VARCHAR (100)  NULL,
    [jobtyp]               VARCHAR (100)  NULL,
    [objective]            VARCHAR (2000) NULL,
    [objectivegeo]         VARCHAR (2000) NULL,
    [ratetargetcond]       FLOAT (53)     NULL,
    [rateactualcond]       FLOAT (53)     NULL,
    [ratetargetgas]        FLOAT (53)     NULL,
    [rateactualgas]        FLOAT (53)     NULL,
    [ratetargetoil]        FLOAT (53)     NULL,
    [rateactualoil]        FLOAT (53)     NULL,
    [ratetargetwater]      FLOAT (53)     NULL,
    [rateactualwater]      FLOAT (53)     NULL,
    [responsiblegrp1]      VARCHAR (50)   NULL,
    [responsiblegrp2]      VARCHAR (50)   NULL,
    [responsiblegrp3]      VARCHAR (50)   NULL,
    [resulttechnical]      VARCHAR (50)   NULL,
    [status1]              VARCHAR (50)   NULL,
    [status2]              VARCHAR (50)   NULL,
    [summary]              VARCHAR (2000) NULL,
    [summarygeo]           VARCHAR (2000) NULL,
    [targetdepth]          FLOAT (53)     NULL,
    [targetform]           VARCHAR (50)   NULL,
    [userboolean1]         SMALLINT       NULL,
    [userboolean2]         SMALLINT       NULL,
    [usernum1]             FLOAT (53)     NULL,
    [usernum2]             FLOAT (53)     NULL,
    [usernum3]             FLOAT (53)     NULL,
    [usernum4]             FLOAT (53)     NULL,
    [usernum5]             FLOAT (53)     NULL,
    [usertxt1]             VARCHAR (100)  NULL,
    [usertxt2]             VARCHAR (100)  NULL,
    [usertxt3]             VARCHAR (100)  NULL,
    [usertxt4]             VARCHAR (100)  NULL,
    [usertxt5]             VARCHAR (100)  NULL,
    [wvtyp]                VARCHAR (100)  NULL,
    [syslockmeui]          SMALLINT       NULL,
    [syslockchildrenui]    SMALLINT       NULL,
    [syslockme]            SMALLINT       NULL,
    [syslockchildren]      SMALLINT       NULL,
    [syslockdate]          DATETIME       NULL,
    [sysmoddate]           DATETIME       NULL,
    [sysmoduser]           VARCHAR (50)   NULL,
    [syscreatedate]        DATETIME       NULL,
    [syscreateuser]        VARCHAR (50)   NULL,
    [systag]               VARCHAR (255)  NULL
);

