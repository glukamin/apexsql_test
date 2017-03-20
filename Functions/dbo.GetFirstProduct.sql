SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create function dbo.GetFirstProduct
(
    @SalesLeadID int
)
returns int
begin

return (select top 1 DD.Product_ID as Product_ID
		  from ICE_SalesLeads S
		  inner join ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id
		  inner join ICE_Download_Details DD on D.Download_ID = DD.Download_ID
		  where S.SalesLeadId = @SalesLeadID
		  order by Download_Date asc)

end
GO
GRANT EXECUTE
	ON [dbo].[GetFirstProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[GetFirstProduct]
	TO [davor.dumeljic]
GO
