CREATE TABLE [dbo].[WkgInterest] (
    [wkginterest_id] INT            IDENTITY (1, 1) NOT NULL,
    [well_id]        BIGINT         NOT NULL,
    [Phone]          NVARCHAR (MAX) NULL,
    [MsgToPartners]  NVARCHAR (MAX) NULL,
    [MessagedBy]     NVARCHAR (MAX) NULL,
    [Email]          NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_WkgInterest] PRIMARY KEY CLUSTERED ([wkginterest_id] ASC)
);

