SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.ICE_GetWebPageScore
(
	@WebPage nvarchar(100)
)
RETURNS INT
AS
BEGIN
	
    DECLARE @Result int
    SET @Result = 0

    -- Handle special cases first
    IF @WebPage IS NULL
	   RETURN @Result
    IF @WebPage = ''
	   RETURN @Result

    -- Try to get page score if it exits in the scoring table
    SET @Result =  (SELECT Group_Score 
				FROM ICE_Web_Page_Groups 
				WHERE Page_Group_ID = (SELECT TOP 1 Page_Group_ID FROM ICE_Web_Pages WHERE @WebPage like '%' + Page_Path + '%'))
    
    --If page is not found then default page score is 1
    IF @Result IS NULL
	   SET @Result = 1

	RETURN @Result

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetWebPageScore]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetWebPageScore]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetWebPageScore]
	TO [davor.dumeljic]
GO
