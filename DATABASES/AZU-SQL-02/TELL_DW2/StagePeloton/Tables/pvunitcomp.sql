CREATE TABLE [StagePeloton].[pvunitcomp] (
    [idrec]                    VARCHAR (32)   NULL,
    [usertxt1]                 VARCHAR (50)   NULL,
    [usertxt2]                 VARCHAR (50)   NULL,
    [usertxt3]                 VARCHAR (50)   NULL,
    [usertxt4]                 VARCHAR (50)   NULL,
    [usertxt5]                 VARCHAR (50)   NULL,
    [syslockmeui]              SMALLINT       NULL,
    [syslockchildrenui]        SMALLINT       NULL,
    [syslockme]                SMALLINT       NULL,
    [syslockchildren]          SMALLINT       NULL,
    [syslockdate]              DATETIME       NULL,
    [sysmoddate]               DATETIME       NULL,
    [sysmoduser]               VARCHAR (50)   NULL,
    [syscreatedate]            DATETIME       NULL,
    [syscreateuser]            VARCHAR (50)   NULL,
    [systag]                   VARCHAR (255)  NULL,
    [idflownet]                VARCHAR (32)   NULL,
    [idrecparent]              VARCHAR (32)   NULL,
    [dttmstartalloc]           DATETIME       NULL,
    [dttmend]                  DATETIME       NULL,
    [dttmonprod]               DATETIME       NULL,
    [dttmfirstsale]            DATETIME       NULL,
    [dttmflowbackstart]        DATETIME       NULL,
    [dttmflowbackend]          DATETIME       NULL,
    [dttmabandon]              DATETIME       NULL,
    [completionname]           VARCHAR (50)   NULL,
    [permanentid]              VARCHAR (32)   NULL,
    [compidregulatory]         VARCHAR (50)   NULL,
    [compidpa]                 VARCHAR (50)   NULL,
    [completionlicensee]       VARCHAR (50)   NULL,
    [completionlicenseno]      VARCHAR (50)   NULL,
    [dttmlicense]              DATETIME       NULL,
    [compida]                  VARCHAR (50)   NULL,
    [compidb]                  VARCHAR (50)   NULL,
    [compidc]                  VARCHAR (50)   NULL,
    [compidd]                  VARCHAR (50)   NULL,
    [completionide]            VARCHAR (50)   NULL,
    [completioncode]           VARCHAR (50)   NULL,
    [wellname]                 VARCHAR (100)  NULL,
    [wellidregulatory]         VARCHAR (50)   NULL,
    [wellidpa]                 VARCHAR (50)   NULL,
    [welllicenseno]            VARCHAR (50)   NULL,
    [wellida]                  VARCHAR (50)   NULL,
    [wellidb]                  VARCHAR (50)   NULL,
    [wellidc]                  VARCHAR (50)   NULL,
    [wellidd]                  VARCHAR (50)   NULL,
    [wellide]                  VARCHAR (50)   NULL,
    [importid1]                VARCHAR (2000) NULL,
    [importtyp1]               VARCHAR (50)   NULL,
    [importid2]                VARCHAR (2000) NULL,
    [importtyp2]               VARCHAR (50)   NULL,
    [exportid1]                VARCHAR (2000) NULL,
    [exporttyp1]               VARCHAR (50)   NULL,
    [exportid2]                VARCHAR (2000) NULL,
    [exporttyp2]               VARCHAR (50)   NULL,
    [latitude]                 FLOAT (53)     NULL,
    [longitude]                FLOAT (53)     NULL,
    [latlongsource]            VARCHAR (50)   NULL,
    [latlongdatum]             VARCHAR (50)   NULL,
    [entryreqperiodfluidlevel] VARCHAR (50)   NULL,
    [entryreqperiodparam]      VARCHAR (50)   NULL,
    [usernum1]                 FLOAT (53)     NULL,
    [usernum2]                 FLOAT (53)     NULL,
    [usernum3]                 FLOAT (53)     NULL,
    [usernum4]                 FLOAT (53)     NULL,
    [usernum5]                 FLOAT (53)     NULL,
    [userdttm1]                DATETIME       NULL,
    [userdttm2]                DATETIME       NULL,
    [userdttm3]                DATETIME       NULL,
    [userdttm4]                DATETIME       NULL,
    [userdttm5]                DATETIME       NULL,
    [keymigrationsource]       VARCHAR (100)  NULL,
    [typmigrationsource]       VARCHAR (100)  NULL,
    [idwell]                   VARCHAR (32)   NULL,
    [com]                      VARCHAR (2000) NULL,
    [datasource]               VARCHAR (50)   NULL,
    [depthbtm]                 FLOAT (53)     NULL,
    [depthref]                 FLOAT (53)     NULL,
    [depthtop]                 FLOAT (53)     NULL,
    [dttmzoneabandon]          DATETIME       NULL,
    [dttmzonelic]              DATETIME       NULL,
    [dttmzoneonprod]           DATETIME       NULL,
    [fieldcode]                VARCHAR (50)   NULL,
    [fieldname]                VARCHAR (50)   NULL,
    [iconname]                 VARCHAR (255)  NULL,
    [idrecwellbore]            VARCHAR (32)   NULL,
    [idrecwellboretk]          VARCHAR (26)   NULL,
    [objective]                VARCHAR (100)  NULL,
    [unitcode]                 VARCHAR (50)   NULL,
    [unitname]                 VARCHAR (50)   NULL,
    [usertxt6]                 VARCHAR (50)   NULL,
    [zonecode]                 VARCHAR (50)   NULL,
    [zoneida]                  VARCHAR (50)   NULL,
    [zoneidb]                  VARCHAR (50)   NULL,
    [zoneidc]                  VARCHAR (50)   NULL,
    [zoneidd]                  VARCHAR (50)   NULL,
    [zoneide]                  VARCHAR (50)   NULL,
    [zonelicensee]             VARCHAR (50)   NULL,
    [zonelicenseno]            VARCHAR (50)   NULL,
    [zonename]                 VARCHAR (50)   NULL
);

