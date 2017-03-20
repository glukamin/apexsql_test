SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LawLibrary_Rulebases_Upload]
(
	@Mode 			nchar,			-- ["I" | "U"] (insert/update)
    @Id 			numeric,		-- RulebaseId
	@UserId			int,
	@XML			ntext,
	@Name			nvarchar(1000),
	@AuthorName		varchar(300),
	@AuthorCompany	varchar(300),
	@AuthorLegal	varchar(4000),
	@Version		varchar(50),
	@FileName		varchar(300)
)	
AS
	
	SET NOCOUNT ON
	
	DECLARE @iDoc int
	EXEC sp_xml_preparedocument @iDoc output, @XML
	    
    IF @Mode = 'I'        -- Insert mode
	BEGIN
	 
		INSERT INTO LawLibrary_Rulebases
		(
			[UserId],
			[Name],
			[FileName],
		    [Code],
		    [AuthorName],
		    [AuthorCompany],
		    [AuthorLegal],
		    [Version],
		    [RulesCount],
		    [Status],
		    [Downloads],
		    [Views],
		    [DateLoaded],
		    [DateUpdated]
		)
		
	 	SELECT 
			UserId = @UserId,
			Name = @Name,
			FileName = @FileName,
			Code = [Code], 
			AuthorName = @AuthorName,
		    AuthorCompany = @AuthorCompany,
		    AuthorLegal = @AuthorLegal,
		    Version = @Version,
			RulesCount = [RulesCount], 
			Status = 0,  
			Downloads = 0,  
			Views = 0,  
			getdate(),
			getdate()
			
		FROM 
			LawLibrary_Capture_RulebaseXML(@XML, @iDoc)

		EXEC sp_xml_removedocument @iDoc
				
		SELECT Id = @@Identity
		       
	END
	ELSE IF @Mode = 'U' 	--Update mode
    BEGIN
		 
        -- Create a temporary table to store current rulebase data
		CREATE TABLE #TempItems
		(
			[Code] ntext,
			[RulesCount] int
		)
			
		INSERT INTO #TempItems
		(
			[Code],
			[RulesCount]
		)	
	 	SELECT 
	 		Code = [Code], 
			RulesCount = [RulesCount]
			
		FROM 
			LawLibrary_Capture_RulebaseXML(@XML, @iDoc)

		EXEC sp_xml_removedocument @iDoc

		
		
		UPDATE 
			LawLibrary_Rulebases
		SET
			[Name] = @Name,
			[AuthorName] = @AuthorName,
		    [AuthorCompany] = @AuthorCompany,
		    [AuthorLegal] = @AuthorLegal,
		    [Version] = @Version,
			[FileName] = @FileName,
			[UserId] = @UserId,
			[RulesCount] = (SELECT TOP 1 [RulesCount] FROM #TempItems), 
			[Status] = 0,  -- Reset status to Pending
			[DateUpdated] = getdate()
			
		WHERE 
			[Id] = @Id
		
		-- Update [Code] field
		
		DECLARE @destptr binary(16)
		DECLARE @srctptr binary(16)
	
		SELECT TOP 1 @srctptr = TEXTPTR(Code) FROM #TempItems 
		SELECT @destptr = TEXTPTR(Code) FROM LawLibrary_Rulebases WHERE Id = @Id
		UPDATETEXT LawLibrary_Rulebases.Code @destptr 0 null  #TempItems.Code @srctptr
 
		-- Return the Id of the updated rulebase
		SELECT Id = @Id

	END
 
 
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Upload]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Upload]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_Upload]
	TO [davor.dumeljic]
GO
