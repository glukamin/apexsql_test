SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Rulebases_UpdateDownloadCount]
(
	@Id int
)
 AS
	BEGIN
	
		/*
		Increments the Download Count of the rulebase matching the input @Id by 1.
		*/
	
		UPDATE 
			LawLibrary_Rulebases 
		SET 
			Downloads = ISNULL(Downloads, 0) + 1 		
		WHERE 
			Id = @Id	
	END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateDownloadCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateDownloadCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateDownloadCount]
	TO [davor.dumeljic]
GO
