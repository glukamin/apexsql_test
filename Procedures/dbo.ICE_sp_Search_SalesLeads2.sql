SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_Search_SalesLeads2]
(
	@Sales_Lead_ID int = 0,	
	@First_Name varchar(100) = '',
	@Last_Name varchar(100) = '',	
	@Email varchar(100) = '',
	@Country varchar(100) = '',
	@Last_Download_From datetime = '01/01/1900',
	@Last_Download_To datetime = '01/01/2100'
)
AS
BEGIN	
	DECLARE @sql nvarchar(4000)
	DECLARE @hasParam bit
	SET @hasParam = 0
	
	SET @sql = ' DECLARE @Last_Download_From datetime '
	SET @sql = @sql + ' SET @Last_Download_From=''' + CONVERT(varchar(30),@Last_Download_From) + ''''
	SET @sql = @sql + ' DECLARE @Last_Download_To datetime '
	SET @sql = @sql + ' SET @Last_Download_To=''' + CONVERT(varchar(30),@Last_Download_To) + ''''
	
	IF @Last_Download_From > '01/01/1900'
		SET @hasParam = 1
		
	IF @Last_Download_To < '01/01/2100'
		SET @hasParam = 1	
	--Declare parameters. We do this to prevent sql injections
	IF @Sales_Lead_ID > 0
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Sales_Lead_ID int'
		SET @sql = @sql + ' SET @Sales_Lead_ID=' + CONVERT(varchar(10),@Sales_Lead_ID)
		END
	
	IF len(ISNULL(@First_Name,'')) > 0 
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @First_Name varchar(100)'
		SET @sql = @sql + ' SET @First_Name=''' + @First_Name + ''''
		END
	IF len(ISNULL(@Last_Name,'')) > 0 
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Last_Name varchar(100)'
		SET @sql = @sql + ' SET @Last_Name=''' + @Last_Name + ''''
		END
	IF len(ISNULL(@Email,'')) > 0 
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Email varchar(100)'
		SET @sql = @sql + ' SET @Email=''' + @Email + ''''
		END
	IF len(ISNULL(@Country,'')) > 0 
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Country varchar(100)'
		SET @sql = @sql + ' SET @Country=''' + @Country + ''''
		END	
	SET @sql = @sql + ' 
		SELECT DISTINCT
			[SalesLeadId],
			[First_Name],
			[Last_Name],
			[Phone],
			[Email],
			[Country],
			[Zip],
			[Author_ID],
			[Date_Added],
			[Date_Submitted_To_SF],
			[Lead_Source],
			--[First_Download] = dbo.ICE_GetLeadDownloadDate(S.SalesLeadId),
			dbo.ICE_IsCustomer(Email) as IsCustomer
		FROM
			[dbo].[ICE_SalesLeads] S
		--INNER JOIN dbo.ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id
		  WHERE (1=1)'
	--Add parameters
	SET @sql = @sql + ' AND (dbo.ICE_GetLeadDownloadDate(S.SalesLeadId)) BETWEEN @Last_Download_From and @Last_Download_To '
	IF @Sales_Lead_ID > 0
		SET @sql = @sql + ' AND SalesLeadID = @Sales_Lead_ID'	
	IF len(ISNULL(@First_Name,'')) > 0 
		SET @sql = @sql + ' AND First_Name like ''%'' + @First_Name + ''%'''
	IF len(ISNULL(@Last_Name,'')) > 0 
		SET @sql = @sql + ' AND Last_Name like ''%'' + @Last_Name + ''%'''
	IF len(ISNULL(@Email,'')) > 0 
		SET @sql = @sql + ' AND Email like ''%'' + @Email + ''%'''	
	IF len(ISNULL(@Country,'')) > 0 
		SET @sql = @sql + ' AND Country like ''%'' + @Country + ''%'''
		
	--If there are no params then create select statement that will not retrun any rows 
	IF @hasParam = 0
		SET @sql = 'SELECT * FROM ICE_Contacts WHERE Contact_ID < 0'	
	--Execute query	
	print @sql
	EXECUTE sp_executesql @sql
END



GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_SalesLeads2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_SalesLeads2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_SalesLeads2]
	TO [davor.dumeljic]
GO
