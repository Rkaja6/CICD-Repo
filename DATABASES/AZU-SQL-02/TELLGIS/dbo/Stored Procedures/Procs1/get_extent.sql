﻿CREATE PROCEDURE dbo.get_extent
@owner NVARCHAR(128), @table NVARCHAR(128), @column NVARCHAR(128),
@minx DOUBLE PRECISION OUTPUT, @miny DOUBLE PRECISION OUTPUT,
@maxx DOUBLE PRECISION OUTPUT, @maxy DOUBLE PRECISION OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @layer_table NVARCHAR (128)
DECLARE @get_meta_extent INT
DECLARE @errstr varchar (256)

SET @get_meta_extent = 0 --Assume no metadata
SET @layer_table = @table

SELECT @layer_table = table_name FROM dbo.SDE_table_registry
  WHERE owner = @owner AND table_name = @table
IF @@ROWCOUNT = 0
BEGIN
  SELECT @layer_table = table_name FROM dbo.SDE_table_registry
    WHERE owner = @owner AND imv_view_name = @table
  IF @@ROWCOUNT > 0
    SET @get_meta_extent = 1
END
ELSE
  SET @get_meta_extent = 1

IF @get_meta_extent = 1
BEGIN
  -- table is registered, see if it's in the layers table
  SELECT @minx = minx, @miny = miny, @maxx = maxx, @maxy = maxy 
  FROM dbo.SDE_layers l
  WHERE l.owner = @owner and l.table_name = @layer_table AND l.spatial_column = @column
  IF @@ROWCOUNT > 0
    RETURN -- we're done!
END

-- Need to calculate the extent. Check if it's a geometry or geography

DECLARE @spatial_type NVARCHAR(128)
SELECT @spatial_type = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
  WHERE  table_schema = @owner AND table_name = @layer_table AND column_name = @column
IF @@ROWCOUNT = 0
BEGIN
  SET @errstr = 'Class ' + @owner + '.' + @table + '.' + @column + ' does not exist.'
  RAISERROR (@errstr,16,-1)
  RETURN
END
-- Calculate the extent
DECLARE @sql NVARCHAR (1024)
IF @spatial_type = 'geometry' 
BEGIN
  SET @sql = 
    'SELECT @lminx = MIN(((' + @column + '.STEnvelope()).STPointN(1)).STX),' + 
    ' @lminy = MIN(((' + @column + '.STEnvelope()).STPointN(1)).STY),' + 
    ' @lmaxx = MAX(((' + @column + '.STEnvelope()).STPointN(3)).STX),' + 
    ' @lmaxy = MAX(((' + @column + '.STEnvelope()).STPointN(3)).STY) ' + 
    'FROM ' + @owner + '.' + @layer_table +
    ' WHERE ' + @column + ' IS NOT NULL'
  EXECUTE sp_executesql @sql, N'@lminx double precision output,@lminy double precision output,@lmaxx double precision output,@lmaxy double precision output',
  @lminx = @minx output,@lminy = @miny output,@lmaxx = @maxx output, @lmaxy = @maxy output
END
ELSE
BEGIN
  IF @spatial_type = 'geography'
  BEGIN
    SET @sql = 
      'SELECT @lminx = MIN(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(1)).STX),' + 
      '  @lminy = MIN(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(1)).STY),' + 
      '  @lmaxx = MAX(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(3)).STX),' + 
      '  @lmaxy = MAX(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(3)).STY) ' + 
      'FROM ' + @owner + '.' + @layer_table +
      ' WHERE ' + @column + ' IS NOT NULL'
    EXECUTE sp_executesql @sql, N'@lminx double precision output,@lminy double precision output,@lmaxx double precision output,@lmaxy double precision output',
    @lminx = @minx output,@lminy = @miny output,@lmaxx = @maxx output, @lmaxy = @maxy output
  END
  ELSE
  BEGIN
    SET @errstr = 'Column ' + @owner + '.' + @table + '.' + @column + ' is not a geometry or geography column.'
    RAISERROR (@errstr,16,-1)
    RETURN
  END
END
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[get_extent] TO PUBLIC
    AS [dbo];

