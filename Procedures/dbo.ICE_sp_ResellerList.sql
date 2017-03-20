SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_ResellerList]
as
select Reseller_ID, Company+' - '+First_Name+' '+Last_Name+' - '+convert(varchar(20), Discount)+'%' as Reseller from ICE_Resellers order by 2
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerList]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerList]
	TO [davor.dumeljic]
GO
