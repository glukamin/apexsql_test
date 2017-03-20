SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Request_a_demo]
(
	@Product varchar(30) = '',
	@Fname varchar(30) = '',
	@Lname varchar(30) = '',	
	@DateForm datetime = '2000-07-02 08:31:12.750',
	@DateTo datetime = '9999-07-02 08:31:12.750',
	@Email varchar(30)= '',	
	@Company varchar(30)= '',	
	@Phone int=0,	
	@noServer int=0,	
	@noDev int=0,	
	@Description varchar(30)= ''	
)
AS 
BEGIN

SELECT * FROM dbo.ICE_Request_A_Demo irad
WHERE irad.Product LIKE '%'+@Product+'%'  
OR irad.FirstName LIKE '%'+@Fname+'%'  
OR irad.LastName LIKE '%'+@Lname+'%'
OR irad.Email  LIKE '%'+@Email+'%'
OR irad.Company  LIKE '%'+@Company+'%'
OR irad.Phone = @Phone
OR irad.NoServers = @noServer
OR irad.NoDevDba = @noDev
OR irad.RequestDate BETWEEN @DateForm AND @DateTo

END
GO
