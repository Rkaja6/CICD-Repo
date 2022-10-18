CREATE PROCEDURE dbo.SDE_layer_def_insert
@layerIdVal INTEGER, @descVal NVARCHAR(65),@dbNameVal NVARCHAR(32),
@tabNameVal sysname, @ownerVal NVARCHAR(32), @spColVal NVARCHAR(32),
@eflagsVal INTEGER, @layerMaskVal INTEGER, @gsize1Val FLOAT, @gsize2Val FLOAT,
@gsize3Val FLOAT,@minxVal FLOAT,@minyVal FLOAT, @maxxVal FLOAT, @maxyVal FLOAT,
@minzVal FLOAT, @maxzVal FLOAT,@minmVal FLOAT, @maxmVal FLOAT, @cdateVal INTEGER,
@layerConfigVal NVARCHAR(32),@optArraySizeVal INTEGER, @statsDateVal INTEGER,
@minIdVal INTEGER, @sridVal INTEGER, @baseId INTEGER, @secondarySridVal INTEGER AS
SET NOCOUNT ON
BEGIN
BEGIN TRAN layer_insert
INSERT INTO dbo.SDE_layers (layer_id,description,database_name,table_name,owner,
spatial_column,eflags,layer_mask,gsize1,gsize2,gsize3,minx,miny,maxx,maxy,
minz,maxz,minm, maxm,cdate,layer_config,optimal_array_size,stats_date,
minimum_id,srid,base_layer_id,secondary_srid) VALUES (@layerIdVal, @descVal,
@dbNameVal, @tabNameVal,
@ownerVal, @spColVal,@eflagsVal, @layerMaskVal, @gsize1Val, @gsize2Val, @gsize3Val,
@minxVal, @minyVal, @maxxVal, @maxyVal,@minzVal, @maxzVal, @minmVal, @maxmVal,
@cdateVal,@layerConfigVal, @optArraySizeVal, @statsDateVal, @minIdVal, @sridVal,
@baseId, @secondarySridVal)
COMMIT TRAN layer_insert
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_def_insert] TO PUBLIC
    AS [dbo];

