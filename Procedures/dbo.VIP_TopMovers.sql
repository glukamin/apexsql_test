SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TopMovers]
AS
BEGIN
	  SELECT TOP 5 Cat_Name as Product,
	 CONVERT(nvarchar(20),
		  (
			  ROUND(
			  (
				   dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,1,0) ,GETDATE()) 
				   - 
				   dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,2,0) ,dbo.VIP_DateSubstract(GETDATE(),0,1,0))
			   ) / 	   
				   CASE  
					   WHEN (dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,2,0) ,dbo.VIP_DateSubstract(GETDATE(),0,1,0))) = 0 THEN 1
					   ELSE (CONVERT(float,( select dbo.VIP_GetPostsForProduct(CAT_ID,    dbo.VIP_DateSubstract(GETDATE(),0,2,0)    ,dbo.VIP_DateSubstract(GETDATE(),0,1,0)    )  )))
				   END , 2)
			)*100
	   ) + '%'
	   as Growth_Last_Month
	   
	   FROM tblCategory
	   WHERE Cat_ID != 14 /*General*/ 
	   Order By ((
		   dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,1,0) ,GETDATE()) 
		   - 
		   dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,2,0) ,dbo.VIP_DateSubstract(GETDATE(),0,1,0))
	   ) / 	   
		   CASE  
			   WHEN (dbo.VIP_GetPostsForProduct(CAT_ID, dbo.VIP_DateSubstract(GETDATE(),0,2,0) ,dbo.VIP_DateSubstract(GETDATE(),0,1,0))) = 0 THEN 1
			   ELSE (CONVERT(float,( select dbo.VIP_GetPostsForProduct(CAT_ID,    dbo.VIP_DateSubstract(GETDATE(),0,2,0)    ,dbo.VIP_DateSubstract(GETDATE(),0,1,0)    )  )))
		   END) DESC
END



GO
GRANT EXECUTE
	ON [dbo].[VIP_TopMovers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopMovers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopMovers]
	TO [davor.dumeljic]
GO
