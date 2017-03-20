SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_GetLeadsWithHighestScore3]
(
    @SalesLeadID int
)
AS
BEGIN
SET NOCOUNT ON 

select top 500 
z.SalesLeadId, 
z.First_Name, 
z.Last_Name, 
z.Email, 
z.Country , 
ISNULL((SELECT TOP 1 Cust_ID FROM ICE_Orders WHERE Email_Ship = Z.Email), -1) as Cust_ID, 
z.Date_Added
, dbo.GetLeadScore3(Z.SalesLeadId) as LeadScore
from
(
    select distinct s.First_Name, s.Last_Name, s.Email, s.Country, s.SalesLeadId, s.Date_Added 
    from ICE_SalesLeads S WITH(NOLOCK)
    inner join ICE_Web_Visitors WV WITH(NOLOCK) on S.Author_ID = Wv.RegisterID
    inner join ICE_Page_Visits PV WITH(NOLOCK) on wv.Web_Visitor_ID = pv.TrackingID   
    left join ICE_MC_Lead_Activities MCLA WITH(NOLOCK) on S.SalesLeadId = MCLA.Lead_ID 
    where 
    (
	   s.SalesLeadId = @SalesLeadID
    )
    and s.Email not like '%apexsql.com%' 
    and s.Email <> 'fear@sbb.rs'
    and s.Email <> 'testera@gmail.com'
    and s.Email <> 'stojanovic79@hotmail.com'
    and s.Email <> 'aleksandratims@gmail.com'
    and s.Email <> 'kkostadinovic@gmail.com'
    and s.Email <> 'davor.dumeljic@gmail.com'
    and s.Email <> 'corneliusbsr@yahoo.com'
    and s.Email <> 'bozazec@gmail.com'
    and s.Email <> 'delta43@gmail.com'
    and s.Country <> 'SERBIA'


) Z
order by LeadScore DESC

END
GO
