SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_FindInvalidEmails
AS
BEGIN
	SELECT Order_ID as [Object ID], Email_Ship as Email, 'Order' as [Object Type]
	FROM ICE_Orders
	WHERE NOT
	(
		CHARINDEX(' ',LTRIM(RTRIM([Email_Ship]))) = 0 
	AND  	LEFT(LTRIM([Email_Ship]),1) <> '@' 
	AND  	RIGHT(RTRIM([Email_Ship]),1) <> '.' 
	AND  	CHARINDEX('.',[Email_Ship],CHARINDEX('@',[Email_Ship])) - CHARINDEX('@',[Email_Ship]) > 1 
	AND  	LEN(LTRIM(RTRIM([Email_Ship]))) - LEN(REPLACE(LTRIM(RTRIM([Email_Ship])),'@','')) = 1 
	AND  	CHARINDEX('.',REVERSE(LTRIM(RTRIM([Email_Ship])))) >= 3 
	AND  	(CHARINDEX('.@',[Email_Ship]) = 0 AND CHARINDEX('..',[Email_Ship]) = 0) 
	)
	OR -- This part checks for common illegal characters in emails
	(
		CHARINDEX(',',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('[',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(']',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(';',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('#',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('!',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('$',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('%',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('(',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(')',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('/',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('\',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('*',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('+',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('=',LTRIM(RTRIM([Email]))) > 0
	)
	union
	SELECT Cust_ID as [Object ID], Email as Email, 'Customer' as [Object Type] 
	FROM ICE_Customers
	WHERE NOT
	(
		CHARINDEX(' ',LTRIM(RTRIM([Email]))) = 0
	AND  	LEFT(LTRIM([Email]),1) <> '@'
	AND  	RIGHT(RTRIM([Email]),1) <> '.'
	AND  	CHARINDEX('.',[Email],CHARINDEX('@',[Email])) - CHARINDEX('@',[Email]) > 1
	AND  	LEN(LTRIM(RTRIM([Email]))) - LEN(REPLACE(LTRIM(RTRIM([Email])),'@','')) = 1
	AND  	CHARINDEX('.',REVERSE(LTRIM(RTRIM([Email])))) >= 3
	AND  	(CHARINDEX('.@',[Email]) = 0 AND CHARINDEX('..',[Email]) = 0)
	)
	OR -- This part checks for common illegal characters in emails
	(
		CHARINDEX(',',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('[',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(']',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(';',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('#',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('!',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('$',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('%',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('(',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX(')',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('/',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('\',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('*',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('+',LTRIM(RTRIM([Email]))) > 0
		OR
		CHARINDEX('=',LTRIM(RTRIM([Email]))) > 0
	)
	union
	SELECT Contact_ID as [Object ID], Email_Ship as Email, 'Contact' as [Object Type] 
	FROM ICE_Contacts
	WHERE NOT
	(
		CHARINDEX(' ',LTRIM(RTRIM([Email_Ship]))) = 0
	AND  	LEFT(LTRIM([Email_Ship]),1) <> '@'
	AND  	RIGHT(RTRIM([Email_Ship]),1) <> '.'
	AND  	CHARINDEX('.',[Email_Ship],CHARINDEX('@',[Email_Ship])) - CHARINDEX('@',[Email_Ship]) > 1
	AND  	LEN(LTRIM(RTRIM([Email_Ship]))) - LEN(REPLACE(LTRIM(RTRIM([Email_Ship])),'@','')) = 1
	AND  	CHARINDEX('.',REVERSE(LTRIM(RTRIM([Email_Ship])))) >= 3
	AND  	(CHARINDEX('.@',[Email_Ship]) = 0 AND CHARINDEX('..',[Email_Ship]) = 0)
	)
	OR -- This part checks for common illegal characters in emails
	(
		CHARINDEX(',',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('[',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX(']',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX(';',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('#',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('!',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('$',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('%',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('(',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX(')',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('/',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('\',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('*',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('+',LTRIM(RTRIM([Email_Ship]))) > 0
		OR
		CHARINDEX('=',LTRIM(RTRIM([Email_Ship]))) > 0
	)
	union
	SELECT SalesLeadID as [Object ID], Email as Email, 'Sales Lead' as [Object Type] 
	FROM ICE_SalesLeads
	WHERE NOT
	(
		CHARINDEX(' ',LTRIM(RTRIM([Email]))) = 0
	AND  	LEFT(LTRIM([Email]),1) <> '@'
	AND  	RIGHT(RTRIM([Email]),1) <> '.'
	AND  	CHARINDEX('.',[Email],CHARINDEX('@',[Email])) - CHARINDEX('@',[Email]) > 1
	AND  	LEN(LTRIM(RTRIM([Email]))) - LEN(REPLACE(LTRIM(RTRIM([Email])),'@','')) = 1
	AND  	CHARINDEX('.',REVERSE(LTRIM(RTRIM([Email])))) >= 3
	AND  	(CHARINDEX('.@',[Email]) = 0 AND CHARINDEX('..',[Email]) = 0)
	)
	ORDER BY [Object Type]
END	
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FindInvalidEmails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FindInvalidEmails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FindInvalidEmails]
	TO [davor.dumeljic]
GO
