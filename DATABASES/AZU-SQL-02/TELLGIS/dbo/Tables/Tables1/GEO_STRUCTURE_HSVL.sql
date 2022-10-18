CREATE TABLE [dbo].[GEO_STRUCTURE_HSVL] (
    [OID]               INT              NOT NULL,
    [FOOTPRINT]         [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    [RASTER]            INT              NULL,
    CONSTRAINT [R649_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g612_ck] CHECK ([FOOTPRINT].[STSrid]=(0))
);


GO
CREATE NONCLUSTERED INDEX [sde_rix_2]
    ON [dbo].[GEO_STRUCTURE_HSVL]([RASTER] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S612_idx]
    ON [dbo].[GEO_STRUCTURE_HSVL] ([FOOTPRINT])
    WITH  (
            BOUNDING_BOX = (XMAX = 20082000, XMIN = -16801100, YMAX = 32801800, YMIN = -32801800),
            CELLS_PER_OBJECT = 16
          );


GO
CREATE TRIGGER RASTER_LAYER_2 
on GEO_STRUCTURE_HSVL for delete, update 
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
from TELLGIS.DBO.SDE_ras_2 r , deleted d 
  where r.raster_id = d.RASTER
 end 
else 
begin 
    DECLARE raster_id_cursor CURSOR FOR 
        SELECT raster_id FROM TELLGIS.DBO.SDE_ras_2 
        WHERE raster_id = @rascol_id 
    open  raster_id_cursor 
    FETCH NEXT FROM raster_id_cursor INTO @obtained_raster_id 
     if (@@FETCH_STATUS <> 0) 
        RAISERROR ('Integrity error ...',16,-1)
     else if (select count(*) from GEO_STRUCTURE_HSVL where RASTER = @rascol_id) > 1 
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
   from TELLGIS.DBO.SDE_ras_2 r, deleted d 
    where r.raster_id = d.RASTER
 end
GO
CREATE TRIGGER INSERT_RASTER_LAYER_2 
on GEO_STRUCTURE_HSVL for insert 
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
   SELECT raster_id FROM TELLGIS.DBO.SDE_ras_2 
   WHERE raster_id = @rascol_id 
   open  raster_id_cursor 
   FETCH NEXT FROM raster_id_cursor INTO @obtained_raster_id 
 if (@@FETCH_STATUS <> 0) 
  RAISERROR ('Integrity error ...',16,-1) 
 else if (select count(*) from GEO_STRUCTURE_HSVL where RASTER = @rascol_id) > 1 
  RAISERROR ('Duplicate key in Raster column.',16,-1)  
   CLOSE raster_id_cursor 
  DEALLOCATE raster_id_cursor 
 return 
end 
end