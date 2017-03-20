SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE AUDIT_prc_StandardReportWithOrder

/* ------------------------------------------------------------

    PROCEDURE:      AUDIT_prc_StandardReport

    DESCRIPTION:    Selects Audit Log records by user defined criteria
                    Up to 3 Primary Key fields are handled

   ------------------------------------------------------------ */

  (@TABLE_NAME     varchar(128),   

   @TABLE_OWNER    varchar(128)     = NULL,    
   @FIELD_NAME     varchar(128)     = NULL,    
   @USER_NAME      varchar(30)      = NULL, 
   @DATE_FROM     varchar(30)          = NULL,        
   @DATE_TO       varchar(30)         = NULL,        
   @ACTION_ID      char(1)          = NULL,         
   @OLD_VALUE      varchar(3800)    = NULL,    
   @NEW_VALUE      varchar(3800)    = NULL,    
   @ROW_COUNT      int              = NULL,
   @HOST_NAME      varchar(25)      = NULL,
   @APP_NAME       varchar(100)     = NULL,
   @ORDER_NAME     varchar(128)=NULL,
   @OrderBy 		char(4) = NULL)
AS
DECLARE    @obj_id             int,
       @prim_key_cnt       int,
       @full_table_name    varchar(255),
       @prim_key       varchar(128),
       @prim_key1      varchar(128),
       @prim_key2      varchar(128),
       @prim_key3      varchar(128),
       @x          int



declare @MyOrder varchar(128)

select @MyOrder=@ORDER_NAME
if @MyOrder IS NULL
	SET @MyOrder='Table_Name'
if @MyOrder =''
	SET @MyOrder='Table_Name'
If  @OrderBy IS NULL
	SET  @OrderBy = 'DESC'

/* Set replacement values for filter parameter */
IF @FIELD_NAME IS NULL
   SET @FIELD_NAME= '%'

IF @USER_NAME IS NULL
   SET @USER_NAME = '%'

IF @DATE_FROM IS NULL
   SET @DATE_FROM= '1/1/1900'

IF @DATE_TO IS NULL
   SET @DATE_TO = '1/1/3900'

IF @ACTION_ID IS NULL
   SET @ACTION_ID = '%'

IF @OLD_VALUE IS NULL
   SET @OLD_VALUE = '%'

IF @NEW_VALUE IS NULL
   SET @NEW_VALUE = '%'

IF @HOST_NAME IS NULL
   SET @HOST_NAME = '%'

IF @APP_NAME IS NULL
   SET @APP_NAME = '%'

IF @TABLE_NAME IS NULL
   SET @TABLE_NAME = '%'

IF @ROW_COUNT IS NULL
   SET @ROW_COUNT = 99999

IF @MyOrder='Column_name' 
	select @MyOrder='Col_name'

/* Set the table owner */
IF @TABLE_OWNER is NULL
   SELECT @full_table_name = quotename(@TABLE_NAME)
ELSE
   SELECT @full_table_name = quotename(@TABLE_OWNER) +
           '.' + quotename(@TABLE_NAME)

/* Get Object ID */
SELECT @obj_id = object_id(@full_table_name)

/* Restrict the number of rows returned by SELECT statement */
SET ROWCOUNT @ROW_COUNT

/* The specific SELECT depends on the number of primary key columns */
/* stored in the audit log for the respective table */
declare @sqlQuery varchar(3000)

select @sqlQuery='   SELECT AUDIT_LOG_DATA_ID as ''ID'',   obj.name    ''Table_Name'',
           CASE    t.AUDIT_ACTION_ID
   	  WHEN 2 then ''Insert''
               WHEN 1 then ''Update''
               WHEN 3 then ''Delete''
           END         ''Action'',
           d.PRIMARY_KEY as ''primarykey'',
           d.COL_NAME ''Column_Name'',
           d.OLD_VALUE ''Old_Value'',
           d.NEW_VALUE ''NEW_Value'',
           t.MODIFIED_BY ''Modified_By'',
           t.MODIFIED_DATE ''Modified_Date'',
           t.HOST_NAME ''Computer'',
           t.APP_NAME ''Application''
    FROM AUDIT_LOG_TRANSACTIONS t
    JOIN AUDIT_LOG_DATA d ON d.AUDIT_LOG_TRANSACTION_ID = t.AUDIT_LOG_TRANSACTION_ID
    JOIN sysobjects obj ON obj.[ID] = t.SYSOBJ_ID
    WHERE  obj.name LIKE '''+@TABLE_NAME+'''
      AND  d.COL_NAME LIKE '''+@FIELD_NAME+'''
      AND  t.MODIFIED_BY LIKE '''+@USER_NAME+'''
      AND  t.MODIFIED_DATE >= '''+@DATE_FROM+'''
      AND  t.MODIFIED_DATE <= '''+@DATE_TO+'''
      AND  t.AUDIT_ACTION_ID LIKE '''+@ACTION_ID+'''
      AND  ((d.OLD_VALUE IS NULL AND '''+@OLD_VALUE+''' = ''%'') OR (d.OLD_VALUE LIKE '''+@OLD_VALUE+'''))
      AND  ((d.NEW_VALUE IS NULL AND '''+@NEW_VALUE+''' = ''%'') OR (d.NEW_VALUE LIKE '''+@NEW_VALUE+'''))
      AND t.HOST_NAME LIKE '''+@HOST_NAME+'''
      AND t.APP_NAME LIKE '''+@APP_NAME+''' ORDER BY ['+@MyOrder+']' + @OrderBy

Exec( @sqlQuery )

RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[AUDIT_prc_StandardReportWithOrder]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[AUDIT_prc_StandardReportWithOrder]
	TO [davor.dumeljic]
GO
