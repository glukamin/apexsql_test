SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LawLibrary_Rulebases_DeleteById]
	@RulebaseId int,
	@UserId		int
AS
BEGIN

	/*
	Deletes the rulebase matching the input @RulebaseId.	
	*/

	DELETE FROM 
		LawLibrary_Rulebases 
	
	WHERE 
		Id = @RulebaseId AND
		UserId = @UserId

END

GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_DeleteById]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_DeleteById]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_DeleteById]
	TO [davor.dumeljic]
GO
