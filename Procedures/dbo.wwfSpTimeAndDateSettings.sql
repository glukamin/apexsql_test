SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpTimeAndDateSettings] AS SELECT tblDateTimeFormat.* FROM tblDateTimeFormat;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTimeAndDateSettings]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTimeAndDateSettings]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTimeAndDateSettings]
	TO [davor.dumeljic]
GO
