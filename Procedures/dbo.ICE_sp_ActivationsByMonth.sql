SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[ICE_sp_ActivationsByMonth](@DateBegin datetime, @DateEnd datetime)
as
BEGIN
	SET NOCOUNT ON
 
	Select Top 100 percent 
		dbo.ICE_GetMonthName(Year(Process_Date) * 100 + Month(Process_Date)) as Month, 
		Count(*) as Activations
	from 
		ICE_Activations 
	where 
		Process_Date >= @DateBegin and Process_Date < @DateEnd+1 And 
		ISNULL(Failed, 0)=0 And ISNULL(Reactivation, 0)=0
	Group by 
		Year(Process_Date) * 100 + Month(Process_Date)
	order by
		Year(Process_Date) * 100 + Month(Process_Date) 
END


GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByMonth]
	TO [davor.dumeljic]
GO
