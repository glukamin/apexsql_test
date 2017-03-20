SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/12/2007
-- Description: Returns templatecount for the approved templates for outputtypes or applicationtypes 
-- =============================================
CREATE FUNCTION [dbo].[OTL_GetApprovedTemplateCount] 
(
@Id int,		--OutputTypeId or ApplicatioTypeId 
@Type nvarchar(2)   --  O=  To select OutputTyeps     ,      A= To select ApplicationTypes
)
RETURNS INT
 AS  
		BEGIN 
				DECLARE @count int

				IF @Type='O'  -- get approved template count depending on  the outputtypes
					BEGIN
						SELECT @count=ISNULL(COUNT(dbo.OTL_Templates.Id),0) FROM dbo.OTL_Templates WHERE dbo.OTL_Templates.OutputTypeId=@Id AND Status=1
					END

				IF @Type='A'  -- get approved template count depending on  the Applicationtypes
					BEGIN
						SELECT @count=ISNULL(COUNT(dbo.OTL_Templates.Id),0) FROM dbo.OTL_Templates WHERE dbo.OTL_Templates.ApplicationTypeId=@Id AND Status=1
					END
				
				IF @Type='U' ---get approved template uploaded by user to show in user info
					BEGIN
						SELECT @count=ISNULL(COUNT(dbo.OTL_Templates.Id),0) FROM dbo.OTL_Templates WHERE dbo.OTL_Templates.UserId=@Id AND Status=1
					END
					
			RETURN @count
		END





GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApprovedTemplateCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApprovedTemplateCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApprovedTemplateCount]
	TO [davor.dumeljic]
GO
