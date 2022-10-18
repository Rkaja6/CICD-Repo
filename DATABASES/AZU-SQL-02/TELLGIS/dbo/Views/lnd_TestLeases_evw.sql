﻿CREATE VIEW DBO.lnd_TestLeases_evw AS SELECT b.OBJECTID + 0 OBJECTID,b.Agreement,b.ELS_Agreem,b.Samson_Agr,b.Parish,b.Township,b.Section,b.Agmt_Type,b.Original_L,b.Original_1,b.Agmt_Date,b.Eff_Date,b.Term__Mont,b.Exp_Date,b.Ext_Exp_Da,b.Property_S,b.Roy_Rate,b.Book,b.Page,b.Doc_Inst_N,b.Agmt_Gross,b.Agmt_Net,b.Claimed_Ac,b.Confirmed,b.Tract_Gros,b.Interest,b.Tract_Net,b.Notice,b.Consent,b.Consent__,b.Pugh_Geogr,b.Pugh_Strat,b.Legal_Desc,b.Label,b.AgreementFormat,b.HBP_UND,b.Active,b.Activity_Update,b.Override,b.Shape,b.GDB_GEOMATTR_DATA,b.GlobalID,b.OBJECTID - b.OBJECTID SDE_STATE_ID FROM DBO.LND_TESTLEASES b LEFT HASH JOIN  (SELECT SDE_DELETES_ROW_ID,SDE_STATE_ID FROM DBO.d110 WHERE SDE_STATE_ID = 0 AND DELETED_AT IN (SELECT l.lineage_id FROM dbo.SDE_states s INNER LOOP JOIN dbo.SDE_state_lineages l ON l.lineage_name = s.lineage_name WHERE s.state_id = dbo.SDE_get_view_state() AND l.lineage_id <= s.state_id ) ) d ON b.OBJECTID = d.SDE_DELETES_ROW_ID WHERE d.SDE_STATE_ID IS NULL UNION ALL SELECT a.OBJECTID + 0 OBJECTID,a.Agreement,a.ELS_Agreem,a.Samson_Agr,a.Parish,a.Township,a.Section,a.Agmt_Type,a.Original_L,a.Original_1,a.Agmt_Date,a.Eff_Date,a.Term__Mont,a.Exp_Date,a.Ext_Exp_Da,a.Property_S,a.Roy_Rate,a.Book,a.Page,a.Doc_Inst_N,a.Agmt_Gross,a.Agmt_Net,a.Claimed_Ac,a.Confirmed,a.Tract_Gros,a.Interest,a.Tract_Net,a.Notice,a.Consent,a.Consent__,a.Pugh_Geogr,a.Pugh_Strat,a.Legal_Desc,a.Label,a.AgreementFormat,a.HBP_UND,a.Active,a.Activity_Update,a.Override,a.Shape,a.GDB_GEOMATTR_DATA,a.GlobalID,a.SDE_STATE_ID FROM DBO.a110 a LEFT HASH JOIN (SELECT SDE_DELETES_ROW_ID,SDE_STATE_ID FROM DBO.d110 WHERE DELETED_AT IN (SELECT l.lineage_id FROM dbo.SDE_states s INNER LOOP JOIN dbo.SDE_state_lineages l ON l.lineage_name = s.lineage_name WHERE s.state_id = dbo.SDE_get_view_state() AND l.lineage_id <= s.state_id ) ) d ON (a.OBJECTID = d.SDE_DELETES_ROW_ID) AND  (a.SDE_STATE_ID = d.SDE_STATE_ID) WHERE a.SDE_STATE_ID IN (SELECT l.lineage_id FROM dbo.SDE_states s INNER LOOP JOIN dbo.SDE_state_lineages l ON l.lineage_name = s.lineage_name WHERE s.state_id = dbo.SDE_get_view_state() AND l.lineage_id <= s.state_id ) AND d.SDE_STATE_ID IS NULL
GO
CREATE TRIGGER DBO.v110_update  ON DBO.lnd_TestLeases_evw INSTEAD OF UPDATE AS 
BEGIN
IF @@rowcount = 0 RETURN
DECLARE @current_state BIGINT
DECLARE @ret INTEGER
-- Check if we are already in an edit session.
DECLARE @g_state_id BIGINT
DECLARE @g_protected CHAR(1)
DECLARE @g_is_default CHAR(1)
DECLARE @g_version_id INTEGER
DECLARE @state_is_set INTEGER
EXECUTE dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT,@state_is_set OUTPUT
IF (@g_version_id = -1) AND (@g_is_default = '0')
BEGIN
  RAISERROR ('User must call edit_version before editing the view.',16,-1)
  RETURN
