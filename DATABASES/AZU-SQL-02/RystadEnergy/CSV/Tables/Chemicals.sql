CREATE TABLE [CSV].[Chemicals] (
    [Id]                                         INT           NULL,
    [API Number]                                 VARCHAR (40)  NULL,
    [Chemical Ingredient Name]                   VARCHAR (296) NULL,
    [CAS Number]                                 VARCHAR (46)  NULL,
    [Chemical Trade Name]                        VARCHAR (490) NULL,
    [Chemical Supplier]                          VARCHAR (84)  NULL,
    [Chemical Purpose Group]                     VARCHAR (38)  NULL,
    [Frac Job Percent HF Job Scaled]             VARCHAR (50)  NULL,
    [Chemical Ingredient Mass (Thousand Pounds)] VARCHAR (50)  NULL,
    [TellurianUpdatedDate]                       DATETIME      DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                       DATETIME      DEFAULT (getdate()) NULL
);

