﻿CREATE TABLE [dbo].[RR_WELL_LUG_ORR_AUDIT_COMPANY_VOLUME] (
    [RR_WELL_LUG_ORR_AUDIT_COMPANY_VOLUME_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                                   VARCHAR (255)   NULL,
    [ORR_AUDIT_VOLUME]                        NUMERIC (19, 2) NULL,
    [time_stamp]                              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RR_WELL_LUG_ORR_AUDIT_COMPANY_VOLUME_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_WELL_L_u2_id_43709]
    ON [dbo].[RR_WELL_LUG_ORR_AUDIT_COMPANY_VOLUME]([u2_id] ASC);

