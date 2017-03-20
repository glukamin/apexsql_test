SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.sup_ShowAll
AS
BEGIN
	SELECT
    Sup_Issue.Issue_ID ,
    Sup_Issue.User_Info ,
    Sup_Issue.User_ID ,
    Sup_Issue.Date_Reported ,    
    Sup_Issue.Forum_Link,       
    Sup_Issue.Date_Posted,
    Sup_Issue.Date_Resolved,   
    Sup_Issue.Date_Modified ,
    Sup_Issue.Modified_By,
    Sup_Issue.Rate,    
    tblAuthor.Username as [Person_In_Charge],
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
END
GO
GRANT EXECUTE
	ON [dbo].[sup_ShowAll]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[sup_ShowAll]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[sup_ShowAll]
	TO [davor.dumeljic]
GO
