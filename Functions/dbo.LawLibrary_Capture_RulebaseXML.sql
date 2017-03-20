SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LawLibrary_Capture_RulebaseXML]
(
	@XML NTEXT,
	@iDoc int 
)
RETURNS @temp_Table table 
(
	[Code]				ntext,
	[RulesCount]		int
) 
AS
BEGIN
	
	/*
	Parses rulebase XML (valid .axrb file contents expected).
	Returns a temp table containing the xml code and the number of rule nodes found in the input xml.
	*/
	
   	DECLARE @RulesCount int  		
	SET @RulesCount	= (SELECT COUNT(*) FROM OPENXML(@idoc, '/') WHERE localname = 'Rule')

	INSERT INTO @temp_Table
	(
		[Code],
		[RulesCount]
	)
	VALUES
	(
		@XML,
		@RulesCount
	)	
		
	RETURN 
END







GO
