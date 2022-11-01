﻿CREATE TABLE [StagePeloton].[pvunitallocmonth] (
    [IDFLOWNET]                 VARCHAR (32)   NULL,
    [IDREC]                     VARCHAR (32)   NULL,
    [DTTMSTART]                 DATETIME       NULL,
    [DTTMEND]                   DATETIME       NULL,
    [SYSLOCKMEUI]               SMALLINT       NULL,
    [SYSLOCKCHILDRENUI]         SMALLINT       NULL,
    [SYSLOCKME]                 SMALLINT       NULL,
    [SYSLOCKCHILDREN]           SMALLINT       NULL,
    [SYSLOCKDATE]               DATETIME       NULL,
    [SYSMODDATE]                DATETIME       NULL,
    [SYSMODUSER]                VARCHAR (50)   NULL,
    [SYSCREATEDATE]             DATETIME       NULL,
    [SYSCREATEUSER]             VARCHAR (50)   NULL,
    [SYSTAG]                    VARCHAR (255)  NULL,
    [IDRECPARENT]               VARCHAR (32)   NULL,
    [IDRECCOMP]                 VARCHAR (32)   NULL,
    [IDRECCOMPTK]               VARCHAR (26)   NULL,
    [IDRECCOMPZONE]             VARCHAR (32)   NULL,
    [IDRECCOMPZONETK]           VARCHAR (26)   NULL,
    [YEAR]                      INT            NULL,
    [MONTH]                     INT            NULL,
    [DURDOWN]                   FLOAT (53)     NULL,
    [DUROP]                     FLOAT (53)     NULL,
    [VOLPRODGATHHCLIQ]          FLOAT (53)     NULL,
    [VOLPRODGATHGAS]            FLOAT (53)     NULL,
    [VOLPRODGATHWATER]          FLOAT (53)     NULL,
    [VOLPRODGATHSAND]           FLOAT (53)     NULL,
    [VOLPRODALLOCHCLIQ]         FLOAT (53)     NULL,
    [VOLPRODALLOCOIL]           FLOAT (53)     NULL,
    [VOLPRODALLOCCOND]          FLOAT (53)     NULL,
    [VOLPRODALLOCNGL]           FLOAT (53)     NULL,
    [VOLPRODALLOCHCLIQGASEQ]    FLOAT (53)     NULL,
    [VOLPRODALLOCGAS]           FLOAT (53)     NULL,
    [VOLPRODALLOCWATER]         FLOAT (53)     NULL,
    [VOLPRODALLOCSAND]          FLOAT (53)     NULL,
    [ALLOCFACTHCLIQ]            FLOAT (53)     NULL,
    [ALLOCFACTGAS]              FLOAT (53)     NULL,
    [ALLOCFACTWATER]            FLOAT (53)     NULL,
    [ALLOCFACTSAND]             FLOAT (53)     NULL,
    [VOLNEWPRODALLOCHCLIQ]      FLOAT (53)     NULL,
    [VOLNEWPRODALLOCOIL]        FLOAT (53)     NULL,
    [VOLNEWPRODALLOCCOND]       FLOAT (53)     NULL,
    [VOLNEWPRODALLOCNGL]        FLOAT (53)     NULL,
    [VOLNEWPRODALLOCHCLIQGASEQ] FLOAT (53)     NULL,
    [VOLNEWPRODALLOCGAS]        FLOAT (53)     NULL,
    [VOLNEWPRODALLOCWATER]      FLOAT (53)     NULL,
    [VOLNEWPRODALLOCSAND]       FLOAT (53)     NULL,
    [WIHCLIQ]                   FLOAT (53)     NULL,
    [WIGAS]                     FLOAT (53)     NULL,
    [WIWATER]                   FLOAT (53)     NULL,
    [WISAND]                    FLOAT (53)     NULL,
    [NRIHCLIQ]                  FLOAT (53)     NULL,
    [NRIGAS]                    FLOAT (53)     NULL,
    [NRIWATER]                  FLOAT (53)     NULL,
    [NRISAND]                   FLOAT (53)     NULL,
    [VOLLOSTHCLIQ]              FLOAT (53)     NULL,
    [VOLLOSTGAS]                FLOAT (53)     NULL,
    [VOLLOSTWATER]              FLOAT (53)     NULL,
    [VOLLOSTSAND]               FLOAT (53)     NULL,
    [VOLDIFFTARGETHCLIQ]        FLOAT (53)     NULL,
    [VOLDIFFTARGETOIL]          FLOAT (53)     NULL,
    [VOLDIFFTARGETCOND]         FLOAT (53)     NULL,
    [VOLDIFFTARGETNGL]          FLOAT (53)     NULL,
    [VOLDIFFTARGETGAS]          FLOAT (53)     NULL,
    [VOLDIFFTARGETWATER]        FLOAT (53)     NULL,
    [VOLDIFFTARGETSAND]         FLOAT (53)     NULL,
    [VOLRECOVHCLIQ]             FLOAT (53)     NULL,
    [VOLRECOVGAS]               FLOAT (53)     NULL,
    [VOLRECOVWATER]             FLOAT (53)     NULL,
    [VOLRECOVSAND]              FLOAT (53)     NULL,
    [VOLINJECTRECOVGAS]         FLOAT (53)     NULL,
    [VOLINJECTRECOVHCLIQ]       FLOAT (53)     NULL,
    [VOLINJECTRECOVWATER]       FLOAT (53)     NULL,
    [VOLINJECTRECOVSAND]        FLOAT (53)     NULL,
    [VOLSTARTREMAINRECOVHCLIQ]  FLOAT (53)     NULL,
    [VOLSTARTREMAINRECOVGAS]    FLOAT (53)     NULL,
    [VOLSTARTREMAINRECOVWATER]  FLOAT (53)     NULL,
    [VOLSTARTREMAINRECOVSAND]   FLOAT (53)     NULL,
    [VOLREMAINRECOVHCLIQ]       FLOAT (53)     NULL,
    [VOLREMAINRECOVGAS]         FLOAT (53)     NULL,
    [VOLREMAINRECOVWATER]       FLOAT (53)     NULL,
    [VOLREMAINRECOVSAND]        FLOAT (53)     NULL,
    [VOLSTARTINVHCLIQ]          FLOAT (53)     NULL,
    [VOLSTARTINVHCLIQGASEQ]     FLOAT (53)     NULL,
    [VOLSTARTINVWATER]          FLOAT (53)     NULL,
    [VOLSTARTINVSAND]           FLOAT (53)     NULL,
    [VOLENDINVHCLIQ]            FLOAT (53)     NULL,
    [VOLENDINVHCLIQGASEQ]       FLOAT (53)     NULL,
    [VOLENDINVWATER]            FLOAT (53)     NULL,
    [VOLENDINVSAND]             FLOAT (53)     NULL,
    [VOLCHGINVHCLIQ]            FLOAT (53)     NULL,
    [VOLCHGINVHCLIQGASEQ]       FLOAT (53)     NULL,
    [VOLCHGINVWATER]            FLOAT (53)     NULL,
    [VOLCHGINVSAND]             FLOAT (53)     NULL,
    [VOLDISPSALEHCLIQ]          FLOAT (53)     NULL,
    [VOLDISPSALEOIL]            FLOAT (53)     NULL,
    [VOLDISPSALECOND]           FLOAT (53)     NULL,
    [VOLDISPSALENGL]            FLOAT (53)     NULL,
    [VOLDISPSALEGAS]            FLOAT (53)     NULL,
    [VOLDISPFUELGAS]            FLOAT (53)     NULL,
    [VOLDISPFLAREGAS]           FLOAT (53)     NULL,
    [VOLDISPINCINERATEGAS]      FLOAT (53)     NULL,
    [VOLDISPVENTGAS]            FLOAT (53)     NULL,
    [VOLDISPINJECTGAS]          FLOAT (53)     NULL,
    [VOLDISPINJECTWATER]        FLOAT (53)     NULL,
    [VOLINJECTHCLIQ]            FLOAT (53)     NULL,
    [VOLINJECTGAS]              FLOAT (53)     NULL,
    [VOLINJECTWATER]            FLOAT (53)     NULL,
    [VOLINJECTSAND]             FLOAT (53)     NULL,
    [VOLPRODCUMHCLIQ]           FLOAT (53)     NULL,
    [VOLPRODCUMOIL]             FLOAT (53)     NULL,
    [VOLPRODCUMCOND]            FLOAT (53)     NULL,
    [VOLPRODCUMNGL]             FLOAT (53)     NULL,
    [VOLPRODCUMGAS]             FLOAT (53)     NULL,
    [VOLPRODCUMWATER]           FLOAT (53)     NULL,
    [VOLPRODCUMSAND]            FLOAT (53)     NULL,
    [IDRECMEASMETH]             VARCHAR (32)   NULL,
    [IDRECMEASMETHTK]           VARCHAR (26)   NULL,
    [IDRECFLUIDLEVEL]           VARCHAR (32)   NULL,
    [IDRECFLUIDLEVELTK]         VARCHAR (26)   NULL,
    [IDRECTEST]                 VARCHAR (32)   NULL,
    [IDRECTESTTK]               VARCHAR (26)   NULL,
    [IDRECPARAM]                VARCHAR (32)   NULL,
    [IDRECPARAMTK]              VARCHAR (26)   NULL,
    [IDRECDOWNTIME]             VARCHAR (32)   NULL,
    [IDRECDOWNTIMETK]           VARCHAR (26)   NULL,
    [IDRECGASANALYSIS]          VARCHAR (32)   NULL,
    [IDRECGASANALYSISTK]        VARCHAR (26)   NULL,
    [IDRECHCLIQANALYSIS]        VARCHAR (32)   NULL,
    [IDRECHCLIQANALYSISTK]      VARCHAR (26)   NULL,
    [IDRECOILANALYSIS]          VARCHAR (32)   NULL,
    [IDRECOILANALYSISTK]        VARCHAR (26)   NULL,
    [IDRECWATERANALYSIS]        VARCHAR (32)   NULL,
    [IDRECWATERANALYSISTK]      VARCHAR (26)   NULL,
    [IDRECSTATUS]               VARCHAR (32)   NULL,
    [IDRECSTATUSTK]             VARCHAR (26)   NULL,
    [IDRECPUMPENTRY]            VARCHAR (32)   NULL,
    [IDRECPUMPENTRYTK]          VARCHAR (26)   NULL,
    [IDRECFACILITY]             VARCHAR (32)   NULL,
    [IDRECFACILITYTK]           VARCHAR (26)   NULL,
    [PUMPEFF]                   FLOAT (53)     NULL,
    [IDRECCALCSET]              VARCHAR (32)   NULL,
    [IDRECCALCSETTK]            VARCHAR (26)   NULL,
    [AREA]                      VARCHAR (50)   NULL,
    [COM]                       VARCHAR (2000) NULL,
    [COUNTRY]                   VARCHAR (50)   NULL,
    [COUNTY]                    VARCHAR (50)   NULL,
    [DISTRICT]                  VARCHAR (100)  NULL,
    [DIVISION]                  VARCHAR (100)  NULL,
    [DIVISIONCODE]              VARCHAR (100)  NULL,
    [FIELDCODE]                 VARCHAR (50)   NULL,
    [FIELDOFFICE]               VARCHAR (50)   NULL,
    [FIELDOFFICECODE]           VARCHAR (50)   NULL,
    [GOVAUTHORITY]              VARCHAR (50)   NULL,
    [LATITUDE]                  FLOAT (53)     NULL,
    [LATLONGDATUM]              VARCHAR (50)   NULL,
    [LATLONGSOURCE]             VARCHAR (50)   NULL,
    [LEASE]                     VARCHAR (50)   NULL,
    [LOCATIONTYP]               VARCHAR (50)   NULL,
    [LONGITUDE]                 FLOAT (53)     NULL,
    [OPERATED]                  SMALLINT       NULL,
    [OPERATOR]                  VARCHAR (50)   NULL,
    [PADCODE]                   VARCHAR (50)   NULL,
    [PADNAME]                   VARCHAR (50)   NULL,
    [PLATFORM]                  VARCHAR (50)   NULL,
    [SLOT]                      VARCHAR (20)   NULL,
    [STATEPROV]                 VARCHAR (50)   NULL,
    [USERDTTM1]                 DATETIME       NULL,
    [USERDTTM2]                 DATETIME       NULL,
    [USERDTTM3]                 DATETIME       NULL,
    [USERDTTM4]                 DATETIME       NULL,
    [USERDTTM5]                 DATETIME       NULL,
    [USERNUM1]                  FLOAT (53)     NULL,
    [USERNUM2]                  FLOAT (53)     NULL,
    [USERNUM3]                  FLOAT (53)     NULL,
    [USERNUM4]                  FLOAT (53)     NULL,
    [USERNUM5]                  FLOAT (53)     NULL,
    [USERTXT1]                  VARCHAR (50)   NULL,
    [USERTXT2]                  VARCHAR (50)   NULL,
    [USERTXT3]                  VARCHAR (50)   NULL,
    [USERTXT4]                  VARCHAR (50)   NULL,
    [USERTXT5]                  VARCHAR (50)   NULL,
    [UTMGRIDZONE]               INT            NULL,
    [UTMSOURCE]                 VARCHAR (50)   NULL,
    [UTMX]                      FLOAT (53)     NULL,
    [UTMY]                      FLOAT (53)     NULL,
    [NAME]                      VARCHAR (100)  NULL,
    [NAMESHORT]                 VARCHAR (50)   NULL,
    [TYP1]                      VARCHAR (50)   NULL,
    [TYP2]                      VARCHAR (50)   NULL,
    [TYPDISPHCLIQ]              VARCHAR (50)   NULL,
    [DISPPRODUCTNAME]           VARCHAR (50)   NULL,
    [IDRECROUTESETROUTECALC]    VARCHAR (32)   NULL,
    [IDRECROUTESETROUTECALCTK]  VARCHAR (26)   NULL,
    [IDRECFACILITYCALC]         VARCHAR (32)   NULL,
    [IDRECFACILITYCALCTK]       VARCHAR (26)   NULL,
    [TYPREGULATORY]             VARCHAR (50)   NULL,
    [TYPPA]                     VARCHAR (50)   NULL,
    [DISPLAYSIZEFACTOR]         FLOAT (53)     NULL,
    [DTTMHIDE]                  DATETIME       NULL,
    [ELEVATION]                 FLOAT (53)     NULL,
    [UNITIDREGULATORY]          VARCHAR (50)   NULL,
    [UNITIDPA]                  VARCHAR (50)   NULL,
    [UNITIDA]                   VARCHAR (50)   NULL,
    [UNITIDB]                   VARCHAR (50)   NULL,
    [UNITIDC]                   VARCHAR (50)   NULL,
    [PURCHASER]                 SMALLINT       NULL,
    [OPERATORIDA]               VARCHAR (50)   NULL,
    [LEGALSURFLOC]              VARCHAR (100)  NULL,
    [FIELD]                     VARCHAR (50)   NULL,
    [LEASEIDA]                  VARCHAR (50)   NULL,
    [COSTCENTERIDA]             VARCHAR (50)   NULL,
    [COSTCENTERIDB]             VARCHAR (50)   NULL,
    [SORTBYUSER]                VARCHAR (50)   NULL,
    [PRIORITY]                  SMALLINT       NULL,
    [TIMEZONE]                  VARCHAR (100)  NULL,
    [IDRECRESP1]                VARCHAR (32)   NULL,
    [IDRECRESP1TK]              VARCHAR (26)   NULL,
    [IDRECRESP2]                VARCHAR (32)   NULL,
    [IDRECRESP2TK]              VARCHAR (26)   NULL,
    [KEYMIGRATIONSOURCE]        VARCHAR (100)  NULL,
    [TYPMIGRATIONSOURCE]        VARCHAR (100)  NULL
);
