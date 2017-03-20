SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_UpgradeCenterNotification
(
 @Order_Detail_ID int ,
 @User_ID int )
AS
BEGIN
      DECLARE @User_Email varchar(100)
      SET @User_Email = ( SELECT
                              Author_Email
                          FROM
                              tblAuthor
                          WHERE
                              tblAuthor.Author_ID = @User_ID )

      SELECT
          ( SELECT
                Cust_ID
            FROM
                ICE_Orders
            WHERE
                ICE_Orders.Order_ID = ( SELECT
                                            Order_ID
                                        FROM
                                            ICE_Order_Details
                                        WHERE
                                            ICE_Order_Details.Order_Detail_Id = @Order_Detail_ID ) ) AS Customer_ID ,
          ( SELECT
                Product_Name
            FROM
                ICE_Products
            WHERE
                ICE_Products.Product_ID = ( SELECT
                                                Product_ID
                                            FROM
                                                ICE_Order_Details
                                            WHERE
                                                ICE_Order_Details.Order_Detail_Id = @Order_Detail_ID ) ) AS Product_Name ,
          @User_Email AS User_Email ,
          CASE
               WHEN( SELECT
                         count(*)
                     FROM
                         ICE_Customers
                     WHERE
                         ICE_Customers.Email = @User_Email ) > 0 THEN 'Login email exists in ICE'
               WHEN( SELECT
                         count(*)
                     FROM
                         ICE_Contacts
                     WHERE
                         ICE_Contacts.Email_Ship = @User_Email ) > 0 THEN 'Login email exists in ICE'
               ELSE 'Login email doesn`t exist in ICE'
          END AS ICE_Status
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_UpgradeCenterNotification]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_UpgradeCenterNotification]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_UpgradeCenterNotification]
	TO [davor.dumeljic]
GO
