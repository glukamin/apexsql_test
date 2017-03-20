SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Rulebases_UpdateViewCount]
(
	@Id int
)
 AS
	BEGIN
	
		/*
		Increments the View Count of the rulebase matching the input @Id by 1.
		*/
	
		UPDATE 
			LawLibrary_Rulebases 
		SET 
			Views = ISNULL(Views, 0) + 1 		
		WHERE 
			Id = @Id	
	END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateViewCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateViewCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_UpdateViewCount]
	TO [davor.dumeljic]
GO
