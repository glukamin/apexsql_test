SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[OTL_UpdateDiscussLink]
(
	@Id int,
	@DiscussionLink nvarchar(1000)
)
AS
BEGIN
	UPDATE 
		OTL_Templates 
	SET 
		DiscussionLink = @DiscussionLink
	WHERE 
		Id = @Id
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateDiscussLink]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateDiscussLink]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateDiscussLink]
	TO [davor.dumeljic]
GO
