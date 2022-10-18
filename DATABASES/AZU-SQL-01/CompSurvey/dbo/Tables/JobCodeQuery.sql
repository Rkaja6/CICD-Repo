CREATE TABLE [dbo].[JobCodeQuery] (
    [UID]           VARCHAR (8000) NULL,
    [Job Code]      VARCHAR (4000) NULL,
    [PublisherCode] VARCHAR (10)   NULL,
    [TypeCode]      VARCHAR (10)   NULL,
    [WeightCode]    VARCHAR (10)   NULL,
    [RegionCode]    VARCHAR (200)  NULL,
    [DeptCode]      VARCHAR (20)   NULL,
    [IndustryCode]  VARCHAR (20)   NULL,
    [CorpCode]      VARCHAR (20)   NULL,
    [DetailCode]    VARCHAR (200)  NULL,
    [ScopeCode]     VARCHAR (200)  NULL,
    [YearCode]      VARCHAR (4)    NULL,
    [SubRegionCode] VARCHAR (200)  NULL,
    [StateCode]     VARCHAR (10)   NULL,
    [CityCode]      VARCHAR (200)  NULL
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[JobCodeQuery] TO [RunCompModel]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[JobCodeQuery] TO [RunCompModel]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[JobCodeQuery] TO [RunCompModel]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[JobCodeQuery] TO [RunCompModel]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\BManrriquez]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\BManrriquez]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\mdean]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\mdean]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\mgriffith]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[JobCodeQuery] TO [TLN\mgriffith]
    AS [dbo];

