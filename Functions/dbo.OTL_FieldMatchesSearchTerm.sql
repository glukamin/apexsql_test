SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[OTL_FieldMatchesSearchTerm]
/*
Returns TRUE if an empty search term is passed or if the field contains the search term.
Returns False otherwise.
*/
(
	@FieldValue varchar(8000),	
	@SearchTerm varchar(8000)
)
RETURNS BIT
AS
BEGIN
	 
	-- If an empty search term is passed, return True:
	
	IF (LTRIM(RTRIM(@SearchTerm)) = '')	
	BEGIN
		RETURN 1
	END 	
			
    
    -- If the field contains the search term, return True	
 
	IF CHARINDEX(@SearchTerm, @FieldValue) > 0
	BEGIN
		RETURN 1
	END
	
	-- No matches found, return False
	
	RETURN 0
END




GO
GRANT EXECUTE
	ON [dbo].[OTL_FieldMatchesSearchTerm]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_FieldMatchesSearchTerm]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_FieldMatchesSearchTerm]
	TO [davor.dumeljic]
GO
