SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Resellers]
(
	  @IS_Var  varchar(100) = '',
      @Company varchar(100) = '',
      @First_Name varchar(100) = '',
      @Last_Name varchar(100) = '',
      @Email varchar(100) = '',
      @Country_Discount float = 0,
      @Discount float = 0,
      @Country varchar(100) = '',
      @StartDate datetime,
      @EndDate datetime 
)
AS
BEGIN
      DECLARE @hasParam bit
      SET @hasParam = 0
      DECLARE @sql nvarchar(4000)
      SET @sql = ''
      --Declare parameters. We do this to prevent sql injections
      IF len(ISNULL(@IS_Var,'')) > 0
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @IS_Var varchar(100)'
            SET @sql = @sql + ' SET @IS_Var=''' + @IS_Var + ''''
            END
      IF len(ISNULL(@Company,'')) > 0
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @Company varchar(100)'
            SET @sql = @sql + ' SET @Company=''' + @Company + ''''
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
      IF @Country_Discount > 0
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @Country_Discount float'
            SET @sql = @sql + ' SET @Country_Discount=' + CONVERT(varchar(10),@Country_Discount)
            END
      IF @Discount > 0
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @Discount float'
            SET @sql = @sql + ' SET @Discount=' + CONVERT(varchar(10),@Discount)
            END
      IF len(ISNULL(@Country,'')) > 0
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @Country varchar(100)'
            SET @sql = @sql + ' SET @Country=''' + @Country + ''''
            END
      IF (ISNULL(@StartDate,'01/01/1900')) > '01/01/1901'
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @StartDate datetime'
            SET @sql = @sql + ' SET @StartDate=''' + CONVERT(varchar(25), @StartDate) + ''''
            END
      IF (ISNULL(@EndDate,'01/01/1900')) > '01/01/1901'
            BEGIN
            SET @hasParam = 1
            SET @sql = @sql + ' DECLARE @EndDate datetime'
            SET @sql = @sql + ' SET @EndDate=''' + CONVERT(varchar(25), @EndDate) + ''''
            END
            
      
      SET @sql = @sql + ' SELECT [IS_Var]
      ,[First_Name]
      ,[Last_Name]
      ,[Email]
      ,[Company]
      ,[Phone]
      ,[Fax]
      ,[Address1]
      ,[Address2]
      ,[City]
      ,[State]
      ,[Country]
      ,[Zip]
      ,[Discount]
      ,[Country_Discount]
      ,[Reseller_ShareIt_ID]
      ,[Reseller_ID]
      ,[Agent_Email]
      ,[Created_By]
      ,[Create_Date]
      ,[Edited_By]
      ,[Edit_Date]
      ,[Password]
      ,[Allow]
  FROM [dbo].[ICE_Resellers] 
              WHERE (1=1)'
      --Add parameters
      IF LEN(ISNULL(@IS_Var,'')) > 0     
            SET @sql = @sql + ' AND IS_Var like @IS_Var + ''%'''
      IF LEN(ISNULL(@Company,'')) > 0     
            SET @sql = @sql + ' AND Company like @Company + ''%'''
      IF LEN(ISNULL(@First_Name,'')) > 0
            SET @sql = @sql + ' AND First_Name like @First_Name + ''%'''
      IF LEN(ISNULL(@Last_Name,'')) > 0
            SET @sql = @sql + ' AND Last_Name like @Last_Name + ''%'''
      IF LEN(ISNULL(@Email,'')) > 0
            SET @sql = @sql + ' AND Email like ''%'' + @Email + ''%'''
      IF LEN(ISNULL(@Country,'')) > 0
            SET @sql = @sql + ' AND Country like @Country + ''%'''            
      IF @Discount > 0
            SET @sql = @sql + ' AND Discount=@Discount'        
      IF @Country_Discount > 0
            SET @sql = @sql + ' AND Country_Discount=@Country_Discount'
      IF @StartDate > 0
            SET @sql = @sql + ' AND Create_Date >= @StartDate'
      IF @EndDate > 0
            SET @sql = @sql + ' AND Create_Date <= @EndDate'
            
      --If there are no params then create select statement that will not retrun any rows 
      IF @hasParam = 0
            SET @sql = 'SELECT * FROM ICE_Resellers WHERE Reseller_ID < 0'    
      --Execute query   
      print @sql
      EXECUTE sp_executesql @sql
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Resellers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Resellers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Resellers]
	TO [davor.dumeljic]
GO
