CREATE TABLE [dbo].[RXT_FINANCIAL_SUMMARY] (
    [OBJECTID]   INT             NOT NULL,
    [COMPANY]    NVARCHAR (250)  NULL,
    [COMPANY_ID] NVARCHAR (255)  NULL,
    [B18Y_CASH]  NUMERIC (38, 8) NULL,
    [B17Y_CASH]  NUMERIC (38, 8) NULL,
    [B16Y_CASH]  NUMERIC (38, 8) NULL,
    [B15Y_CASH]  NUMERIC (38, 8) NULL,
    [B14Y_CASH]  NUMERIC (38, 8) NULL,
    [B13Y_CASH]  NUMERIC (38, 8) NULL,
    [B18Y_ACURR] NUMERIC (38, 8) NULL,
    [B17Y_ACURR] NUMERIC (38, 8) NULL,
    [B16Y_ACURR] NUMERIC (38, 8) NULL,
    [B15Y_ACURR] NUMERIC (38, 8) NULL,
    [B14Y_ACURR] NUMERIC (38, 8) NULL,
    [B13Y_ACURR] NUMERIC (38, 8) NULL,
    [B18Y_ATTL]  NUMERIC (38, 8) NULL,
    [B17Y_ATTL]  NUMERIC (38, 8) NULL,
    [B16Y_ATTL]  NUMERIC (38, 8) NULL,
    [B15Y_ATTL]  NUMERIC (38, 8) NULL,
    [B14Y_ATTL]  NUMERIC (38, 8) NULL,
    [B13Y_ATTL]  NUMERIC (38, 8) NULL,
    [B18Y_LCURR] NUMERIC (38, 8) NULL,
    [B17Y_LCURR] NUMERIC (38, 8) NULL,
    [B16Y_LCURR] NUMERIC (38, 8) NULL,
    [B15Y_LCURR] NUMERIC (38, 8) NULL,
    [B14Y_LCURR] NUMERIC (38, 8) NULL,
    [B13Y_LCURR] NUMERIC (38, 8) NULL,
    [B18Y_LTTL]  NUMERIC (38, 8) NULL,
    [B17Y_LTTL]  NUMERIC (38, 8) NULL,
    [B16Y_LTTL]  NUMERIC (38, 8) NULL,
    [B15Y_LTTL]  NUMERIC (38, 8) NULL,
    [B14Y_LTTL]  NUMERIC (38, 8) NULL,
    [B13Y_LTTL]  NUMERIC (38, 8) NULL,
    [B18Y_REARN] NUMERIC (38, 8) NULL,
    [B17Y_REARN] NUMERIC (38, 8) NULL,
    [B16Y_REARN] NUMERIC (38, 8) NULL,
    [B15Y_REARN] NUMERIC (38, 8) NULL,
    [B14Y_REARN] NUMERIC (38, 8) NULL,
    [B13Y_REARN] NUMERIC (38, 8) NULL,
    [B18Y_SEQTY] NUMERIC (38, 8) NULL,
    [B17Y_SEQTY] NUMERIC (38, 8) NULL,
    [B16Y_SEQTY] NUMERIC (38, 8) NULL,
    [B15Y_SEQTY] NUMERIC (38, 8) NULL,
    [B14Y_SEQTY] NUMERIC (38, 8) NULL,
    [B13Y_SEQTY] NUMERIC (38, 8) NULL,
    [IS18Y_REV]  NUMERIC (38, 8) NULL,
    [IS17Y_REV]  NUMERIC (38, 8) NULL,
    [IS16Y_REV]  NUMERIC (38, 8) NULL,
    [IS15Y_REV]  NUMERIC (38, 8) NULL,
    [IS14Y_REV]  NUMERIC (38, 8) NULL,
    [IS13Y_REV]  NUMERIC (38, 8) NULL,
    [IS18Y_OPIN] NUMERIC (38, 8) NULL,
    [IS17Y_OPIN] NUMERIC (38, 8) NULL,
    [IS16Y_OPIN] NUMERIC (38, 8) NULL,
    [IS15Y_OPIN] NUMERIC (38, 8) NULL,
    [IS14Y_OPIN] NUMERIC (38, 8) NULL,
    [IS13Y_OPIN] NUMERIC (38, 8) NULL,
    [IS18Y_NTIN] NUMERIC (38, 8) NULL,
    [IS17Y_NTIN] NUMERIC (38, 8) NULL,
    [IS16Y_NTIN] NUMERIC (38, 8) NULL,
    [IS15Y_NTIN] NUMERIC (38, 8) NULL,
    [IS14Y_NTIN] NUMERIC (38, 8) NULL,
    [IS13Y_NTIN] NUMERIC (38, 8) NULL,
    [C18Y_NTOPR] NUMERIC (38, 8) NULL,
    [C17Y_NTOPR] NUMERIC (38, 8) NULL,
    [C16Y_NTOPR] NUMERIC (38, 8) NULL,
    [C15Y_NTOPR] NUMERIC (38, 8) NULL,
    [C14Y_NTOPR] NUMERIC (38, 8) NULL,
    [C13Y_NTOPR] NUMERIC (38, 8) NULL,
    [C18Y_NTINV] NUMERIC (38, 8) NULL,
    [C17Y_NTINV] NUMERIC (38, 8) NULL,
    [C16Y_NTINV] NUMERIC (38, 8) NULL,
    [C15Y_NTINV] NUMERIC (38, 8) NULL,
    [C14Y_NTINV] NUMERIC (38, 8) NULL,
    [C13Y_NTINV] NUMERIC (38, 8) NULL,
    [C18Y_NTFIN] NUMERIC (38, 8) NULL,
    [C17Y_NTFIN] NUMERIC (38, 8) NULL,
    [C16Y_NTFIN] NUMERIC (38, 8) NULL,
    [C15Y_NTFIN] NUMERIC (38, 8) NULL,
    [C14Y_NTFIN] NUMERIC (38, 8) NULL,
    [C13Y_NTFIN] NUMERIC (38, 8) NULL,
    [C18Y_CSHCG] NUMERIC (38, 8) NULL,
    [C17Y_CSHCG] NUMERIC (38, 8) NULL,
    [C16Y_CSHCG] NUMERIC (38, 8) NULL,
    [C15Y_CSHCG] NUMERIC (38, 8) NULL,
    [C14Y_CSHCG] NUMERIC (38, 8) NULL,
    [C13Y_CSHCG] NUMERIC (38, 8) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R99_SDE_ROWID_UK]
    ON [dbo].[RXT_FINANCIAL_SUMMARY]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

