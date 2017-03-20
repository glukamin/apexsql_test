SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
 Author:		Pankaj Sutradhar
 Create date: 09/05/2007
 Description:	Get user Details
 =============================================
*/
CREATE VIEW dbo.uv_OTL_UserDetails
AS
/*SELECT     TOP 100 PERCENT dbo.OTL_Users.Id, dbo.OTL_Users.FirstName + ' ' + dbo.OTL_Users.LastName + ' [' + CAST(COUNT(*) AS nvarchar(50)) 
                      + ']' AS Poster, ISNULL(AVG(dbo.uv_OTL_TemplateDetails.Rating), 0) AS AvgRating, ISNULL((dbo.OTL_GetApprovedTemplateCount(otl_Users.Id,'U')) ,0) 
                      AS TemplateSubmitted, dbo.OTL_Users.FirstName, dbo.OTL_Users.LastName, dbo.OTL_Users.Email, dbo.OTL_Users.Address, dbo.OTL_Users.Zip, 
                      dbo.OTL_Users.UserName, dbo.OTL_Users.Password, dbo.OTL_Users.RegistredOn, ISNULL(dbo.uv_OTL_TemplateDetails.Status, 0) AS Status
FROM         dbo.uv_OTL_TemplateDetails RIGHT OUTER JOIN
                      dbo.OTL_Users ON dbo.uv_OTL_TemplateDetails.UserId = dbo.OTL_Users.Id
GROUP BY dbo.OTL_Users.Id, dbo.uv_OTL_TemplateDetails.UserId, dbo.OTL_Users.FirstName, dbo.OTL_Users.LastName, dbo.OTL_Users.FirstName, 
                      dbo.OTL_Users.LastName, dbo.OTL_Users.Email, dbo.OTL_Users.Address, dbo.OTL_Users.Zip, dbo.OTL_Users.UserName, 
                      dbo.OTL_Users.Password, dbo.OTL_Users.RegistredOn, dbo.uv_OTL_TemplateDetails.Status
ORDER BY COUNT(*) DESC*/


SELECT 
    TOP 100 PERCENT dbo.tblAuthor.Author_ID, dbo.tblAuthor.Real_name,ISNULL((dbo.OTL_GetApprovedTemplateCount(tblAuthor.Author_ID,'U')) ,0) 
                      AS TemplateSubmitted,dbo.tblAuthor.Join_date, ISNULL(dbo.uv_OTL_TemplateDetails.Status, 0) AS Status,dbo.tblAuthor.Author_email
FROM         dbo.uv_OTL_TemplateDetails RIGHT OUTER JOIN
                      dbo.tblAuthor ON dbo.uv_OTL_TemplateDetails.UserId = dbo.tblAuthor.Author_ID
GROUP BY dbo.tblAuthor.Author_ID, dbo.uv_OTL_TemplateDetails.UserId, dbo.tblAuthor.Real_name, 
                      dbo.tblAuthor.Join_date, dbo.uv_OTL_TemplateDetails.Status,dbo.tblAuthor.Author_email
ORDER BY COUNT(*) DESC






GO
