SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Orders_Referall_Path_SEO]
(
      @StartDate datetime,
      @EndDate datetime,
      @ShowUnassistedSales int = null,
      @Email varchar(100) = null
)
AS
BEGIN 
      select P.Full_Referrer, O.Email_Ship as Pruchase_Email, P.Email as Lead_Email, O.Total, O.Order_ID
      from ICE_Orders O WITH (NOLOCK)
      inner join 
      (
            select distinct A.Author_email as Eml,
            A.Author_email as Email,
            W.Full_Referrer
            from ICE_Web_Visitors W WITH (NOLOCK)
            inner join tblAuthor A WITH (NOLOCK) on W.RegisterID = A.Author_ID
            inner join ICE_Page_Visits P WITH (NOLOCK) on W.Web_Visitor_ID = P.TrackingID
            WHERE
		  LEN(W.Full_Referrer) > 0
            and P.VisitTime < dateadd(day,1,@EndDate)
      ) P on O.Email_Ship = P.Eml
      where O.Order_Date >= @StartDate
      AND O.Order_Date <= @EndDate
      and O.Order_Status_ID in (0,1,2,4)
      and (O.Order_Type_ID = @ShowUnassistedSales or 2 = ISNULL(@ShowUnassistedSales, 2))
      and (O.Email_Ship = @Email or '3' = ISNULL(@Email, '3'))
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Orders_Referall_Path_SEO]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Orders_Referall_Path_SEO]
	TO [davor.dumeljic]
GO
