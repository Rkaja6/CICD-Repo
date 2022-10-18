CREATE TABLE [dbo].[Combined_Indexed] (
    [Source]                              VARCHAR (200)   NULL,
    [TabName]                             VARCHAR (200)   NULL,
    [Job Title]                           VARCHAR (200)   NULL,
    [Job Code]                            VARCHAR (50)    NULL,
    [Inc]                                 NUMERIC (18, 2) NULL,
    [Cos]                                 NUMERIC (18, 2) NULL,
    [Effective Date]                      VARCHAR (10)    NULL,
    [Base 25th Percentile]                NUMERIC (18, 2) NULL,
    [Base 50th Percentile]                NUMERIC (18, 2) NULL,
    [Base 75th Percentile]                NUMERIC (18, 2) NULL,
    [Base 90th Percentile]                NUMERIC (18, 2) NULL,
    [Actual TC 25th Percentile]           NUMERIC (18, 2) NULL,
    [Actual TC 50th Percentile]           NUMERIC (18, 2) NULL,
    [Actual TC 75th Percentile]           NUMERIC (18, 2) NULL,
    [Actual TC 90th Percentile]           NUMERIC (18, 2) NULL,
    [Target TC 25th Percentile]           NUMERIC (18, 2) NULL,
    [Target TC 50th Percentile]           NUMERIC (18, 2) NULL,
    [Target TC 75th Percentile]           NUMERIC (18, 2) NULL,
    [Target TC 90th Percentile]           NUMERIC (18, 2) NULL,
    [LTI 25th Percentile]                 NUMERIC (18, 2) NULL,
    [LTI 50th Percentile]                 NUMERIC (18, 2) NULL,
    [LTI 75th Percentile]                 NUMERIC (18, 2) NULL,
    [LTI 90th Percentile]                 NUMERIC (18, 2) NULL,
    [Total Direct Actual 25th Percentile] NUMERIC (18, 2) NULL,
    [Total Direct Actual 50th Percentile] NUMERIC (18, 2) NULL,
    [Total Direct Actual 75th Percentile] NUMERIC (18, 2) NULL,
    [Total Direct Actual 90th Percentile] NUMERIC (18, 2) NULL,
    [Target TDC 25th Percentile]          NUMERIC (18, 2) NULL,
    [Target TDC 50th Percentile]          NUMERIC (18, 2) NULL,
    [Target TDC 75th Percentile]          NUMERIC (18, 2) NULL,
    [Target TDC 90th Percentile]          NUMERIC (18, 2) NULL,
    [Industry]                            VARCHAR (200)   NULL,
    [Corporate-Noncorporate]              VARCHAR (200)   NULL,
    [Rev Responsibility-Location-Other]   VARCHAR (500)   NULL,
    [Family]                              VARCHAR (200)   NULL,
    [Sub-Family]                          VARCHAR (200)   NULL,
    [Specialization]                      VARCHAR (200)   NULL,
    [Job Description]                     VARCHAR (8000)  NULL,
    [Mercer Job Type]                     VARCHAR (200)   NULL,
    [AonHewitt Scope From]                VARCHAR (200)   NULL,
    [AonHewitt Scope To]                  VARCHAR (200)   NULL,
    [AonHewitt Scope Desc]                VARCHAR (200)   NULL,
    [AI Percentage 25th Percentile]       NUMERIC (18, 2) NULL,
    [AI Percentage 50th Percentile]       NUMERIC (18, 2) NULL,
    [AI Percentage 75th Percentile]       NUMERIC (18, 2) NULL,
    [AI Percentage 90th Percentile]       NUMERIC (18, 2) NULL,
    [LTI Percent of Base 25th Percentile] NUMERIC (18, 2) NULL,
    [LTI Percent of Base 50th Percentile] NUMERIC (18, 2) NULL,
    [LTI Percent of Base 75th Percentile] NUMERIC (18, 2) NULL,
    [LTI Percent of Base 90th Percentile] NUMERIC (18, 2) NULL,
    [Calc AI % 25th Percentile]           NUMERIC (18, 2) NULL,
    [Calc AI % 50th Percentile]           NUMERIC (18, 2) NULL,
    [Calc AI % 75th Percentile]           NUMERIC (18, 2) NULL,
    [Calc AI % 90th Percentile]           NUMERIC (18, 2) NULL,
    [Calc LTI % 25th Percentile]          NUMERIC (18, 2) NULL,
    [Calc LTI % 50th Percentile]          NUMERIC (18, 2) NULL,
    [Calc LTI % 75th Percentile]          NUMERIC (18, 2) NULL,
    [Calc LTI % 90th Percentile]          NUMERIC (18, 2) NULL,
    [CreatedDate]                         VARCHAR (50)    NULL,
    [UID]                                 VARCHAR (500)   NULL,
    [PublisherCode]                       VARCHAR (10)    NULL,
    [Index]                               INT             IDENTITY (1, 1) NOT NULL,
    [TypeCode]                            VARCHAR (10)    NULL,
    [WeightCode]                          VARCHAR (10)    NULL,
    [CorpCode]                            VARCHAR (20)    NULL,
    [IndustryCode]                        VARCHAR (40)    NULL,
    [RegionCode]                          VARCHAR (200)   NULL,
    [DeptCode]                            VARCHAR (20)    NULL,
    [DetailCode]                          VARCHAR (200)   NULL,
    [ScopeCode]                           VARCHAR (200)   NULL,
    [SubRegionCode]                       VARCHAR (200)   NULL,
    [StateCode]                           VARCHAR (100)   NULL,
    [CityCode]                            VARCHAR (200)   NULL,
    [YearCode]                            VARCHAR (4)     NULL,
    [OrgCode]                             VARCHAR (20)    NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_Combined_Indexed_Unique_Index]
    ON [dbo].[Combined_Indexed]([Index] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_Combined_Indexed_UID]
    ON [dbo].[Combined_Indexed]([UID] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_Combined_Indexed_JobCode]
    ON [dbo].[Combined_Indexed]([Job Code] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Combined_Indexed] TO [RunCompModel]
    AS [dbo];

