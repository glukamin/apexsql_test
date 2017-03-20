SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	/*Returns a set of records that match the passed filters collection.*/  
-- =============================================
CREATE   PROCEDURE [dbo].[OTL_Templates_GetByFiltersCollection]
(     
      /*SAMPLE:
      <FiltersCollection BusinessEntityType="User" KeywordFilter="Some Keyword">
            <MultiSelectionFilter BusinessEntityType="User"><Item RowId="131" /></MultiSelectionFilter>
            <MultiSelectionFilter BusinessEntityType="UserGroup"><Item RowId="1" /></MultiSelectionFilter>
            <MultiSelectionFilter BusinessEntityType="Category"><Item RowId="1" /></MultiSelectionFilter>
      </FiltersCollection>
      */

      @FiltersDataXml   ntext = null,
      @OrderBy varchar(50) = 'Id',
      @OrderHow varchar(10)  = 'DESC', -- 'ASC|DESC'
      @PageNumber bigint = -1,      
      @RecordsPerPage bigint = -1,
      @StatusType nvarchar(2)
     
)
AS
SET NOCOUNT ON
 
     -- Create an xml document pointer for the input FiltersCollection xml node            
      DECLARE @hDoc int 
     	 exec sp_xml_preparedocument @hDoc OUTPUT, @FiltersDataXml

      -- Extract the value of the KeywordFilter attribute from the input FiltersCollection xml node    
      DECLARE @SearchTerm nvarchar(1000)
     	  SET @SearchTerm = (SELECT KeywordFilter FROM OPENXML(@hdoc, '/FiltersCollection', 1) WITH (KeywordFilter VARCHAR(1000))) 
	  
	  -- Extract the value of the KeywordFilter attribute from the input FiltersCollection xml node    
      DECLARE @SubmittedIn varchar(1000) -- ["LastWeek" | "LastMonth"] 
     	  SET @SubmittedIn = (SELECT RowId FROM OPENXML(@hdoc, '/FiltersCollection/MultiSelectionFilter/Item', 1) WITH (RowId VARCHAR(1000))) 
	 PRINT @SubmittedIn
      -- Create a temporary table to store all results

      CREATE TABLE #TempItems
      (
            IndexNumber int IDENTITY,
            Id numeric,
            UserId int,
            OutputTypeId int,
            ApplicationTypeId int,
            Title varchar(500),
            ShortDesc nvarchar(500),
            LongDesc nvarchar(500),
            Copyright nvarchar(500),
            ScriptLanguage varchar(100),
            OutputLanguage nvarchar(100),
            DownloadCount int,
            ViewCount int,
            LinesCount int,
            DateLoaded datetime,
            DateUpdated datetime,
            Status bit,
            ApplicationName nvarchar(100),
            CategoryName nvarchar(100),
            Poster nvarchar(100),
			DiscussionLink nvarchar(1000),
			ProjectTypeId int
      )

      INSERT INTO #TempItems 
      (
		Id,
		UserId,
		OutputTypeId,
		ApplicationTypeId,
		Title,
		ShortDesc,
		LongDesc,
		Copyright,
		ScriptLanguage,
		OutputLanguage,
		DownloadCount,
		ViewCount,
		LinesCount,
		DateLoaded,
		DateUpdated,
		Status,
		ApplicationName,
		CategoryName,
		Poster,
		DiscussionLink,
		ProjectTypeId
      )

      SELECT 

		Id = T.Id,
		UserId=T.UserId,
		OutputTypeId=T.OutputTypeId,
		ApplicationTypeId=T.ApplicationTypeId,
		Title = T.Title,
		ShortDesc=T.ShortDesc,
		LongDesc=T.LongDesc,
		Copyright=T.Copyright,
		ScriptLanguage = T.ScriptLanguage,
		OutputLanguage=T.OutputLanguage,
		DownloadCount=T.DownloadCount,
		ViewCount=T.ViewCount,
		LinesCount=T.LinesCount,
		DateLoaded = T.DateLoaded,
		DateUpdated=T.DateUpdated,
		Status = T.Status,
		ApplicationName=T.ApplicationName,
		CategoryName=T.CategoryName,
		Poster=T.Poster,
		DiscussionLink = T.DiscussionLink,
		ProjectTypeId = T.ProjectTypeId
       
      FROM	
             uv_OTL_TemplateDetails  T                    
        
      WHERE
		(
			dbo.OTL_FieldMatchesSearchTerm(T.Title,    @SearchTerm) = 1 OR
			dbo.OTL_FieldMatchesSearchTerm(T.ShortDesc,   @SearchTerm) = 1 OR
			dbo.OTL_FieldMatchesSearchTerm(T.LongDesc,    @SearchTerm) = 1 OR
			dbo.OTL_FieldMatchesSearchTerm(T.Copyright,    @SearchTerm) = 1 OR
			dbo.OTL_FieldMatchesSearchTerm(T.ScriptLanguage, @SearchTerm) = 1 OR  
			dbo.OTL_FieldMatchesSearchTerm(T.OutputLanguage,    @SearchTerm) = 1 OR
			T.Poster LIKE '%'+@SearchTerm+'%'
		) 

		AND dbo.OTL_IsRowIdFoundInXmlAttributes(RTrim(T.UserId), @hDoc, 'Users') = 1
		AND dbo.OTL_IsRowIdFoundInXmlAttributes(RTrim(T.OutputTypeId), @hDoc, 'OutputTypes') = 1
		AND dbo.OTL_IsRowIdFoundInXmlAttributes(RTrim(T.ApplicationTypeId), @hDoc, 'ApplicationTypes') = 1
		AND 
		 (
			CASE 
				WHEN @SubmittedIn = 'LastWeek' THEN
							CASE WHEN DATEDIFF(wk, T.DateUpdated, GetDate()) <= 1 THEN 'MatchesInterval'
							ELSE ''
							END
				WHEN @SubmittedIn = 'LastMonth' THEN
							CASE WHEN DATEDIFF(mm, T.DateUpdated, GetDate()) <= 1 THEN 'MatchesInterval'
							ELSE ''
							END
				ELSE
					'MatchesInterval'
			END
			) = 'MatchesInterval'
		AND dbo.OTL_IsRowIdFoundInXmlAttributes(RTrim(T.OutputLanguage), @hDoc, 'OutputLanguages') = 1
		AND dbo.OTL_IsRowIdFoundInXmlAttributes(RTrim(T.ScriptLanguage), @hDoc, 'Templates') = 1
             
 
		DECLARE @dbgTtl int
		SET @dbgTtl = (SELECT COUNT(*) FROM #TempItems)
		PRINT 'Total in #TempItems: ' + RTrim(@dbgTtl)   
	
		DECLARE @MoreRecords varchar(1000)
		DECLARE @RangeConditions varchar(1000)
		DECLARE @SqlString varchar(8000)
	  
		IF (@PageNumber = -1 OR @RecordsPerPage = -1)
		BEGIN
			SET @MoreRecords = ''
			SET @RangeConditions = 'WHERE 1 > 0 '     
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
       
		IF(@StatusType='MY')			-- checks for the all templates
		BEGIN
	     		         SET @SqlString = 'SELECT
						             DISTINCT( Id),
						             UserId,
							OutputTypeId,
							ApplicationTypeId,
							Title,
							ShortDesc,
							LongDesc,
							Copyright,
							ScriptLanguage,
							OutputLanguage,
						             DownloadCount,
							ViewCount,
							LinesCount,
						             CONVERT(nvarchar(20),DateLoaded,107) as DateLoaded,
							CONVERT(nvarchar(20),DateUpdated,107) as DateUpdated,
						             Status,
						             ApplicationName,
							CategoryName,
							Poster,
							DiscussionLink,
							ProjectTypeId	
		
           							 ' + @MoreRecords + ' 

           							 FROM #TempItems TI	

           							 ' + @RangeConditions + '  ORDER BY TI.' + @OrderBy + ' ' + @OrderHow

		END

		IF(@StatusType='AP')		-- checks for the approved templates
		BEGIN
						 SET @SqlString = 'SELECT
						             DISTINCT( Id),
						             UserId,
							OutputTypeId,
							ApplicationTypeId,
							Title,
							ShortDesc,
							LongDesc,
							Copyright,
							ScriptLanguage,
							OutputLanguage,
						             DownloadCount,
							ViewCount,
							LinesCount,
						             CONVERT(nvarchar(20),DateLoaded,107) as DateLoaded,
							CONVERT(nvarchar(20),DateUpdated,107) as DateUpdated,
						             Status,
						             ApplicationName,
							CategoryName,
							Poster,
							DiscussionLink,
							ProjectTypeId
		
           							 ' + @MoreRecords + ' 

           							 FROM #TempItems TI	
							

           							 ' + @RangeConditions + ' AND Status=1  ORDER BY TI.' + @OrderBy + ' ' + @OrderHow
		END

		IF(@StatusType='NA')		-- checks for the not approved templates
		BEGIN
						 SET @SqlString = 'SELECT
						             DISTINCT( Id),
						             UserId,
							OutputTypeId,
							ApplicationTypeId,
							Title,
							ShortDesc,
							LongDesc,
							Copyright,
							ScriptLanguage,
							OutputLanguage,
						             DownloadCount,
							ViewCount,
							LinesCount,
						             CONVERT(nvarchar(20),DateLoaded,107) as DateLoaded,
							CONVERT(nvarchar(20),DateUpdated,107) as DateUpdated,
						             Status,
						             ApplicationName,
							CategoryName,
							Poster,
							DiscussionLink,
							ProjectTypeId
		
           							 ' + @MoreRecords + ' 

           							 FROM #TempItems TI	
							 

           							 ' + @RangeConditions + '  AND Status=0 ORDER BY TI.' + @OrderBy + ' ' + @OrderHow
		END
		
	

                  
print (@sqlstring)
      EXEC(@SqlString)


      EXEC sp_xml_removedocument @hDoc

      SET NOCOUNT OFF

      RETURN
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByFiltersCollection]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByFiltersCollection]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByFiltersCollection]
	TO [davor.dumeljic]
GO
