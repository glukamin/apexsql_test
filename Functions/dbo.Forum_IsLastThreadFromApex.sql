SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Forum_IsLastThreadFromApex] 
(
	@Topic_ID int
)
RETURNS bit
AS
BEGIN	
	DECLARE @Group_ID int	
	DECLARE @Result bit
	SET @Group_ID = ( SELECT Group_ID
					FROM tblAuthor	
					WHERE Author_ID in (
							SELECT TOP 1 Author_ID 
							FROM tblThread 
							WHERE Topic_ID = @Topic_ID
							ORDER BY Message_Date DESC
							))
	IF (@Group_ID = 4) or (@Group_ID = 5) OR (@Group_ID = 6) OR (@Group_ID = 20) OR (@Group_ID = 21)
		SET @Result = 0
	ELSE
		SET @Result = 1
	RETURN @Result	
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_IsLastThreadFromApex]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_IsLastThreadFromApex]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_IsLastThreadFromApex]
	TO [davor.dumeljic]
GO
