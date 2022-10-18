CREATE VIEW dbo.ST_SPATIAL_REFERENCE_SYSTEMS (srs_id, x_offset,       x_scale, y_offset, y_scale, z_offset, z_scale, m_offset,        m_scale, organization,organization_coordsys_id, definition)       AS SELECT srid, falsex, xyunits, falsey, xyunits,       falsez, zunits, falsem, munits,        auth_name, auth_srid, srtext  FROM       dbo.SDE_spatial_references
GO
GRANT SELECT
    ON OBJECT::[dbo].[ST_SPATIAL_REFERENCE_SYSTEMS] TO PUBLIC
    AS [dbo];

