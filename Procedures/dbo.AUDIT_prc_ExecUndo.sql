SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[AUDIT_prc_ExecUndo]
@SQL nvarchar(4000),
@ERROR int output
AS
DECLARE @SqlString nvarchar(4000)
SELECT @SqlString = 'Set Quoted_identifier on ' + @SQL
exec sp_executesql @SqlString, N'@ERROR int output', @ERROR output
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ExecUndo]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ExecUndo]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ExecUndo]
	TO [davor.dumeljic]
GO
