SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LawLibrary_Rulebases_GetByFiltersCollection]
(     
      /*
      Sample accepted @FiltersDataXml:
      <FiltersCollection BusinessEntityType="Rulebase" KeywordFilter="Some Keyword">
            <MultiSelectionFilter BusinessEntityType="User"><Item RowId="131" /></MultiSelectionFilter>
            <MultiSelectionFilter BusinessEntityType="RulebaseStatus"><Item RowId="1" /></MultiSelectionFilter>
      </FiltersCollection>
      */

      @FiltersDataXml ntext = null,
      @OrderBy varchar(50) = 'Id',
      @OrderHow varchar(10)  = 'DESC', -- 'ASC|DESC'
      @PageNumber bigint = -1,      
      @RecordsPerPage bigint = -1
)
AS
    SET NOCOUNT ON

    -- Create an xml document pointer for the input FiltersCollection xml node            
	DECLARE @hDoc int 
	EXEC sp_xml_preparedocument @hDoc OUTPUT, @FiltersDataXml

	-- Create a temporary table to store all results
	CREATE TABLE #TempItems
	(
		IndexNumber int IDENTITY,
		Id numeric,
		Name nvarchar(1000),
		FileName varchar(300),
		UserId int,
		UserName varchar(100),
		AuthorName varchar(100),
		RuleCount int,
		DownloadCount int,
		ViewCount int,
		DateLoaded datetime,
		DateUpdated datetime,
		Status int
	)

	INSERT INTO #TempItems 
	(
		Id,
		UserId,
		Name,
		UserName,
		AuthorName,
		FileName,
		RuleCount,
		DownloadCount,
		ViewCount,
		DateLoaded,
		DateUpdated,
		Status 
	)

	SELECT
		Id = R.Id,
		UserId = R.UserId,
		Name = RTrim(R.Name),
		UserName = A.Username,
		AuthorName = R.AuthorName,
		FileName = RTrim(R.FileName),
		RuleCount = R.RulesCount,
		DownloadCount = R.Downloads,
		ViewCount = R.Views,
		DateLoaded = R.DateLoaded,
		DateUpdated = R.DateUpdated,
		Status = R.Status
       
	FROM	
		LawLibrary_Rulebases AS R JOIN
		tblAuthor AS A ON R.UserId = A.Author_ID					              
        
	WHERE
		dbo.LawLibrary_IsRowIdFoundInXmlAttributes(RTrim(R.UserId), @hDoc, 'User') = 1 AND
		dbo.LawLibrary_IsRowIdFoundInXmlAttributes(RTrim(R.Status), @hDoc, 'RulebaseStatus') = 1 
   
   
	DECLARE @MoreRecords varchar(1000)
	DECLARE @RangeConditions varchar(1000)
	DECLARE @SqlString varchar(8000)
	  
	IF (@PageNumber = -1 OR @RecordsPerPage = -1)
	BEGIN
		SET @MoreRecords = ''
		SET @RangeConditions = ''     
	END	
	ELSE
	BEGIN
		-- Find out the first and last record we want
		DECLARE @FirstRec int, @LastRec int
		SET @FirstRec = (@PageNumber - 1) * @RecordsPerPage
		SET @LastRec = (@PageNumber * @RecordsPerPage + 1)

		SET @MoreRecords = ', MoreRecords = (SELECT COUNT(*) FROM #TempItems TI  WHERE TI.IndexNumber >= ' + CONVERT(VARCHAR(9), @LastRec) + ')'
		SET @RangeConditions = 'WHERE IndexNumber > ' + RTRim(@FirstRec) + ' AND IndexNumber < ' + RTrIm(@LastRec)
	END

	  -- Now, return the set of paged records, plus, an indication if we
	  -- have more records or not

	SET @SqlString = 'SELECT
		Id,
		Name,
		FileName,
		UserId,
		UserName,
		AuthorName,
		RuleCount,
		DownloadCount,
		ViewCount,
		DateLoaded,
		DateUpdated,
		Status 
		' + @MoreRecords + ' 
		FROM #TempItems TI	
		' + @RangeConditions + ' ORDER BY TI.' + @OrderBy + ' ' + @OrderHow 

      EXEC(@SqlString)
      EXEC sp_xml_removedocument @hDoc

      SET NOCOUNT OFF

RETURN


GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetByFiltersCollection]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetByFiltersCollection]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Rulebases_GetByFiltersCollection]
	TO [davor.dumeljic]
GO
