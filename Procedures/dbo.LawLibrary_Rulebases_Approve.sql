SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[LawLibrary_Rulebases_Approve] 
(
	@Id int
)
AS

/*
Changes the status of a rulebase to 'Approved'.
*/

BEGIN 

	UPDATE 
		LawLibrary_Rulebases 
	
	SET 
		Status = 1 
	
	WHERE 
		Id = @Id
END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Approve]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Approve]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Approve]
	TO [davor.dumeljic]
GO
