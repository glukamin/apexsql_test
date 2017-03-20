SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpBannedIPs] AS SELECT tblBanList.IP FROM tblBanList WHERE tblBanList.IP Is Not Null;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpBannedIPs]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpBannedIPs]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpBannedIPs]
	TO [davor.dumeljic]
GO
