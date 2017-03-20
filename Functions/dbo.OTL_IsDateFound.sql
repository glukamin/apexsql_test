SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/01/2007
-- Description: Returns 0 or 1 on the basis of record found or not
-- =============================================
CREATE FUNCTION [dbo].[OTL_IsDateFound]
(
	@HDoc int, 
	@BusinessEntityType varchar(100),
	@TodaysDate datetime,
	@DateLoaded datetime
	/*	
	XML Node pointer. Sample accepted format:
	<FiltersCollection BusinessEntityType="User" KeywordFilter="somw">
		<MultiSelectionFilter BusinessEntityType="User"><Item RowId="131" /></MultiSelectionFilter>
		<MultiSelectionFilter BusinessEntityType="UserGroup"><Item RowId="131" /></MultiSelectionFilter>
	</FiltersCollection>
	*/

)
RETURNS BIT
AS
BEGIN
	 
	-- If no Item nodes are found inside the respective MultiSelectionFilter node, return True:
	
	    	IF (
			SELECT COUNT(*)     
			FROM 
				OPENXML(@hdoc, '/FiltersCollection/MultiSelectionFilter/Item', 1) 
			WITH 
				(
					BusinessEntityType VARCHAR(100) '../@BusinessEntityType' 
				)

			WHERE  BusinessEntityType = @BusinessEntityType 
 	                 ) = 0 
	BEGIN
		RETURN 1
	END 	
			
    
    -- If there's at least one match for @RowId in the Item subnodes, return True
	
 
	IF
	( 		
		SELECT      
		    COUNT(RowId)
		FROM 
		    OPENXML(@hdoc, '/FiltersCollection/MultiSelectionFilter/Item', 1) 
		WITH 
			(
				RowId				VARCHAR(10),
				BusinessEntityType	VARCHAR(100) '../@BusinessEntityType' 
			)
		WHERE
			  BusinessEntityType = @BusinessEntityType AND
			  LTRIM(RTRIM(RowId))='LastWeek'
	) > 0
	BEGIN
		DECLARE @WDiff  int
		SELECT @WDiff=DATEDIFF(day,@DateLoaded,@TodaysDate)
		IF(@WDiff<=7)
			RETURN 1
		ELSE
			RETURN 0

	END
	
	IF
	( 		
		SELECT      
		    COUNT(RowId)
		FROM 
		    OPENXML(@hdoc, '/FiltersCollection/MultiSelectionFilter/Item', 1) 
		WITH 
			(
				RowId				VARCHAR(10),
				BusinessEntityType	VARCHAR(100) '../@BusinessEntityType' 
			)
		WHERE
			  BusinessEntityType = @BusinessEntityType  AND
			 LTRIM(RTRIM(RowId))='LastMonth'
	) > 0
	BEGIN
		DECLARE @MDiff  int
		SELECT @MDiff=DATEDIFF(day,@DateLoaded,@TodaysDate)
		IF(@MDiff<=31)
			RETURN 1
		ELSE
			RETURN 0
		
		-- to search templates in the last month
		/*DECLARE @TemplateMonth int
		DECLARE @TemplateYear int
		
		DECLARE @CurrentMonth int
		DECLARE @CurrentYear int

		SELECT @TemplateMonth=DATEPART(month,@DateLoaded)
		SELECT @TemplateYear=DATEPART(year,@DateLoaded)

		SELECT @CurrentMonth=DATEPART(month,@TodaysDate)
		SELECT @CurrentYear=DATEPART(year,@TodaysDate)

		IF(@CurrentMonth>1)
			BEGIN
				SET @CurrentMonth=@CurrentMonth-1
				IF(@TemplateMonth=@CurrentMonth)
					RETURN 1
				ELSE
					RETURN 0
			END	
		ELSE
			BEGIN
				SET @CurrentYear=@CurrentYear-1
				SET @CurrentMonth=12
				IF(@TemplateYear=@CurrentYear AND @TemplateMonth=@CurrentMonth)
					RETURN 1
				ELSE
					RETURN 0
			END*/
		



	END
	
	-- No matches found, return 0
	
	RETURN 0
END













GO
GRANT EXECUTE
	ON [dbo].[OTL_IsDateFound]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsDateFound]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsDateFound]
	TO [davor.dumeljic]
GO
