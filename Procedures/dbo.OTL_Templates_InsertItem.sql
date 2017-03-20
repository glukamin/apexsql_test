SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[OTL_Templates_InsertItem]
(
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
	@LinesCount int,	
	@Id int OUT    
)
AS
BEGIN
	SET NOCOUNT ON
	 
	INSERT INTO OTL_Templates 
	(
		[UserId],
		[TemplateFileName],
		[ArchiveFileName],
		[ProjectTypeId],
		[DatabaseTypeId],
		[OutputTypeId],
		[ApplicationTypeId],
		[Title],
		[ShortDesc],
		[LongDesc],
		[Copyright],
		[ScriptLanguage],
		[OutputLanguage],
		[LinesCount],
		[DateLoaded],
		[DateUpdated],
		[Status] 
	)
	VALUES
	(
		@UserId, 
		@TemplateFileName,
		@ArchiveFileName,
		@ProjectTypeId,
		@DatabaseTypeId, 
		@OutputTypeId, 
		@ApplicationTypeId, 
		@Title,
		@ShortDesc,
		@LongDesc,
		@Copyright,
		@ScriptLanguage,
		@OutputLanguage,
		@LinesCount,
		getdate(),
		getdate(),
		0
	)
	
	SET @Id = @@IDENTITY
	
END 	 
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_InsertItem]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_InsertItem]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_InsertItem]
	TO [davor.dumeljic]
GO
