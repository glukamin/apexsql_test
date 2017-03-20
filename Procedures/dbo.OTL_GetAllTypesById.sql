SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Get all Types Details of given Id
-- =============================================
CREATE PROCEDURE [dbo].[OTL_GetAllTypesById]
(
@Id numeric
)
AS
BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		    SET NOCOUNT ON;

		    SELECT ApplicationTypeId,OutputTypeId,LongDesc   FROM OTL_Templates   WHERE Id=@Id
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAllTypesById]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAllTypesById]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAllTypesById]
	TO [davor.dumeljic]
GO
