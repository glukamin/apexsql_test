SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE    [dbo].[VIP_TopVips]
(
	@StartDate datetime,
	@Count int
)
AS
BEGIN
	DECLARE @strSQL nvarchar(max) 
	SET @strSQL = 'SELECT TOP ' + CONVERT(varchar, @Count) + ' * FROM dbo.VIP_fn_TopVips(''' + CONVERT(varchar, @StartDate) + ''', NULL)'
	print @strSQL
	EXEC sp_executesql @strSQL
	
END


GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVips]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVips]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVips]
	TO [davor.dumeljic]
GO
