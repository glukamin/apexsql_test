SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpSelectConfiguration] AS SELECT tblConfiguration.* From tblConfiguration;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpSelectConfiguration]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpSelectConfiguration]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpSelectConfiguration]
	TO [davor.dumeljic]
GO
