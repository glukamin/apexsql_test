SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LawLibrary_Rulebases_GetRecent]
AS
BEGIN		

	/*
	Returns a list of recent approved rulebases.
	*/

	SELECT 
		Id,
		UserId, 
		RulesCount,
		Downloads,
		Views,		
		CONVERT(nvarchar(20), DateUpdated,107) as DateUpdated
		
	FROM 
		LawLibrary_Rulebases
		
	WHERE 
		Status = 1
		
	ORDER BY 
		DateUpdated DESC
END

GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetRecent]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetRecent]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetRecent]
	TO [davor.dumeljic]
GO
