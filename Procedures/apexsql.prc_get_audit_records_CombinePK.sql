SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE prc_get_audit_records_CombinePK
/* ------------------------------------------------------------
PROCEDURE:     prc_get_audit_records_CombinePK
DESCRIPTION:   Selects Audit Log records by user defined criteria
               Primary key is combined into one field.
AUTHOR:        LockwoodTech Software 11/27/99 
LEGAL:         Copyright 1999-2000
               Lockwood Technical Svc Inc.  All rights reserved 
------------------------------------------------------------ */
   (@table_name        varchar(128) = NULL,    
   @table_owner        varchar(128) = NULL,    
   @field_name         varchar(128) = NULL,    
   @user_name          varchar(30) = NULL, 
   @date_from          datetime = NULL,        
   @date_to            datetime = NULL,        
   @action_id          char(1) = NULL,         
   @old_value          varchar(3800) = NULL,    
   @new_value          varchar(3800) = NULL,    
   @row_count          int = NULL,
   @host_name          varchar(25) = NULL,
   @app_name           varchar(75) = NULL)
   
   
AS
DECLARE    @obj_id             int,
       @prim_key_cnt       int,
       @full_table_name    varchar(255),
       @prim_key       varchar(128),
       @prim_key1      varchar(128),
       @prim_key2      varchar(128),
       @prim_key3      varchar(128),
       @x          int
/* Set replacement values for filter parameter */
IF @table_name IS NULL
   SET @table_name = '%'
IF @field_name IS NULL
   SET @field_name = '%'
IF @user_name IS NULL
   SET @user_name = '%'
IF @date_from IS NULL
   SET @date_from = '1/1/1900'
IF @date_to IS NULL
   SET @date_to = '1/1/3900'
IF @action_id IS NULL
   SET @action_id = '%'
IF @old_value IS NULL
   SET @old_value = '%'
IF @new_value IS NULL
   SET @new_value = '%'
IF @host_name IS NULL
   SET @host_name = '%'
IF @app_name IS NULL
   SET @app_name = '%'
IF @row_count IS NULL
   SET @row_count = 99999
/* Set the table owner */
IF @table_owner is NULL
   SELECT @full_table_name = quotename(@table_name)
ELSE
   SELECT @full_table_name = quotename(@table_owner) +
           '.' + quotename(@table_name)
/* Get Object ID */
SELECT @obj_id = object_id(@full_table_name)
/* Get primary keys */
/* Restrict the number of rows returned by SELECT statement */
SET ROWCOUNT @row_count
/* The specific SELECT depends on the number of primary key columns */
/* stored in the audit log for the respective table */
   SELECT  obj.name    'Table_Name',
           CASE    aud.audit_action_id
               WHEN 2 then 'Insert'
               WHEN 1 then 'Update'
               WHEN 3 then 'Delete'
           END         'Action',
           aud.primary_key as 'Primary Key',
           aud.col_name 'Column Name',
           aud.old_value 'Old Value',
           aud.new_value 'New Value',
           aud.modified_by 'Modified By',
           aud.modified_date 'Modified Date',
           aud.Host_name 'Computer',
           aud.App_Name 'Application'
     FROM  audit_log aud,
           sysobjects obj
    WHERE  aud.sysobj_id = obj.id
      AND  obj.name LIKE @table_name
      AND  aud.col_name LIKE @field_name
      AND  aud.modified_by LIKE @user_name
      AND  aud.modified_date >= @date_from
      AND  aud.modified_date <= @date_to
      AND  aud.audit_action_id LIKE @action_id
      AND  ((aud.old_value IS NULL) OR (aud.old_value LIKE @old_value))
      AND  ((aud.new_value IS NULL) OR (aud.new_value LIKE @new_value))
      AND aud.host_name LIKE @host_name
      AND aud.app_name LIKE @app_name
GO
GRANT EXECUTE
	ON [apexsql].[prc_get_audit_records_CombinePK]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_get_audit_records_CombinePK]
	TO [davor.dumeljic]
GO
