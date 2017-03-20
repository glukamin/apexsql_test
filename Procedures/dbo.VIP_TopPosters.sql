SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TopPosters]
	@Count int,
	@From datetime 
AS
BEGIN
	DECLARE @StrSQL nvarchar(max)
	IF @Count is null OR @Count < 1 
		SET @Count = 10
	SET @StrSQL = 'DECLARE @Date datetime
				   SET @Date = ''' + CONVERT(varchar(100), ISNULL(@From, GETDATE())) + '''' +
				   'SELECT TOP X * FROM dbo.VIP_GetTopPosters(@Date) ORDER BY Posts DESC'
	SET @StrSQL = REPLACE(@StrSQL, 'X', CONVERT(varchar, @Count))
	EXEC sp_executesql @StrSQL
	
END



GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPosters]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPosters]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPosters]
	TO [davor.dumeljic]
GO
