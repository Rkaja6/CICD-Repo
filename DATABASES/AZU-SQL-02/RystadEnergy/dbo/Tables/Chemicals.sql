CREATE TABLE [dbo].[Chemicals] (
    [Id]                                         BIGINT         NULL,
    [API_Number]                                 NVARCHAR (MAX) NULL,
    [Chemical_Ingredient_Name]                   NVARCHAR (MAX) NULL,
    [CAS_Number]                                 NVARCHAR (MAX) NULL,
    [Chemical_Trade_Name]                        NVARCHAR (MAX) NULL,
    [Chemical_Supplier]                          NVARCHAR (MAX) NULL,
    [Chemical_Purpose_Group]                     NVARCHAR (MAX) NULL,
    [Frac_Job_Percent_HF_Job_Scaled]             REAL           NULL,
    [Chemical_Ingredient_Mass__Thousand_Pounds_] REAL           NULL,
    [TellurianUpdatedDate]                       DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                       DATETIME       DEFAULT (getdate()) NULL
);

