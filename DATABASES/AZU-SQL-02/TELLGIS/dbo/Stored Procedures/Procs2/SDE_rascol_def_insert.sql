CREATE PROCEDURE dbo.SDE_rascol_def_insert       @rastercolumn_idVal INTEGER,@descriptionVal NVARCHAR(65),       @database_nameVal NVARCHAR(32),@ownerVal NVARCHAR(32), @table_nameVal sysname,      @raster_columnVal NVARCHAR(32), @cdateVal INTEGER,       @config_keywordVal NVARCHAR(32), @minimum_idVal INTEGER, @base_idVal INTEGER,       @rastercolumn_maskVal INTEGER, @sridVal INTEGER AS SET NOCOUNT ON      INSERT INTO dbo.SDE_raster_columns       (rastercolumn_id,description,database_name,owner,table_name,raster_column,      cdate,config_keyword,minimum_id,base_rastercolumn_id, rastercolumn_mask,srid) VALUES       (@rastercolumn_idVal,@descriptionVal,@database_nameVal,@ownerVal,       @table_nameVal,@raster_columnVal,@cdateVal,@config_keywordVal,       @minimum_idVal,@base_idVal,@rastercolumn_maskVal,@sridVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_rascol_def_insert] TO PUBLIC
    AS [dbo];

