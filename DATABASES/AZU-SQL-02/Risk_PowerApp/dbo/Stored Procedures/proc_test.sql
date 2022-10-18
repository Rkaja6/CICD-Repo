
create procedure 
proc_test As
INSERT INTO [dbo].[Test]
           ([Comment]
           ,[Date])
     VALUES
           ('this is a test'
           ,GETDATE())