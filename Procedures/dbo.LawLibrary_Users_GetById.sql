SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Users_GetById] 
	@Id int	
AS
BEGIN
	/*
	Gets the user matching the input @Id.
	*/

	SET NOCOUNT ON

	SELECT 
		*
		 
	FROM 
		tblAuthor 
		
	WHERE 
		Author_ID = @Id 

END

GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_GetById]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_GetById]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_GetById]
	TO [davor.dumeljic]
GO
