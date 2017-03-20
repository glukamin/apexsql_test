SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.Sup_sp_Search
(
	@ID int,
	@DateReportedFrom datetime,
	@DateReportedTo datetime,
	@Priority int,
	@PersonInCharge int,
	@CurrentStatus int
)
AS 
BEGIN
	
DECLARE @SqlText nvarchar(4000)
DECLARE @SqlParams nvarchar(1000)

SET @SqlText = '
SELECT
    Sup_Issue.Issue_ID ,
    Sup_Issue.User_Info ,
    Sup_Issue.User_ID ,
    Sup_Issue.Date_Reported ,
    Sup_Issue.Person_In_Charge,
    Sup_Issue.Forum_Link,
    Sup_Issue.Description,
    Sup_Issue.Received_Via_ID,
    Sup_Issue.Date_Posted,
    Sup_Issue.Date_Resolved,
    Sup_Issue.Current_Status_ID,
    Sup_Issue.Notification_Status_ID,
    Sup_Issue.Priority_ID ,
    Sup_Issue.Date_Modified ,
    Sup_Issue.Modified_By,
    Sup_Issue.Rate,
    Sup_Issue.Comment,
    tblAuthor.Username,
    Sup_Priority.Priority_Name,
    Sup_Recieved_Via.Received_Via_Name,
    Sup_Notification_Status.Notification_Status_Name,
    Sup_Current_Status.Current_Status_Name
FROM
    Sup_Issue inner join Sup_Support_Person on Sup_Issue.Person_In_Charge = Sup_Support_Person.User_Forum_ID
    inner join tblAuthor on Sup_Support_Person.User_Forum_ID = tblAuthor.Author_ID
    inner join Sup_Priority on Sup_Issue.Priority_ID = Sup_Priority.Priority_ID
    inner join Sup_Recieved_Via on Sup_Issue.Received_Via_ID = Sup_Recieved_Via.Received_Via_ID
    inner join Sup_Current_Status on Sup_Issue.Current_Status_ID = Sup_Current_Status.Current_Status_ID
    inner join Sup_Notification_Status on Sup_Issue.Notification_Status_ID = Sup_Notification_Status.Notification_Status_ID 
    where (1=1) AND Sup_Issue.Date_Reported >= @RDateReportedFrom AND Sup_Issue.Date_Reported <= @RDateReportedTo'

SET @SqlParams = N'@RID int, @RDateReportedFrom datetime, @RDateReportedTo datetime, @RCurrentStatus int, @RPriority int, @RPersonInCharge int'	

IF @ID is null
	SET @ID = -1
IF @ID > 0
	SET @SqlText = @SqlText + ' AND Sup_Issue.Issue_ID=@RID'
ELSE 
	SET @SqlText = @SqlText + ' AND Sup_Issue.Issue_ID>@RID'

IF @DateReportedFrom is null
	SET @DateReportedFrom = '01/01/1900'

IF @DateReportedTo is null
	SET @DateReportedTo = '01/01/2050'

IF @CurrentStatus is null
	SET @CurrentStatus = -1	
IF @CurrentStatus > 0
	SET @SqlText = @SqlText + ' AND Sup_Issue.Current_Status_ID = @RCurrentStatus'
ELSE
	SET @SqlText = @SqlText + ' AND Sup_Issue.Current_Status_ID > @RCurrentStatus' 

IF @Priority is null
	SET @Priority = -1
IF @Priority > 0
	SET @SqlText = @SqlText + ' AND Sup_Issue.Priority_ID = @RPriority'
ELSE
	SET @SqlText = @SqlText + ' AND Sup_Issue.Priority_ID > @RPriority'
	
IF @PersonInCharge is null
	SET @PersonInCharge = -1
IF @PersonInCharge > 0
	SET @SqlText = @SqlText + ' AND Sup_Issue.Person_In_Charge = @RPersonInCharge'
ELSE
	SET @SqlText = @SqlText + ' AND Sup_Issue.Person_In_Charge > @RPersonInCharge'

--print @SqlText

exec sp_executesql @SqlText, @SqlParams, @RID = @ID, @RDateReportedFrom = @DateReportedFrom, @RDateReportedTo = @DateReportedTo, @RCurrentStatus = @CurrentStatus, @RPersonInCharge = @PersonInCharge, @RPriority = @Priority

END
GO
GRANT EXECUTE
	ON [dbo].[Sup_sp_Search]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Sup_sp_Search]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Sup_sp_Search]
	TO [davor.dumeljic]
GO