END

IF (@g_version_id = -1) AND (@g_is_default = '1') AND (@state_is_set = 1)
BEGIN
  RAISERROR ('Cannot call set_current_version before editing default version. Call set_default before editing.',16,-1)
  RETURN
END

IF @g_version_id != -1  -- standard editing
BEGIN
  EXECUTE @ret = dbo.SDE_current_version_writable @current_state OUTPUT
  IF @ret <> 0 RETURN
END
ELSE -- default version editing
  SET @current_state = @g_state_id
DECLARE @new_state BIGINT
DECLARE @current_lineage BIGINT
DECLARE @edit_cnt INTEGER
DECLARE @error_string NVARCHAR(256)

SELECT @current_lineage = lineage_name  FROM dbo.SDE_states
  WHERE state_id = @current_state
IF UPDATE(OBJECTID)
BEGIN
  DECLARE @row_count INTEGER
  SELECT @row_count = COUNT(*) FROM deleted
  IF @row_count > 1 OR (SELECT COUNT(*) FROM inserted i INNER JOIN deleted d
  ON i.OBJECTID = d.OBJECTID) != @row_count
  BEGIN
    RAISERROR ('Attempted update of SDE row id column.',16,-1)
    RETURN
  END
END
DECLARE @new_row_id INTEGER
DECLARE @old_row_id INTEGER
DECLARE @old_state_id BIGINT
DECLARE @new_spatial_column geometry
DECLARE @old_spatial_column geometry
DECLARE updt_cursor CURSOR FOR SELECT i.OBJECTID,d.OBJECTID,d.SDE_STATE_ID,i.SHAPE,d.SHAPE
  FROM inserted i INNER JOIN deleted d
  ON i.OBJECTID = d.OBJECTID
OPEN updt_cursor
FETCH NEXT FROM updt_cursor INTO @new_row_id, @old_row_id, @old_state_id, @new_spatial_column, @old_spatial_column
WHILE @@FETCH_STATUS = 0
BEGIN
  IF @g_is_default = '0'
  BEGIN
    IF (@old_state_id != @current_state)
    BEGIN
     IF @old_spatial_column IS NOT NULL AND NOT UPDATE(SHAPE)
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,i.GDB_GEOMATTR_DATA,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

     ELSE
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,NULL,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

    INSERT INTO DBO.d110 VALUES (@old_state_id, @old_row_id, @current_state)
    END
    ELSE
    BEGIN
     IF @old_spatial_column IS NOT NULL AND UPDATE(SHAPE)
UPDATE DBO.A110 SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = NULL,GlobalID = i.GlobalID FROM DBO.A110  a INNER JOIN inserted i  ON (a.OBJECTID = i.OBJECTID)  AND (a.SDE_STATE_ID = i.SDE_STATE_ID) 
     WHERE a.OBJECTID = @old_row_id AND a.SDE_STATE_ID = @current_state
     ELSE
     UPDATE DBO.A110 SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = i.GDB_GEOMATTR_DATA,GlobalID = i.GlobalID FROM DBO.A110  a INNER JOIN inserted i  ON (a.OBJECTID = i.OBJECTID)  AND (a.SDE_STATE_ID = i.SDE_STATE_ID) 
     WHERE a.OBJECTID = @old_row_id AND a.SDE_STATE_ID = @current_state

    END
  END
  ELSE
  BEGIN
    SELECT @edit_cnt = COUNT(*)
    FROM dbo.SDE_state_lineages
    WHERE lineage_id = @current_state AND lineage_id IN
      (SELECT DISTINCT lineage_id
       FROM dbo.SDE_state_lineages
       WHERE lineage_name IN
        (SELECT lineage_name
         FROM dbo.SDE_state_lineages
         WHERE lineage_id IN
          (SELECT DELETED_AT
           FROM DBO.d110 WITH (TABLOCKX,HOLDLOCK)
           WHERE SDE_DELETES_ROW_ID = @old_row_id
             AND DELETED_AT > @current_state)))

    IF @current_state = 0
    BEGIN
      IF @edit_cnt > 0
      BEGIN
        EXECUTE @ret = dbo.SDE_new_branch_state @current_state, @current_lineage, @new_state OUTPUT
        IF @ret <> 0
        BEGIN
          CLOSE updt_cursor
          DEALLOCATE updt_cursor
          SET @error_string = 'The DEFAULT version continues to be modified, commit, rollback or re-execute the last statement to proceed.'
          RAISERROR (@error_string,16,-1)
          RETURN
        END
        SET @current_state = @new_state
        IF @old_spatial_column IS NOT NULL AND NOT UPDATE(SHAPE)
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,i.GDB_GEOMATTR_DATA,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

     ELSE
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,NULL,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

        INSERT INTO DBO.d110 (DELETED_AT,SDE_DELETES_ROW_ID,SDE_STATE_ID) VALUES (@current_state, @old_row_id, @old_state_id)
      END
      ELSE
      BEGIN
        IF @old_spatial_column IS NOT NULL AND UPDATE(SHAPE)
