SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[OTL_Templates_UpdateItem]
(
	@Id int, 
	@UserId int,
	@TemplateFileName varchar(300),
	@ArchiveFileName varchar(300),
	@ProjectTypeId int,
	@DatabaseTypeId	int,
	@OutputTypeId int,
	@ApplicationTypeId int,
	@Title nvarchar(500),
	@ShortDesc nvarchar(500),
	@LongDesc nvarchar(500),
	@Copyright nvarchar(500),
	@ScriptLanguage nvarchar(100),
	@OutputLanguage nvarchar(100),
	@LinesCount int    
)
AS
BEGIN
	SET NOCOUNT ON
	 
	UPDATE 
		OTL_Templates 
	SET
		[TemplateFileName] = @TemplateFileName,
		[ArchiveFileName] = @ArchiveFileName,
		[ProjectTypeId] = @ProjectTypeId,
		[DatabaseTypeId] = @DatabaseTypeId,
		[OutputTypeId] = @OutputTypeId,
		[ApplicationTypeId] = @ApplicationTypeId,
		[Title] = @Title,
		[ShortDesc] = @ShortDesc,
		[LongDesc] = @LongDesc,
		[Copyright] = @Copyright,
		[ScriptLanguage] = @ScriptLanguage,
		[OutputLanguage] = @OutputLanguage,
		[LinesCount] = @LinesCount,
		[DateUpdated] = getdate(),
		[Status] = 0
	WHERE
		[Id] = @Id AND
		[UserId] = @UserId
END 	 
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_UpdateItem]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_UpdateItem]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_UpdateItem]
	TO [davor.dumeljic]
GO
