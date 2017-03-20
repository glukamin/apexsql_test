SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LawLibrary_UpdateDiscussLink]
(
	@Id int,
	@DiscussionLink nvarchar(1000)
)
AS
BEGIN
	UPDATE 
		LawLibrary_Rulebases
	SET 
		DiscussionLink = @DiscussionLink
	WHERE 
		Id = @Id
END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_UpdateDiscussLink]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_UpdateDiscussLink]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_UpdateDiscussLink]
	TO [davor.dumeljic]
GO
