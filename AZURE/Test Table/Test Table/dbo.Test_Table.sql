CREATE TABLE [dbo].[Test_Table_azure]
(

	[Testkey] INT NOT NULL ,
	[TestName] varchar (100) NULL,
	constraint [Test_table_azurePK] primary key clustered ([TestKey] ASC)
);
go
