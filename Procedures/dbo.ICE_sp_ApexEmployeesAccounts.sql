SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_ApexEmployeesAccounts
AS
BEGIN
SELECT 	[Author_ID],	
	[Username]	
FROM
	[apexsql].[dbo].[tblAuthor]
WHERE dbo.tblAuthor.Active = 'True'
AND dbo.tblAuthor.Group_ID not in (4,2,5,6,20)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ApexEmployeesAccounts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ApexEmployeesAccounts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ApexEmployeesAccounts]
	TO [davor.dumeljic]
GO
