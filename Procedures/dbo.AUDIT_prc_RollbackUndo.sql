SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC dbo.AUDIT_prc_RollbackUndo
AS
IF @@TRANCOUNT > 0
  ROLLBACK TRAN
SET IMPLICIT_TRANSACTIONS OFF
DROP TABLE ##UndoLog
DROP TABLE ##UndoColumns
RETURN @@ERROR
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_RollbackUndo]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_RollbackUndo]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_RollbackUndo]
	TO [davor.dumeljic]
GO