UPDATE DBO.LND_TESTLEASES SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = NULL,GlobalID = i.GlobalID FROM DBO.LND_TESTLEASES  b INNER JOIN inserted i  ON (b.OBJECTID = i.OBJECTID) 
     WHERE b.OBJECTID = @old_row_id 
     ELSE
     UPDATE DBO.LND_TESTLEASES SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = i.GDB_GEOMATTR_DATA,GlobalID = i.GlobalID FROM DBO.LND_TESTLEASES  b INNER JOIN inserted i  ON (b.OBJECTID = i.OBJECTID) 
     WHERE b.OBJECTID = @old_row_id 

      END
    END
    ELSE
    BEGIN
      IF (@old_state_id != @current_state)
      BEGIN
        IF @edit_cnt > 0
        BEGIN
          EXECUTE @ret = dbo.SDE_new_branch_state @current_state, @current_lineage, @new_state OUTPUT
          IF @ret <> 0
          BEGIN
            CLOSE updt_cursor
            DEALLOCATE updt_cursor
            SET @error_string = 'The DEFAULT version continues to be modified, commit, rollback or re-execute the last statement to proceed.'
            RAISERROR (@error_string,16,-1)
            RETURN
          END
          SET @current_state = @new_state
        END
        IF @old_spatial_column IS NOT NULL AND NOT UPDATE(SHAPE)
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,i.GDB_GEOMATTR_DATA,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

     ELSE
