SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC dbo.AUDIT_prc_CommitUndo
AS
COMMIT TRAN
SET IMPLICIT_TRANSACTIONS OFF
DROP TABLE ##UndoLog
DROP TABLE ##UndoColumns
RETURN @@ERROR
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_CommitUndo]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_CommitUndo]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_CommitUndo]
	TO [davor.dumeljic]
GO
