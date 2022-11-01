CREATE TABLE [dbo].[StatusLookup]
(
	[StatusKey] INT            NOT NULL,
	[StatusName] varchar (100) NULL,
	constraint [StatusLookUpPK]Primary Key Clustered ([StatusKey] ASC)
)
