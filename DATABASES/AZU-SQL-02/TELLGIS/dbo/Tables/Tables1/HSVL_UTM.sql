CREATE TABLE [dbo].[HSVL_UTM] (
    [OID]               INT              NOT NULL,
    [FOOTPRINT]         [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    [RASTER]            INT              NULL,
    CONSTRAINT [R647_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g610_ck] CHECK ([FOOTPRINT].[STSrid]=(26715))
);


GO
CREATE NONCLUSTERED INDEX [sde_rix_1]
    ON [dbo].[HSVL_UTM]([RASTER] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S610_idx]
    ON [dbo].[HSVL_UTM] ([FOOTPRINT])
    WITH  (
            BOUNDING_BOX = (XMAX = 6121000, XMIN = -5121000, YMAX = 9998000, YMIN = -9998000),
            CELLS_PER_OBJECT = 16
          );


GO
CREATE TRIGGER RASTER_LAYER_1 
on HSVL_UTM for delete, update 
as  
begin  
declare @rowcount int 
select @rowcount = @@rowcount 
if @rowcount = 0 
return 
if update(RASTER) 
begin 
declare @rascol_id  int, @obtained_raster_id int 
select @rascol_id = RASTER from inserted 
if (@rascol_id IS NULL) 
begin 
update r set r.raster_flags = r.raster_id 
from TELLGIS.DBO.SDE_ras_1 r , deleted d 
  where r.raster_id = d.RASTER
 end 
else 
begin 
    DECLARE raster_id_cursor CURSOR FOR 
        SELECT raster_id FROM TELLGIS.DBO.SDE_ras_1 
        WHERE raster_id = @rascol_id 
    open  raster_id_cursor 
    FETCH NEXT FROM raster_id_cursor INTO @obtained_raster_id 
     if (@@FETCH_STATUS <> 0) 
        RAISERROR ('Integrity error ...',16,-1)
     else if (select count(*) from HSVL_UTM where RASTER = @rascol_id) > 1 
       RAISERROR ('Duplicate key in Raster column.',16,-1) 
     CLOSE raster_id_cursor 
     DEALLOCATE raster_id_cursor 
      return 
   end 
  return 
end 
if (select count(*) from inserted) > 0
return 
 update r set r.raster_flags = r.raster_id 
   from TELLGIS.DBO.SDE_ras_1 r, deleted d 
    where r.raster_id = d.RASTER
 end
GO
CREATE TRIGGER INSERT_RASTER_LAYER_1 
on HSVL_UTM for insert 
 as 
 DECLARE @rowc int 
 SELECT @rowc = @@rowcount 
if @@rowcount = 0 
return 
else 
begin 
DECLARE @rascol_id int, @obtained_raster_id int 
select @rascol_id = RASTER from inserted 
if (@rascol_id IS NOT NULL) 
begin 
   DECLARE raster_id_cursor CURSOR FOR 
   SELECT raster_id FROM TELLGIS.DBO.SDE_ras_1 
   WHERE raster_id = @rascol_id 
   open  raster_id_cursor 
   FETCH NEXT FROM raster_id_cursor INTO @obtained_raster_id 
 if (@@FETCH_STATUS <> 0) 
  RAISERROR ('Integrity error ...',16,-1) 
 else if (select count(*) from HSVL_UTM where RASTER = @rascol_id) > 1 
  RAISERROR ('Duplicate key in Raster column.',16,-1)  
   CLOSE raster_id_cursor 
  DEALLOCATE raster_id_cursor 
 return 
end 
end