SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AUDIT_prc_GetAuditUndoReport]
AS
SELECT UndoLogId, UndoAction, Parsename(TabName, 1) TabName, PK_data, ColName, OLD_VALUE, [HOST_NAME], [APP_NAME], [MODIFIED_BY], [MODIFIED_DATE], UndoStatus, Comment FROM ##UndoLog
-- rollback transaction to undo changes in tables
rollback
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_GetAuditUndoReport]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_GetAuditUndoReport]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_GetAuditUndoReport]
	TO [davor.dumeljic]
GO
