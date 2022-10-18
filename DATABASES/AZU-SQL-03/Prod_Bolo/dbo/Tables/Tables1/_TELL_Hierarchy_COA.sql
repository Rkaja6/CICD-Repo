CREATE TABLE [dbo].[_TELL_Hierarchy_COA] (
    [Hierarchy_Name]    VARCHAR (50) NULL,
    [ACCT]              VARCHAR (8)  NULL,
    [TYPE]              VARCHAR (20) NULL,
    [Row_Order]         INT          NULL,
    [Row_Group]         INT          NULL,
    [Row_Heading]       VARCHAR (50) NULL,
    [Row_Group_Heading] VARCHAR (50) NULL,
    [Gross_Net_Flag]    VARCHAR (1)  NULL,
    [Budget_Category]   VARCHAR (50) NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [Hier_Acct_Type]
    ON [dbo].[_TELL_Hierarchy_COA]([Hierarchy_Name] ASC, [ACCT] ASC, [TYPE] ASC);

