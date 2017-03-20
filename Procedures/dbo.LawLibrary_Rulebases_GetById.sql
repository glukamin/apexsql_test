SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LawLibrary_Rulebases_GetById]
	@Id int
AS	
BEGIN
	
	/*
	Gets the rulebase matching the input @Id.
	*/
	
	SET NOCOUNT ON
	
	SELECT 
		Id = R.Id,
		Name = R.Name,
		FileName = R.FileName,
		UserId = R.UserId,
		Version = R.Version,
		Author = A.UserName,
		AuthorName = R.AuthorName,
		AuthorCompany = R.AuthorCompany,
		AuthorLegal = R.AuthorLegal,
		Code = R.Code,
		Rules = R.RulesCount,
		Status = R.Status,
		Downloads = R.Downloads,
		Views = R.Views,
		DateLoaded = R.DateLoaded,
		DateUpdated = R.DateUpdated,
		DiscussionLink = RTrim(R.DiscussionLink)
		 
	FROM 
		LawLibrary_Rulebases AS R JOIN
		tblAuthor A ON R.UserId = A.Author_ID
	
	WHERE
		Id = @Id	
		
END
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetById]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetById]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetById]
	TO [davor.dumeljic]
GO
