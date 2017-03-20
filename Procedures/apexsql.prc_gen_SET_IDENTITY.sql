SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROC prc_gen_SET_IDENTITY
        (
        @IdentityVal int
        )
        AS
           IF CURSOR_STATUS ('global', 'IdentityVal') >= 0
               DEALLOCATE IdentityVal
               DECLARE IdentityVal CURSOR FAST_FORWARD FOR SELECT @IdentityVal
GO
GRANT EXECUTE
	ON [apexsql].[prc_gen_SET_IDENTITY]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_gen_SET_IDENTITY]
	TO [davor.dumeljic]
GO
