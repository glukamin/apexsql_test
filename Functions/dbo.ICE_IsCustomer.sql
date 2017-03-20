SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ICE_IsCustomer]
(
	@Email varchar(100)
)
returns bit
as
Begin
	DECLARE @result bit	
	IF exists (select * from ICE_Customers where lower(Email) like '%' + substring(lower(@Email), charindex('@',lower(@Email)), len(@Email) - charindex(@Email, '@')) + '%')
		SET @result = 1
	ELSE
		SET @result = 0
	RETURN @result	
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCustomer]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCustomer]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCustomer]
	TO [davor.dumeljic]
GO
