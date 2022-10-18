﻿CREATE TABLE [dbo].[RXT_FINANCIAL_2017Q4] (
    [OBJECTID]   INT             NOT NULL,
    [COMPANY]    NVARCHAR (250)  NULL,
    [COMPANY_ID] NVARCHAR (255)  NULL,
    [BS_CASH]    NUMERIC (38, 8) NULL,
    [BS_RVCUR]   NUMERIC (38, 8) NULL,
    [BS_INV]     NUMERIC (38, 8) NULL,
    [BS_OACUR]   NUMERIC (38, 8) NULL,
    [BS_ACURR]   NUMERIC (38, 8) NULL,
    [BS_LTINV]   NUMERIC (38, 8) NULL,
    [BS_PRTY]    NUMERIC (38, 8) NULL,
    [BS_GDWLL]   NUMERIC (38, 8) NULL,
    [BS_INTGL]   NUMERIC (38, 8) NULL,
    [BS_OANCU]   NUMERIC (38, 8) NULL,
    [BS_ATTL]    NUMERIC (38, 8) NULL,
    [BS_PBCUR]   NUMERIC (38, 8) NULL,
    [BS_DTCUR]   NUMERIC (38, 8) NULL,
    [BS_OLCUR]   NUMERIC (38, 8) NULL,
    [BS_LCURR]   NUMERIC (38, 8) NULL,
    [BS_LTDBT]   NUMERIC (38, 8) NULL,
    [BS_OLNCU]   NUMERIC (38, 8) NULL,
    [BS_DLNCU]   NUMERIC (38, 8) NULL,
    [BS_LTTL]    NUMERIC (38, 8) NULL,
    [BS_MNINT]   NUMERIC (38, 8) NULL,
    [BS_PRSTK]   NUMERIC (38, 8) NULL,
    [BS_CMSTK]   NUMERIC (38, 8) NULL,
    [BS_ADCPL]   NUMERIC (38, 8) NULL,
    [BS_REARN]   NUMERIC (38, 8) NULL,
    [BS_SEQTY]   NUMERIC (38, 8) NULL,
    [BS_PTCPL]   NUMERIC (38, 8) NULL,
    [BS_LSTEQ]   NUMERIC (38, 8) NULL,
    [IS_REV]     NUMERIC (38, 8) NULL,
    [IS_CREV]    NUMERIC (38, 8) NULL,
    [IS_GRPF]    NUMERIC (38, 8) NULL,
    [IS_OPRE]    NUMERIC (38, 8) NULL,
    [IS_SGAE]    NUMERIC (38, 8) NULL,
    [IS_RDVE]    NUMERIC (38, 8) NULL,
    [IS_ONRE]    NUMERIC (38, 8) NULL,
    [IS_OPIN]    NUMERIC (38, 8) NULL,
    [IS_NOIN]    NUMERIC (38, 8) NULL,
    [IS_INTE]    NUMERIC (38, 8) NULL,
    [IS_IBTX]    NUMERIC (38, 8) NULL,
    [IS_TAX]     NUMERIC (38, 8) NULL,
    [IS_DSOP]    NUMERIC (38, 8) NULL,
    [IS_NTIN]    NUMERIC (38, 8) NULL,
    [IS_PRSD]    NUMERIC (38, 8) NULL,
    [IS_NICS]    NUMERIC (38, 8) NULL,
    [CFS_PRFIT]  NUMERIC (38, 8) NULL,
    [CFS_DPRCN]  NUMERIC (38, 8) NULL,
    [CFS_RVCHG]  NUMERIC (38, 8) NULL,
    [CFS_INVCG]  NUMERIC (38, 8) NULL,
    [CFS_PBCHG]  NUMERIC (38, 8) NULL,
    [CFS_NTOPR]  NUMERIC (38, 8) NULL,
    [CFS_PRDAS]  NUMERIC (38, 8) NULL,
    [CFS_INVST]  NUMERIC (38, 8) NULL,
    [CFS_NTINV]  NUMERIC (38, 8) NULL,
    [CFS_DIVDS]  NUMERIC (38, 8) NULL,
    [CFS_REPEQ]  NUMERIC (38, 8) NULL,
    [CFS_REPDT]  NUMERIC (38, 8) NULL,
    [CFS_NTFIN]  NUMERIC (38, 8) NULL,
    [CFS_EXCHR]  NUMERIC (38, 8) NULL,
    [CFS_CSHCG]  NUMERIC (38, 8) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R334_SDE_ROWID_UK]
    ON [dbo].[RXT_FINANCIAL_2017Q4]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

