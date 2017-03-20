SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[Forum_GetLastMessage]
(
      @Topic_ID int,
      @MaxLenght int 
)
RETURNS nvarchar(max)
AS
BEGIN
      DECLARE @result nvarchar(max)
      SET @result = ( SELECT Top 1 CONVERT(nvarchar(max), T.[Message])
                      FROM
                          tblThread T
                      WHERE
                          T.Topic_ID = @Topic_ID
                      ORDER BY T.Message_Date DESC
                     )      
      SET @result = CASE 
						WHEN LEN(@result) > @MaxLenght THEN SUBSTRING(@result, 1, @MaxLenght)
						ELSE @result
					END
      RETURN @result
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetLastMessage]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetLastMessage]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetLastMessage]
	TO [davor.dumeljic]
GO
