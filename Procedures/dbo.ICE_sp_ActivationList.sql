SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_ActivationList]
AS
BEGIN
SELECT         
T.Product_ID,         
T.Product_Name+' '+CONVERT(VARCHAR, T.Major_Build_Version) as Product_Name 
FROM ( 
	SELECT 
	CONVERT(VARCHAR, ICE_Products.Product_ID)+ '-' +CONVERT(VARCHAR, ISNULL(Default_Major_Build_Version, 2005)) as Product_ID, 
	Product_Name, 
	ISNULL(Default_Major_Build_Version, 2005) AS Major_Build_Version 
	FROM ICE_Products 
	WHERE ISNULL(Is_Private, 0) = 0 And 
	LEN(ISNULL(Unlock_Code_Pattern, '')) > 0 AND 
	LEN(ISNULL(Bundle_Products, '')) = 0 
	UNION 
	SELECT 
	CONVERT(VARCHAR, ICE_Products.Product_ID) + '-' + CONVERT(VARCHAR, ICE_Major_Builds.Major_Build_Version) as Product_ID, 
	ICE_Products.Product_Name, 
	ICE_Major_Builds.Major_Build_Version 
	FROM ICE_Major_Builds 
	INNER JOIN ICE_Products ON ICE_Major_Builds.Product_ID=ICE_Products.Product_ID 
	WHERE ISNULL(ICE_Products.Is_Private, 0) = 0 And 
	LEN(ISNULL(ICE_Products.Unlock_Code_Pattern, '')) > 0 AND 
	LEN(ISNULL(ICE_Products.Bundle_Products, '')) = 0  AND 
	ICE_Major_Builds.Dated <= GETDATE()
	UNION 
	SELECT '300227565-2008' as Product_ID, 'ApexSQL Enforce' as Product_Name, 2008 as Major_Build_Version
	UNION 
	SELECT '300172715-2008' as Product_ID, 'ApexSQL SSIS Compare' as Product_Name, 2008 as Major_Build_Version
     UNION 
	SELECT '211508-2005' as Product_ID, 'ApexSQL Edit' as Product_Name, 2005 as Major_Build_Version
     UNION 
	SELECT '211508-2008' as Product_ID, 'ApexSQL Edit' as Product_Name, 2008 as Major_Build_Version
    UNION 
	SELECT '211508-2011' as Product_ID, 'ApexSQL Edit' as Product_Name, 2011 as Major_Build_Version
	UNION 
	SELECT '300171838-2012' as Product_ID, 'ApexSQL Profile' as Product_Name, 2012 as Major_Build_Version
	)	  T 
WHERE T.Product_ID NOT IN (
	/*ApexSQL Refactor 2008*/'300172712-2008',
	/*ApexSQL Profile 2008*/'300171838-2008',
	/*ApexSQL Recover 2005*/'300100681-2005',	
	/*ApexSQL Enforce 2008*/ '300227565-2008',
	/*ApexSQL Diff API 2010*/'300171837-2010', 
	/*ApexSQL Recover 2010*/'300100681-2010',
	/*ApexSQL Report 2005*/ '152171-2005',
	/*ApexSQL Report 2008*/ '152171-2008', 
     /*ApexSQL Diff (dev) 2005*/'300566724-2005',
	/*ApexSQL Code 2005*/'141575-2005',
	/*ApexSQL Code 2008*/'141575-2008',
	/*ApexSQL Script 2010*/'141141-2010',
	/*ApexSQL SSIS Compare 2010*/'300172715-2010',
	/*ApexSQL Audit 2010*/'141573-2010',
	/*ApexSQL Audit Viewer 2010*/'300100678-2010',
	/*ApexSQL Clean 2010*/'143480-2010',
	/*ApexSQL Enforce 2010*/'300227565-2010',
	/*ApexSQL SSIS Compare 2008*/ '300172715-2008',
	/*ApexSQL Source Control 2008*/ '300172714-2008'
	) 
ORDER BY T.Product_Name, T.Major_Build_Version DESC
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationList]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationList]
	TO [davor.dumeljic]
GO
