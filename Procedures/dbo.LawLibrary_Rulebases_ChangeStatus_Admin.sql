SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Rulebases_ChangeStatus_Admin] 
(
	@Id int,
	@Status int
)
AS

/*
Changes the status of a rulebase.
*/

BEGIN 

	UPDATE 
		LawLibrary_Rulebases 
	
	SET 
		Status = @Status 
	
	WHERE 
		Id = @Id
END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_ChangeStatus_Admin]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_ChangeStatus_Admin]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_ChangeStatus_Admin]
	TO [davor.dumeljic]
GO
