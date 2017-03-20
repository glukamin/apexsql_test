SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Rulebases_CheckByUser]
	@Id int,
	@UserId int,
	@Result bit output
AS	
BEGIN
	
	/*
	Returns true if the Rulebase matching input @Id belongs to user matching input @UserId, or false otherwise. 
	*/
	
	SET NOCOUNT ON
	
	IF(SELECT COUNT(*) FROM LawLibrary_Rulebases WHERE Id = @Id AND UserId = @UserId) = 0
	BEGIN
		SET @Result = 0
	END
	ELSE
	BEGIN
		SET @Result = 1
	END
	
END

GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_CheckByUser]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_CheckByUser]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_CheckByUser]
	TO [davor.dumeljic]
GO
