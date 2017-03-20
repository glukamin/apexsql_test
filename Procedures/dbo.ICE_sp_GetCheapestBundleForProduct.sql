SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_GetCheapestBundleForProduct]
(
 @Product_ID int )
AS
BEGIN
    IF @Product_ID = 20269601 /*doc dev*/ OR @Product_ID = 300365236 /*script dev*/ OR  @Product_ID = 300566724 /*diff dev*/ OR @Product_ID = 300576212 /*data diff dev*/
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
        Product_ID = 141582 /*developer studio*/
    END
    ELSE
    BEGIN
	   SELECT TOP 1
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
          ICE_Products.HasSiteLicense
      FROM
          ICE_Products
      WHERE
        ICE_Products.Bundle_Products LIKE '%' + CONVERT(varchar , @Product_ID) + '%'
		AND ICE_Products.Is_Private = 0    
		AND ICE_Products.Product_ID != 300526952                                                                         
      ORDER BY
          ICE_Products.Price
    END
END

SET ANSI_NULLS ON
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetCheapestBundleForProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetCheapestBundleForProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetCheapestBundleForProduct]
	TO [davor.dumeljic]
GO
