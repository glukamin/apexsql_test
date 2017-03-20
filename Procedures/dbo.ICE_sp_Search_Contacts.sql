SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Contacts]
(
	@Contact_ID int = 0,
	@Cust_ID int = 0,
	@First_Name varchar(100) = '',
	@Last_Name varchar(100) = '',
	@Company varchar(100) = '',
	@Email varchar(100) = ''
)
AS
BEGIN
	DECLARE @hasParam bit
	SET @hasParam = 0
	DECLARE @sql nvarchar(4000)
	SET @sql = ''
	--Declare parameters. We do this to prevent sql injections
	IF @Contact_ID > 0
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Contact_ID int'
		SET @sql = @sql + ' SET @Contact_ID=' + CONVERT(varchar(10),@Contact_ID)
		END
	IF @Cust_ID > 0
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Cust_ID int'
		SET @sql = @sql + ' SET @Cust_ID=' + CONVERT(varchar(10),@Cust_ID)
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
	IF len(ISNULL(@Company,'')) > 0 
		BEGIN
		SET @hasParam = 1
		SET @sql = @sql + ' DECLARE @Company varchar(100)'
		SET @sql = @sql + ' SET @Company=''' + @Company + ''''
		END	
	SET @sql = @sql + ' SELECT [Contact_ID]
			  ,[Cust_ID]
			  ,[Last_Name_Ship]
			  ,[First_Name_Ship]
			  ,[Email_Ship]
			  ,[Phone_Ship]
			  ,[Fax_Ship]
			  ,[Address1_Ship]
			  ,[Address2_Ship]
			  ,[City_Ship]
			  ,[State_Ship]
			  ,[Country_Ship]
			  ,[Zip_Ship]
			  ,[Is_active01]
			  ,[Created_By]
			  ,[Create_Date]
			  ,[Edited_By]
			  ,[Edit_Date]
			  ,[Notes]
		  FROM [dbo].[ICE_Contacts] 
		  WHERE (1=1)'
	--Add parameters
	IF @Contact_ID > 0
		SET @sql = @sql + ' AND Contact_ID=@Contact_ID'
	IF @Cust_ID > 0
		SET @sql = @sql + ' AND Cust_ID=@Cust_ID'
	IF len(ISNULL(@First_Name,'')) > 0 
		SET @sql = @sql + ' AND First_Name_Ship like ''%'' + @First_Name + ''%'''
	IF len(ISNULL(@Last_Name,'')) > 0 
		SET @sql = @sql + ' AND Last_Name_Ship like ''%'' + @Last_Name + ''%'''
	IF len(ISNULL(@Email,'')) > 0 
		SET @sql = @sql + ' AND Email_Ship like ''%'' + @Email + ''%'''	
	IF len(ISNULL(@Company,'')) > 0 
		SET @sql = @sql + ' AND Cust_ID IN (SELECT C.Cust_ID FROM ICE_Customers C WHERE Company like ''%'' + @Company + ''%''' + ')'
		
	--If there are no params then create select statement that will not retrun any rows 
	IF @hasParam = 0
		SET @sql = 'SELECT * FROM ICE_Contacts WHERE Contact_ID < 0'	
	--Execute query	
	print @sql
	EXECUTE sp_executesql @sql
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Contacts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Contacts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Contacts]
	TO [davor.dumeljic]
GO
