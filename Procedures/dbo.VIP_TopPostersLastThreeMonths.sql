SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TopPostersLastThreeMonths]
	@Count int 
AS
BEGIN
	DECLARE @StrSQL nvarchar(max)
	IF @Count is null OR @Count < 1 
		SET @Count = 10
	SET @StrSQL = 'DECLARE @Date datetime
				   SET @Date = dbo.VIP_DateSubstract(GETDATE(),0,3,0)
				   SELECT TOP X * FROM dbo.VIP_GetTopPosters(@Date) ORDER BY Posts DESC'
	SET @StrSQL = REPLACE(@StrSQL, 'X', CONVERT(varchar, @Count))
	EXEC sp_executesql @StrSQL
	
END



GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPostersLastThreeMonths]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPostersLastThreeMonths]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopPostersLastThreeMonths]
	TO [davor.dumeljic]
GO
