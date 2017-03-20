SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ICE_GetPOI] (@Download_ID int)
returns varchar(500)
as
Begin
declare @Result varchar(500)
set @Result = ''
Declare @Product_ID int
DECLARE CurPOI CURSOR FOR SELECT Product_ID FROM ICE_Download_Details where ICE_Download_Details.Download_ID = @Download_ID 
OPEN CurPOI
FETCH NEXT FROM CurPOI INTO @Product_ID
WHILE @@FETCH_STATUS = 0
BEGIN
	set @Result = @Result + '    ' + (select Product_Name from ICE_Products where ICE_Products.Product_ID = @Product_ID)	
	FETCH NEXT FROM CurPOI INTO @Product_ID
END
CLOSE CurPOI
DEALLOCATE CurPOI

return @Result
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetPOI]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetPOI]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetPOI]
	TO [davor.dumeljic]
GO