INSERT INTO DBO.a110 (
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
        SELECT @old_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,NULL,i.GlobalID,@current_state  FROM inserted i WHERE i.OBJECTID = @new_row_id

        INSERT INTO DBO.d110 (DELETED_AT,SDE_DELETES_ROW_ID,SDE_STATE_ID) VALUES (@current_state, @old_row_id, @old_state_id)
      END
      ELSE
      BEGIN
        IF @old_spatial_column IS NOT NULL AND UPDATE(SHAPE)
UPDATE DBO.A110 SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = NULL,GlobalID = i.GlobalID FROM DBO.A110  a INNER JOIN inserted i  ON (a.OBJECTID = i.OBJECTID)  AND (a.SDE_STATE_ID = i.SDE_STATE_ID) 
     WHERE a.OBJECTID = @old_row_id AND a.SDE_STATE_ID = @current_state
     ELSE
     UPDATE DBO.A110 SET Agreement = i.Agreement,ELS_Agreem = i.ELS_Agreem,Samson_Agr = i.Samson_Agr,Parish = i.Parish,Township = i.Township,Section = i.Section,Agmt_Type = i.Agmt_Type,Original_L = i.Original_L,Original_1 = i.Original_1,Agmt_Date = i.Agmt_Date,Eff_Date = i.Eff_Date,Term__Mont = i.Term__Mont,Exp_Date = i.Exp_Date,Ext_Exp_Da = i.Ext_Exp_Da,Property_S = i.Property_S,Roy_Rate = i.Roy_Rate,Book = i.Book,Page = i.Page,Doc_Inst_N = i.Doc_Inst_N,Agmt_Gross = i.Agmt_Gross,Agmt_Net = i.Agmt_Net,Claimed_Ac = i.Claimed_Ac,Confirmed = i.Confirmed,Tract_Gros = i.Tract_Gros,Interest = i.Interest,Tract_Net = i.Tract_Net,Notice = i.Notice,Consent = i.Consent,Consent__ = i.Consent__,Pugh_Geogr = i.Pugh_Geogr,Pugh_Strat = i.Pugh_Strat,Legal_Desc = i.Legal_Desc,Label = i.Label,AgreementFormat = i.AgreementFormat,HBP_UND = i.HBP_UND,Active = i.Active,Activity_Update = i.Activity_Update,Override = i.Override,Shape = i.Shape,GDB_GEOMATTR_DATA = i.GDB_GEOMATTR_DATA,GlobalID = i.GlobalID FROM DBO.A110  a INNER JOIN inserted i  ON (a.OBJECTID = i.OBJECTID)  AND (a.SDE_STATE_ID = i.SDE_STATE_ID) 
     WHERE a.OBJECTID = @old_row_id AND a.SDE_STATE_ID = @current_state

      END
    END

  END
  FETCH NEXT FROM updt_cursor INTO @new_row_id, @old_row_id, @old_state_id, @new_spatial_column, @old_spatial_column
END
CLOSE updt_cursor
DEALLOCATE updt_cursor
IF (SELECT COUNT (*) FROM dbo.SDE_mvtables_modified WHERE state_id = @current_state AND registration_id = 110) = 0
 AND @current_state > 0
  EXECUTE dbo.SDE_mvmodified_table_insert 110, @current_state
END
GO
CREATE TRIGGER DBO.v110_delete  ON DBO.lnd_TestLeases_evw INSTEAD OF DELETE AS 
BEGIN
IF @@rowcount = 0 RETURN
DECLARE @ret INTEGER
DECLARE @current_state BIGINT
-- Check if we are already in an edit session.
DECLARE @g_state_id BIGINT
DECLARE @g_protected CHAR(1)
DECLARE @g_is_default CHAR(1)
DECLARE @g_version_id INTEGER
DECLARE @state_is_set INTEGER
EXECUTE dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT,@state_is_set OUTPUT
IF (@g_version_id = -1) AND (@g_is_default = '0')
BEGIN
  RAISERROR ('User must call edit_version before editing the view.',16,-1)
  RETURN
END

IF (@g_version_id = -1) AND (@g_is_default = '1') AND (@state_is_set = 1)
BEGIN
  RAISERROR ('Cannot call set_current_version before editing default version. Call set_default before editing.',16,-1)
  RETURN
END

IF @g_version_id != -1  -- standard editing
BEGIN
  EXECUTE @ret = dbo.SDE_current_version_writable @current_state OUTPUT
  IF @ret <> 0 RETURN
END
ELSE -- default version editing
  SET @current_state = @g_state_id
DECLARE @row_id INTEGER
DECLARE @old_state_id BIGINT
DECLARE @new_state BIGINT
DECLARE @current_lineage BIGINT
DECLARE @spatial_column INTEGER
DECLARE @edit_cnt INTEGER
DECLARE @error_string NVARCHAR(256)

SELECT @current_lineage = lineage_name  FROM dbo.SDE_states
  WHERE state_id = @current_state
DECLARE del_cursor CURSOR FOR SELECT OBJECTID,SDE_STATE_ID FROM deleted
OPEN del_cursor
FETCH NEXT FROM del_cursor INTO @row_id, @old_state_id
WHILE @@FETCH_STATUS = 0
BEGIN
  IF @g_is_default = '0'
  BEGIN
    IF (@old_state_id != @current_state)
      INSERT INTO DBO.d110 VALUES (@old_state_id,@row_id,@current_state)
    ELSE
    BEGIN
      DELETE FROM DBO.a110 WHERE OBJECTID = @row_id AND SDE_STATE_ID = @current_state
    END
  END
  ELSE
  BEGIN -- editing default version
    SELECT @edit_cnt = COUNT(*)
    FROM dbo.SDE_state_lineages
    WHERE lineage_id = @current_state AND lineage_id IN
      (SELECT DISTINCT lineage_id
       FROM dbo.SDE_state_lineages
       WHERE lineage_name IN
        (SELECT lineage_name
         FROM dbo.SDE_state_lineages
         WHERE lineage_id IN
          (SELECT DELETED_AT
           FROM DBO.d110 WITH (TABLOCKX,HOLDLOCK)
           WHERE SDE_DELETES_ROW_ID = @row_id
             AND DELETED_AT > @current_state)))

    if @current_state = 0
    BEGIN
      IF @edit_cnt > 0
      BEGIN
        EXECUTE @ret = dbo.SDE_new_branch_state @current_state, @current_lineage, @new_state OUTPUT
        IF @ret <> 0
        BEGIN
          CLOSE del_cursor
          DEALLOCATE del_cursor
          SET @error_string = 'The DEFAULT version continues to be modified, commit, rollback or re-execute the last statement to proceed.'
          RAISERROR (@error_string,16,-1)
          RETURN
        END
        SET @current_state = @new_state
        INSERT INTO DBO.d110 (DELETED_AT,SDE_DELETES_ROW_ID,SDE_STATE_ID) VALUES
         (@current_state, @row_id, @old_state_id)
      END
      ELSE
        DELETE FROM DBO.LND_TESTLEASES WHERE OBJECTID = @row_id
    END
    ELSE -- @current_state > 0
    BEGIN
      IF @old_state_id != @current_state
      BEGIN
        IF @edit_cnt > 0
        BEGIN
          EXECUTE @ret = dbo.SDE_new_branch_state @current_state, @current_lineage, @new_state OUTPUT
          IF @ret <> 0
          BEGIN
            CLOSE del_cursor
            DEALLOCATE del_cursor
            SET @error_string = 'The DEFAULT version continues to be modified, commit, rollback or re-execute the last statement to proceed.'
            RAISERROR (@error_string,16,-1)
            RETURN
          END
          SET @current_state = @new_state
        END
        INSERT INTO DBO.d110 (DELETED_AT,SDE_DELETES_ROW_ID,SDE_STATE_ID) VALUES
           (@current_state, @row_id, @old_state_id)
      END
      ELSE
      BEGIN
        IF @edit_cnt > 0
        BEGIN
          EXECUTE @ret = dbo.SDE_new_branch_state @current_state, @current_lineage, @new_state OUTPUT
          IF @ret <> 0
          BEGIN
            CLOSE del_cursor
            DEALLOCATE del_cursor
            SET @error_string = 'The DEFAULT version continues to be modified, commit, rollback or re-execute the last statement to proceed.'
            RAISERROR (@error_string,16,-1)
            RETURN
          END
          SET @current_state = @new_state
          INSERT INTO DBO.d110 (DELETED_AT,SDE_DELETES_ROW_ID,SDE_STATE_ID) VALUES
           (@current_state, @row_id, @old_state_id)
        END
        ELSE
          DELETE FROM DBO.a110
            WHERE OBJECTID = @row_id AND SDE_STATE_ID = @old_state_id
      END

    END
  END
  FETCH NEXT FROM del_cursor INTO @row_id, @old_state_id
END
CLOSE del_cursor
DEALLOCATE del_cursor
IF (SELECT COUNT (*) FROM dbo.SDE_mvtables_modified WHERE state_id = @current_state AND registration_id = 110) = 0
 AND @current_state > 0
EXECUTE dbo.SDE_mvmodified_table_insert 110, @current_state
END
GO
CREATE TRIGGER DBO.v110_insert ON DBO.lnd_TestLeases_evw INSTEAD OF INSERT AS 
BEGIN
DECLARE @rowcount INTEGER
SET @rowcount = @@rowcount
IF @rowcount = 0 RETURN
-- Check if we are already in an edit session.
DECLARE @g_state_id BIGINT
DECLARE @g_protected CHAR(1)
DECLARE @g_is_default CHAR(1)
DECLARE @g_version_id INTEGER
DECLARE @state_is_set INTEGER
EXECUTE dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT,@state_is_set OUTPUT
IF (@g_version_id = -1) AND (@g_is_default = '0')
BEGIN
  RAISERROR ('User must call edit_version before editing the view.',16,-1)
  RETURN
END

IF (@g_version_id = -1) AND (@g_is_default = '1') AND (@state_is_set = 1)
BEGIN
  RAISERROR ('Cannot call set_current_version before editing default version. Call set_default before editing.',16,-1)
  RETURN
END

DECLARE @ret INTEGER
DECLARE @current_state BIGINT
IF @g_version_id != -1  -- standard editing
BEGIN
  EXECUTE @ret = dbo.SDE_current_version_writable @current_state OUTPUT
  IF @ret <> 0 RETURN
END
ELSE -- default version editing
  SET @current_state = @g_state_id
DECLARE @next_row_id INTEGER
DECLARE @num_ids INTEGER
DECLARE @return_row_id INTEGER
DECLARE @num_return_ids INTEGER
DECLARE @archive_oid INTEGER
IF @rowcount = 1
BEGIN
  SELECT @next_row_id = OBJECTID FROM inserted
    IF (@next_row_id IS NULL)
    BEGIN
    EXECUTE DBO.i110_get_ids 2, 1, @next_row_id OUTPUT, @num_ids OUTPUT
    IF @num_ids > 1
    BEGIN
      SET @return_row_id = @next_row_id + 1
      SET @num_return_ids = @num_ids - 1
      EXECUTE DBO.i110_return_ids 2, @return_row_id, @num_return_ids
    END
  END

  -- If editing state 0, then the insert being performed
  -- must be written to the base table, not the adds table

  IF @current_state = 0
  BEGIN
  INSERT INTO DBO.LND_TESTLEASES
  (OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID)
  SELECT 
  @next_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,NULL,i.GlobalID  FROM inserted i
  END
  ELSE
  BEGIN
  INSERT INTO DBO.a110
  (OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID)
  SELECT 
  @next_row_id,i.Agreement,i.ELS_Agreem,i.Samson_Agr,i.Parish,i.Township,i.Section,i.Agmt_Type,i.Original_L,i.Original_1,i.Agmt_Date,i.Eff_Date,i.Term__Mont,i.Exp_Date,i.Ext_Exp_Da,i.Property_S,i.Roy_Rate,i.Book,i.Page,i.Doc_Inst_N,i.Agmt_Gross,i.Agmt_Net,i.Claimed_Ac,i.Confirmed,i.Tract_Gros,i.Interest,i.Tract_Net,i.Notice,i.Consent,i.Consent__,i.Pugh_Geogr,i.Pugh_Strat,i.Legal_Desc,i.Label,i.AgreementFormat,i.HBP_UND,i.Active,i.Activity_Update,i.Override,i.Shape,NULL,i.GlobalID,@current_state  FROM inserted i
  END
END
ELSE
BEGIN
  --Multi-row insert, need to cursor through the changes.
CREATE TABLE #temp110(
OBJECTID int
,Agreement nvarchar(150) 
,ELS_Agreem nvarchar(254) 
,Samson_Agr nvarchar(254) 
,Parish nvarchar(254) 
,Township nvarchar(254) 
,Section numeric(38,8) 
,Agmt_Type nvarchar(254) 
,Original_L nvarchar(254) 
,Original_1 nvarchar(254) 
,Agmt_Date datetime2
,Eff_Date datetime2
,Term__Mont datetime2
,Exp_Date datetime2
,Ext_Exp_Da datetime2
,Property_S nvarchar(254) 
,Roy_Rate numeric(38,8) 
,Book numeric(38,8) 
,Page numeric(38,8) 
,Doc_Inst_N numeric(38,8) 
,Agmt_Gross numeric(38,8) 
,Agmt_Net numeric(38,8) 
,Claimed_Ac numeric(38,8) 
,Confirmed numeric(38,8) 
,Tract_Gros numeric(38,8) 
,Interest numeric(38,8) 
,Tract_Net numeric(38,8) 
,Notice nvarchar(254) 
,Consent nvarchar(254) 
,Consent__ nvarchar(254) 
,Pugh_Geogr nvarchar(254) 
,Pugh_Strat nvarchar(254) 
,Legal_Desc nvarchar(254) 
,Label nvarchar(250) 
,AgreementFormat nvarchar(50) 
,HBP_UND nvarchar(25) 
,Active nvarchar(5) 
,Activity_Update datetime2
,Override nvarchar(5) 
,Shape geometry
,GDB_GEOMATTR_DATA varbinary(max) 
,GlobalID uniqueidentifier
)
INSERT INTO #temp110(
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID) SELECT 
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID FROM inserted
DECLARE ins_cursor CURSOR FOR SELECT OBJECTID FROM #temp110 FOR UPDATE OF OBJECTID
OPEN ins_cursor
DECLARE @rowid INTEGER
FETCH NEXT FROM ins_cursor INTO @rowid
WHILE @@FETCH_STATUS = 0
BEGIN
    EXECUTE DBO.i110_get_ids 2, 1, @next_row_id OUTPUT, @num_ids OUTPUT
    IF @num_ids > 1
    BEGIN
      SET @return_row_id = @next_row_id + 1
      SET @num_return_ids = @num_ids - 1
      EXECUTE DBO.i110_return_ids 2, @return_row_id, @num_return_ids
    END
  UPDATE #temp110 SET OBJECTID = @next_row_id WHERE CURRENT OF ins_cursor
  FETCH NEXT FROM ins_cursor INTO @rowid
