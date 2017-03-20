SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/* ------------------------------------------------------------

   PROCEDURE:     AUDIT_prc_AggregateReportWithOrder

   AUTHOR:        LockwoodTech 18 November 2002 

   NOTES:         
		2.11 - Changed to suport new audit architecture 
		2.5 - Changed to support case sensitive SQL Installations	        
		2.4 - @GroupByDate now accepts 0 which means the report
		does not HAVE to group by any date format (i.e. hour, day)
			

   VERSION:	  2.11

------------------------------------------------------------ */

CREATE  PROC AUDIT_prc_AggregateReportWithOrder
	@TABLE_NAME		varchar(128) 	= NULL,
	@APPLICATION		varchar (100) 	= NULL,
	@COMPUTER		varchar(25) 	= NULL,
	@DATE_FROM		datetime	= NULL,
	@DATE_TO 		datetime 	= NULL,
	@ROW_COUNT 		int 		= NULL,
	@ACTION 		varchar(20)	= NULL,
	@MODIFIED_BY 		varchar(30)	= NULL,
	@GroupByDate 		tinyint 	= 1,
	@GroupByTableName 	bit 		= 0,
	@GroupByMODIFIED_BY	bit 		= 0,
	@GroupByACTION 		bit 		= 0,
	@GroupByAPPLICATION	bit 		= 0,
	@GroupByCOMPUTER 	bit 		= 0,
	@OrderByCols		varchar(128)	= NULL,
	@OrderBy		bit		= 1
AS
DECLARE	@sqlstr varchar(8000)
DECLARE	@DateExpression varchar(8000)
DECLARE	@DateFieldName varchar(20)
DECLARE @SearcheableName nvarchar(261)

declare @len int

IF @GroupByDate not in (0,1,2,3,4) 
BEGIN
  RAISERROR ('@GroupByDate must be one of: 0,1,2,3,4',16,1)
  RETURN -1
END

IF @TABLE_NAME IS NULL
   SET @SearcheableName = '%'
ELSE
   SET @SearcheableName='%.'+REPLACE(QUOTENAME(PARSENAME(@TABLE_NAME,1)),'[','[[]')


SET @DateExpression = 
  CASE
   WHEN @GroupByDate = 0 
    THEN ''
   WHEN @GroupByDate = 1 
    THEN 'LEFT(CONVERT(varchar(20), convert(datetime,MODIFIED_DATE), 100),14) + RIGHT(CONVERT(varchar(20), convert(datetime,MODIFIED_DATE), 100),2) '
   WHEN @GroupByDate = 2
    THEN 'CONVERT(varchar(20), CONVERT(datetime,MODIFIED_DATE), 107) '
   WHEN @GroupByDate = 3 
    THEN 'LEFT(CONVERT(varchar(20), CONVERT(datetime,MODIFIED_DATE), 107),4)+RIGHT(CONVERT(varchar(20), CONVERT(datetime,MODIFIED_DATE), 107),4) '
   WHEN @GroupByDate = 4
    THEN 'RIGHT(CONVERT(varchar(20), CONVERT(datetime,MODIFIED_DATE), 107),4) '
  END  
SET @DateFieldName = 
  CASE
   WHEN @GroupByDate = 0 
    THEN ''
   WHEN @GroupByDate = 1 
    THEN ' AS ''Hour'','
   WHEN @GroupByDate = 2
    THEN ' AS ''Date'','
   WHEN @GroupByDate = 3 
    THEN ' AS ''Month'','
   WHEN @GroupByDate = 4
    THEN ' AS ''Year'','
  END  

SET @sqlstr = '
SELECT  TOP'+STR(CASE WHEN @ROW_COUNT is null THEN 99999 ELSE @ROW_COUNT END)+' Count(*) AS [ID], '+
 CASE
  WHEN @GroupByTableName = 0 THEN ''
  ELSE ' TABLE_NAME,'
 END +
 CASE
  WHEN @GroupByMODIFIED_BY = 0 THEN ''
  ELSE ' MODIFIED_BY,'
 END +
 CASE
  WHEN @GroupByACTION = 0 THEN ''
  ELSE ' ACTION,'
 END +
 CASE
  WHEN @GroupByAPPLICATION = 0 THEN ''
  ELSE ' APPLICATION,'
 END +
 CASE
  WHEN @GroupByCOMPUTER = 0 THEN ''
  ELSE ' COMPUTER,'
 END +
 +@DateExpression+
@DateFieldName

set @sqlstr = rtrim(@sqlstr)

set @len = len(@sqlstr)
if substring(@sqlstr, @len, 1) = ','
begin
	set @sqlstr = substring(@sqlstr,1,@len-1)
end


set @sqlstr = @sqlstr +

 ' FROM AUDIT_VIEW
 WHERE TABLE_NAME like '''+@SearcheableName+''''+
 CASE
  WHEN @APPLICATION is NULL THEN ''
  ELSE ' AND APPLICATION = '''+@APPLICATION+''''
 END +
 CASE
  WHEN @COMPUTER is NULL THEN ''
  ELSE ' AND COMPUTER = '''+@COMPUTER+''''
 END +
 CASE
  WHEN @DATE_FROM is NULL THEN ''
  ELSE ' AND CONVERT(DATETIME,MODIFIED_DATE) >= '''+CONVERT(varchar(20),@DATE_FROM,107)+''''
 END +
 CASE
  WHEN @DATE_TO is NULL THEN ''
  ELSE ' AND CONVERT(DATETIME,MODIFIED_DATE) <= '''+CONVERT(varchar(20),@DATE_TO+1,107)+''''
 END +
 CASE
  WHEN @ACTION is NULL THEN ''
  ELSE ' AND ACTION = '''+@ACTION+''''
 END +
 CASE
  WHEN @MODIFIED_BY is NULL THEN ''
  ELSE ' AND MODIFIED_BY = '''+@MODIFIED_BY+''''
 END +


CASE
  WHEN @DateExpression = ''  THEN ' GROUP BY '
  ELSE ' GROUP BY ' + @DateExpression + ', '
 END +
 CASE WHEN @GroupByTableName 	= 1 	THEN ' TABLE_NAME, ' 	ELSE '' END +
 CASE WHEN @GroupByMODIFIED_BY 	= 1 	THEN ' MODIFIED_BY, ' 	ELSE '' END +
 CASE WHEN @GroupByACTION 	= 1 	THEN ' ACTION, ' 	ELSE '' END +
 CASE WHEN @GroupByAPPLICATION 	= 1 	THEN ' APPLICATION, ' 	ELSE '' END +
 CASE WHEN @GroupByCOMPUTER 	= 1 	THEN ' COMPUTER, ' 	ELSE '' END

set @len = len(@sqlstr)
if substring(@sqlstr, @len, 1) = ','
begin
	set @sqlstr = substring(@sqlstr,1,@len-1)
end

IF @OrderByCols IS NOT NULL 
BEGIN
   SET @sqlstr = @sqlstr +
   CASE WHEN @OrderByCols is NULL THEN '' ELSE ' ORDER BY ' + @OrderByCols END +
   CASE WHEN @OrderBy = 1 THEN ' DESC ' ELSE ' ASC ' END
END
EXEC (@sqlstr)

RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[AUDIT_prc_AggregateReportWithOrder]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[AUDIT_prc_AggregateReportWithOrder]
	TO [davor.dumeljic]
GO
