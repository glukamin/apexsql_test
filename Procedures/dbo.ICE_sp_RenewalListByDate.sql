SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.ICE_sp_RenewalListByDate
(
    @StartDate datetime,
    @EndDate	 datetime
)
as
begin
    select O.First_Name_Ship as First_Name, 
    O.Last_Name_Ship as Last_Name,
    O.Order_ID,
    P.Product_Name,
    dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) as Expiry_Date,
    OD.Total as Value
    from ICE_Order_Details OD
    inner join ICE_Orders O on OD.Order_ID = O.Order_ID
    inner join ICE_Products P on OD.Product_ID = P.Product_ID
    where O.Order_Status_ID in (0,1,2,4)
    and dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) between @StartDate and @EndDate
    order by Expiry_Date desc
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalListByDate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalListByDate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalListByDate]
	TO [davor.dumeljic]
GO
