SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/01/2007
-- Description:	Get OutputTypes Details
-- =============================================
CREATE VIEW dbo.uv_OTL_BrowseByCategories
AS	

	SELECT   dbo.OTL_Outputtypes.Id as OutputTypeId, 
		   dbo.OTL_OutputTypes.Name  AS Category,dbo.OTL_GetApprovedTemplateCount( dbo.OTL_Templates.OutputTypeId,'O') as TemplateCount
	
	FROM  	 dbo.OTL_OutputTypes LEFT OUTER JOIN
		 dbo.OTL_Templates ON dbo.OTL_OutputTypes.Id = dbo.OTL_Templates.OutputTypeId
	
	GROUP BY dbo.OTL_Templates.OutputTypeId, dbo.OTL_OutputTypes.Name,dbo.OTL_Outputtypes.Id















GO
