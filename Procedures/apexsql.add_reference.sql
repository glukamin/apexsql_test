SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE add_reference
	@reseller int = NULL,
	@http_referer varchar(4000) = NULL,
	@remote_addr varchar(15) = NULL,
	@remote_name varchar(1000) = NULL,
	@id int = NULL OUT
AS
DECLARE @reference int
DECLARE @er int
INSERT reference(reseller, http_referer, remote_addr, remote_name)
VALUES(@reseller, @http_referer, @remote_addr, @remote_name)
SET @er = @@ERROR
IF @er = 0 
BEGIN
	COMMIT
	SET @id = @@IDENTITY
END
ELSE
ROLLBACK
RETURN @er
GO
GRANT EXECUTE
	ON [apexsql].[add_reference]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[add_reference]
	TO [davor.dumeljic]
GO
