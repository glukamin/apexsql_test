SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE    PROCEDURE prc_sel_user_product_downloads
@ProductId varchar(200),
@FromDate datetime,
@ToDate datetime,
@IsRegistered bit
AS
DECLARE @strTempSQL VARCHAR(1000)
DECLARE @strSQL VARCHAR(1000)
DECLARE @intFlag bit
SET @strTempSQL = ''
SET @strSQL = ''
SET @intFlag = 0
IF @ProductId is NOT null OR len(@ProductId) > 0 
BEGIN
	BEGIN
		SET @strTempSQL = '  b.productID in (' + @ProductId + ') '
	END	
	SET @intFlag = 1 
END 
IF @FromDate is not null OR len(@FromDate) > 0 
BEGIN
	IF @intFlag = 1 
	BEGIN
		SET @strTempSQL =  @strTempSQL + ' AND  b.DownloadDate >=''' + convert(varchar,@FromDate) + ''''
	END
	ELSE
	BEGIN
		SET @strTempSQL =  @strTempSQL + '  b.DownloadDate >=''' + convert(varchar,@FromDate) + ''''
	END	
	SET @intFlag = 1 
END
IF @ToDate is not null OR len(@ToDate) > 0 
BEGIN
	IF @intFlag = 1 
	BEGIN
		SET @strTempSQL =  @strTempSQL + ' AND  b.DownloadDate <=''' + convert(varchar,@ToDate) + ''''
	END
	ELSE
	BEGIN
		SET @strTempSQL = @strTempSQL + '  b.DownloadDate <=''' + convert(varchar,@ToDate) + ''''
	END	
	SET @intFlag = 1 
END
IF @IsRegistered is not null OR len(@IsRegistered) > 0 
BEGIN
	IF @intFlag = 1 
	BEGIN
		SET @strTempSQL = @strTempSQL + ' AND  c.RegStatus =1'
	END
	ELSE
	BEGIN
		SET @strTempSQL = @strTempSQL + '  c.RegStatus =1'
	END		
END
SET @strSQL = 'SELECT a.Author_email as UserEmail from tblAuthor a join tblDownloads b on a.Author_ID = b.UserID left join tblProductRegistration c 
on b.UserID=c.UserID and b.ProductID =c.ProductID '
If len(@strTempSQL) >0
BEGIN
	SET @strSQL = @strSQL + ' WHERE ' + @strTempSQL + ' GROUP BY a.Author_email ORDER BY a.Author_email'
END 
--select @strSQL
exec(@strSQL)

GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_user_product_downloads]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_user_product_downloads]
	TO [davor.dumeljic]
GO
