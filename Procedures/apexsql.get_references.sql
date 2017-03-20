SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE get_references
	@reseller int = NULL,
	@sday tinyint,
	@smonth tinyint,
	@syear smallint,
	@fday tinyint,
	@fmonth tinyint,
	@fyear smallint
AS
DECLARE @sdatestr varchar(30)
DECLARE @fdatestr varchar(30)
DECLARE @sdate datetime
DECLARE @fdate datetime
SET @sdatestr = CAST(@smonth AS varchar(2)) + '/' + CAST(@sday AS varchar(2)) + '/' + CAST(@syear AS varchar(4))
SET @fdatestr = CAST(@fmonth AS varchar(2)) + '/' + CAST(@fday AS varchar(2)) + '/' + CAST(@fyear AS varchar(4))
IF ISDATE(@sdatestr)=1 SET @sdate = CONVERT(datetime, @sdatestr, 101)
IF ISDATE(@fdatestr)=1 SET @fdate = CONVERT(datetime, @fdatestr, 101)
IF @reseller IS NULL 
	SELECT
		reseller,
		[count]=COUNT(reseller)
	FROM
		reference
	WHERE
		inserted >= @sdate AND inserted <= @fdate
	GROUP BY reseller
ELSE
	SELECT
		id,
		http_referer,
		remote_addr,
		remote_name,
		inserted
	FROM
		reference
	WHERE
		reseller=@reseller AND inserted >= @sdate AND inserted <= @fdate
GO
GRANT EXECUTE
	ON [apexsql].[get_references]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[get_references]
	TO [davor.dumeljic]
GO
