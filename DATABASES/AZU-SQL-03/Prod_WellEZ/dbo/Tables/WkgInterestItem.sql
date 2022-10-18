CREATE TABLE [dbo].[WkgInterestItem] (
    [wkginterestitem_id] INT             IDENTITY (1, 1) NOT NULL,
    [well_id]            BIGINT          NOT NULL,
    [line_number]        BIGINT          NOT NULL,
    [WI_Percent]         DECIMAL (19, 9) NOT NULL,
    [MobilePhone]        NVARCHAR (MAX)  NULL,
    [HomePhone]          NVARCHAR (MAX)  NULL,
    [Fax]                NVARCHAR (MAX)  NULL,
    [ContactPhone]       NVARCHAR (MAX)  NULL,
    [ContactLastName]    NVARCHAR (MAX)  NULL,
    [ContactFirstName]   NVARCHAR (MAX)  NULL,
    [ContactEmail]       NVARCHAR (MAX)  NULL,
    [CompanyZip]         NVARCHAR (MAX)  NULL,
    [CompanyState]       NVARCHAR (MAX)  NULL,
    [CompanyName]        NVARCHAR (MAX)  NOT NULL,
    [CompanyCity]        NVARCHAR (MAX)  NULL,
    [CompanyAddress2]    NVARCHAR (MAX)  NULL,
    [CompanyAddress1]    NVARCHAR (MAX)  NULL,
    [Comments]           NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_WkgInterestItem] PRIMARY KEY CLUSTERED ([wkginterestitem_id] ASC)
);

