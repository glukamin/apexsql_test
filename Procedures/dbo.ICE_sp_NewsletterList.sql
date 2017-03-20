SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_NewsletterList]
AS
BEGIN
SELECT n.UserEmail as EmailAddress
FROM apexsql.Newsletter n 
LEFT JOIN dbo.Unsubscribed u 
ON n.UserEmail = u.[E-Mail] 
WHERE u.[E-Mail] IS NULL AND n.Status = 1
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NewsletterList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NewsletterList]
	TO [davor.dumeljic]
GO
