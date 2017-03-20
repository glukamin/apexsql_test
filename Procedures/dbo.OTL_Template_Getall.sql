SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Get Template Details
-- =============================================
CREATE PROCEDURE [dbo].[OTL_Template_Getall]
AS
	BEGIN
		SET NOCOUNT ON;
		 SELECT * FROM OTL_Templates
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Template_Getall]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Template_Getall]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Template_Getall]
	TO [davor.dumeljic]
GO
