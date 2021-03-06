SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetCustIdByAuthorId
(
	@Author_ID int
)
RETURNS INT
AS
BEGIN
	DECLARE @Cust_ID int
	SET @Cust_ID = (SELECT top 1 Cust_ID FROM ICE_Contacts WHERE ICE_Contacts.Email_Ship = ISNULL((SELECT Author_Email FROM tblAuthor WHERE tblAuthor.Author_ID = @Author_ID),'-1'))
	IF @Cust_ID IS NULL
	BEGIN
		SET @Cust_ID = (SELECT top 1 Cust_ID FROM ICE_Customers WHERE ICE_Customers.Email = ISNULL((SELECT Author_Email FROM tblAuthor WHERE tblAuthor.Author_ID = @Author_ID),'-1'))
	END
	RETURN @Cust_ID
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCustIdByAuthorId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCustIdByAuthorId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCustIdByAuthorId]
	TO [davor.dumeljic]
GO
