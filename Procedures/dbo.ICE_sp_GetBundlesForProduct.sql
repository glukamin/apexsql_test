SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[ICE_sp_GetBundlesForProduct]
(
 @Product_Alias varchar(20) )
AS
BEGIN
      SELECT
          ICE_Products.Product_ID ,
          ICE_Products.Product_Name ,
          ICE_Products.Product_Description ,
          ICE_Products.Price ,
          ICE_Products.A_Key ,
          ICE_Products.E_Key ,
          ICE_Products.N_Key ,
          ICE_Products.Bundle_Products ,
          ICE_Products.Unlock_Code_Pattern ,
          ICE_Products.Created_By ,
          ICE_Products.Create_Date ,
          ICE_Products.Edited_By ,
          ICE_Products.Edit_Date ,
          ICE_Products.Product_Alias ,
          ICE_Products.Product_Icon ,
          ICE_Products.Product_Thumb ,
          ICE_Products.Is_Private ,
          ICE_Products.Default_Major_Build_Version ,
          ICE_Products.HasSiteLicense,
	     ICE_Products.Dev_Version_ID
      FROM
          ICE_Products
      WHERE
          ICE_Products.Bundle_Products LIKE '%' + CONVERT(varchar , ( SELECT
                                                                          Product_ID
                                                                      FROM
                                                                          ICE_Products
                                                                      WHERE
                                                                          ICE_Products.Product_Alias = @Product_Alias )) + '%'
		AND ICE_Products.Is_Private = 0
      ORDER BY
          ICE_Products.Price
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetBundlesForProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetBundlesForProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetBundlesForProduct]
	TO [davor.dumeljic]
GO
