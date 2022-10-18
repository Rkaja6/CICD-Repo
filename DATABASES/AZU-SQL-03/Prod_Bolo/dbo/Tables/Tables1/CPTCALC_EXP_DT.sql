﻿CREATE TABLE [dbo].[CPTCALC_EXP_DT] (
    [subValueId]     VARCHAR (255)   NOT NULL,
    [CPTCALC_CPT_ID] VARCHAR (255)   NULL,
    [CALC_BASIS]     VARCHAR (9)     NULL,
    [EXP_DATES]      DATETIME        NULL,
    [RATES]          NUMERIC (19, 6) NULL,
    [time_stamp]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CPTCALC_E_CPTCALC_C_73148]
    ON [dbo].[CPTCALC_EXP_DT]([CPTCALC_CPT_ID] ASC);

