SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpUpdateViewPostCount] 
(
@lngNumberOfViews int, 
@lngTopicID int 
)
 AS 
UPDATE tblTopic SET 
tblTopic.No_of_views=@lngNumberOfViews 
WHERE tblTopic.Topic_ID=@lngTopicID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateViewPostCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateViewPostCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateViewPostCount]
	TO [davor.dumeljic]
GO
