CREATE PROCEDURE dbo.SDE_server_config_insert
 @PropNameVal NVARCHAR(32),
    @CharPropVal NVARCHAR(512),
    @NumPropVal INTEGER AS SET NOCOUNT ON
    UPDATE dbo.SDE_server_config SET prop_name = UPPER(@PropNameVal), 
    char_prop_value = @CharPropVal, 
     num_prop_value = @NumPropVal WHERE prop_name =  UPPER(@PropNameVal) 

    IF @@ROWCOUNT = 0 
     INSERT INTO dbo.SDE_server_config (prop_name,char_prop_value,num_prop_value) 
     VALUES (UPPER(@PropNameVal),@CharPropVal,@NumPropVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_server_config_insert] TO PUBLIC
    AS [dbo];

