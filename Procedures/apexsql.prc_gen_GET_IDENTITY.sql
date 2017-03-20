SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROC prc_gen_GET_IDENTITY
        (
        @IdentityVal int OUTPUT
        )
        AS
           IF CURSOR_STATUS ('global', 'IdentityVal') < 0
               SELECT @IdentityVal = NULL
           ELSE
               BEGIN
                   FETCH NEXT FROM IdentityVal INTO @IdentityVal
                   DEALLOCATE IdentityVal
               END
GO
GRANT EXECUTE
	ON [apexsql].[prc_gen_GET_IDENTITY]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_gen_GET_IDENTITY]
	TO [davor.dumeljic]
GO
