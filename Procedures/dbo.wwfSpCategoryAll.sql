SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[wwfSpCategoryAll] AS SELECT tblCategory.Cat_name, tblCategory.Cat_ID, tblCategory.[Image] FROM tblCategory ORDER BY tblCategory.Cat_order ASC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCategoryAll]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCategoryAll]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCategoryAll]
	TO [davor.dumeljic]
GO
