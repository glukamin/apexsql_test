SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/03/2007
-- Description: checks the rating across the user
-- =============================================
CREATE FUNCTION [dbo].[OTL_IsRatingFound]
/*
Parses the @hDoc XML Document pointer below. Looks for the passed 
@RowId in the Item > RowId attributes inside the MultiSelectionFilter
matched by the @BusinessEntityType value.

Returns TRUE if no item subnodes are found in the respective MultiSelectionFilter node or if an
item subnode with matching RowId is found.

Returns False otherwise.
*/
(
	@Rating float,
	@HDoc int, 
	@BusinessEntityType varchar(100)
	
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
					BusinessEntityType	VARCHAR(100) '../@BusinessEntityType' 
				)
			WHERE
				  BusinessEntityType = @BusinessEntityType 
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
			 CAST( LTRIM(RTRIM(RowId)) as float)<=@Rating
			
 
			
	) > 0
	BEGIN
		RETURN 1
	END
	
	-- No matches found, return False
	
	RETURN 0
END




















GO
GRANT EXECUTE
	ON [dbo].[OTL_IsRatingFound]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsRatingFound]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsRatingFound]
	TO [davor.dumeljic]
GO
