SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function dbo.ICE_GetNumberOfActivations
(
	@Bundle_Id int,
	@Product_Id int,
	@DateStart datetime,
	@DateEnd datetime
)
returns varchar(20)
as
begin
	declare @result int
	set @result = 0
	
	SET @result =
	(select Count(*) from
	(
	select distinct A.Unlock_Code_ID
	from ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID
	inner join ICE_Unlock_Codes UC on OD.Order_Detail_Id = UC.Order_Detail_ID
	inner join ICE_Activations A on UC.Unlock_Code_ID = A.Unlock_Code_ID
	where (O.Order_Date between @DateStart and @DateEnd)
	and (OD.Product_ID = @Bundle_Id)
	and (UC.Product_ID = @Product_Id)
	and (O.Order_Status_ID in (0,1,2,4)) 
	and (A.Reactivation is null)) P
	)
	return convert(varchar, @result)
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNumberOfActivations]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNumberOfActivations]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNumberOfActivations]
	TO [davor.dumeljic]
GO