END
  -- If editing state 0, then the insert being performed
  -- must be written to the base table, not the adds table

IF @current_state = 0
BEGIN
INSERT INTO DBO.LND_TESTLEASES(
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID) SELECT 
t.OBJECTID,t.Agreement,t.ELS_Agreem,t.Samson_Agr,t.Parish,t.Township,t.Section,t.Agmt_Type,t.Original_L,t.Original_1,t.Agmt_Date,t.Eff_Date,t.Term__Mont,t.Exp_Date,t.Ext_Exp_Da,t.Property_S,t.Roy_Rate,t.Book,t.Page,t.Doc_Inst_N,t.Agmt_Gross,t.Agmt_Net,t.Claimed_Ac,t.Confirmed,t.Tract_Gros,t.Interest,t.Tract_Net,t.Notice,t.Consent,t.Consent__,t.Pugh_Geogr,t.Pugh_Strat,t.Legal_Desc,t.Label,t.AgreementFormat,t.HBP_UND,t.Active,t.Activity_Update,t.Override,t.Shape,t.GDB_GEOMATTR_DATA,t.GlobalID FROM #temp110 t 
END
ELSE
BEGIN
INSERT INTO DBO.a110(
OBJECTID,Agreement,ELS_Agreem,Samson_Agr,Parish,Township,Section,Agmt_Type,Original_L,Original_1,Agmt_Date,Eff_Date,Term__Mont,Exp_Date,Ext_Exp_Da,Property_S,Roy_Rate,Book,Page,Doc_Inst_N,Agmt_Gross,Agmt_Net,Claimed_Ac,Confirmed,Tract_Gros,Interest,Tract_Net,Notice,Consent,Consent__,Pugh_Geogr,Pugh_Strat,Legal_Desc,Label,AgreementFormat,HBP_UND,Active,Activity_Update,Override,Shape,GDB_GEOMATTR_DATA,GlobalID,SDE_STATE_ID) SELECT 
t.OBJECTID,t.Agreement,t.ELS_Agreem,t.Samson_Agr,t.Parish,t.Township,t.Section,t.Agmt_Type,t.Original_L,t.Original_1,t.Agmt_Date,t.Eff_Date,t.Term__Mont,t.Exp_Date,t.Ext_Exp_Da,t.Property_S,t.Roy_Rate,t.Book,t.Page,t.Doc_Inst_N,t.Agmt_Gross,t.Agmt_Net,t.Claimed_Ac,t.Confirmed,t.Tract_Gros,t.Interest,t.Tract_Net,t.Notice,t.Consent,t.Consent__,t.Pugh_Geogr,t.Pugh_Strat,t.Legal_Desc,t.Label,t.AgreementFormat,t.HBP_UND,t.Active,t.Activity_Update,t.Override,t.Shape,t.GDB_GEOMATTR_DATA,t.GlobalID,@current_state FROM #temp110 t 
END
CLOSE ins_cursor
DEALLOCATE ins_cursor
DROP TABLE #temp110
END
IF (SELECT COUNT (*) FROM dbo.SDE_mvtables_modified WHERE state_id = @current_state AND registration_id = 110) = 0
 AND @current_state > 0
EXECUTE dbo.SDE_mvmodified_table_insert 110, @current_state
END