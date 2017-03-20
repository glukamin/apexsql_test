SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure dbo.ICE_sp_ActivationsByBundle
(
	@StartDate datetime,
	@EndDate datetime
)
as
begin

select
'Universal Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 204978 
) as [Total_Purchased],
(select dbo.ICE_GetNumberOfActivations(204978, 141573 , @StartDate, @EndDate)) as [Audit],
(select dbo.ICE_GetNumberOfActivations(204978, 300100678 , @StartDate, @EndDate)) as [Audit_viewer],
(select dbo.ICE_GetNumberOfActivations(204978, 143480 , @StartDate, @EndDate)) as [Clean],
(select dbo.ICE_GetNumberOfActivations(204978, 300171838 , @StartDate, @EndDate)) as [Debug],
(select dbo.ICE_GetNumberOfActivations(204978, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(204978, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(204978, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
(select dbo.ICE_GetNumberOfActivations(204978, 202696 , @StartDate, @EndDate)) as [Doc],
(select dbo.ICE_GetNumberOfActivations(204978, 211508 , @StartDate, @EndDate)) as [Edit],	
(select dbo.ICE_GetNumberOfActivations(204978, 300227565 , @StartDate, @EndDate)) as [Enforce],
(select dbo.ICE_GetNumberOfActivations(204978, 183236 , @StartDate, @EndDate)) as [Log],
(select dbo.ICE_GetNumberOfActivations(204978, 300168796 , @StartDate, @EndDate)) as [Log_API],
(select dbo.ICE_GetNumberOfActivations(204978, 300100681 , @StartDate, @EndDate)) as [Recover],	
(select dbo.ICE_GetNumberOfActivations(204978, 300172712 , @StartDate, @EndDate)) as [Refactor],
(select dbo.ICE_GetNumberOfActivations(204978, 141141 , @StartDate, @EndDate)) as [Script],
(select dbo.ICE_GetNumberOfActivations(204978, 300172715 , @StartDate, @EndDate)) as [Ssis_Copmare]

union

select
'Developer Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 141582 
) as [Total_Purchased],
/*(select dbo.ICE_GetNumberOfActivations(141582, 141573 , @StartDate, @EndDate))*/ 'N/A' as [Audit],
/*(select dbo.ICE_GetNumberOfActivations(141582, 300100678 , @StartDate, @EndDate))*/ 'N/A' as [Audit_viewer],
(select dbo.ICE_GetNumberOfActivations(141582, 143480 , @StartDate, @EndDate)) as [Clean],
(select dbo.ICE_GetNumberOfActivations(141582, 300171838 , @StartDate, @EndDate)) as [Debug],
(select dbo.ICE_GetNumberOfActivations(141582, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(141582, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(141582, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
(select dbo.ICE_GetNumberOfActivations(141582, 202696 , @StartDate, @EndDate)) as [Doc],
(select dbo.ICE_GetNumberOfActivations(141582, 211508 , @StartDate, @EndDate)) as [Edit],	
/*(select dbo.ICE_GetNumberOfActivations(141582, 300227565 , @StartDate, @EndDate))*/ 'N/A' as [Enforce],
/*(select dbo.ICE_GetNumberOfActivations(141582, 183236 , @StartDate, @EndDate))*/ 'N/A' as [Log],
/*(select dbo.ICE_GetNumberOfActivations(141582, 300168796 , @StartDate, @EndDate))*/ 'N/A' as [Log_API],
/*(select dbo.ICE_GetNumberOfActivations(141582, 300100681 , @StartDate, @EndDate))*/ 'N/A' as [Recover],	
/*(select dbo.ICE_GetNumberOfActivations(141582, 300172712 , @StartDate, @EndDate))*/ 'N/A' as [Refactor],
(select dbo.ICE_GetNumberOfActivations(141582, 141141 , @StartDate, @EndDate)) as [Script],
(select dbo.ICE_GetNumberOfActivations(141582, 300172715 , @StartDate, @EndDate)) as [Ssis_Copmare]

union

select
'Recovery Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 300299403 
) as [Total_Purchased],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 141573 , @StartDate, @EndDate))*/ 'N/A' as [Audit],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300100678 , @StartDate, @EndDate))*/ 'N/A' as [Audit_viewer],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 143480 , @StartDate, @EndDate))*/ 'N/A' as [Clean],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300171838 , @StartDate, @EndDate))*/ 'N/A' as [Debug],
(select dbo.ICE_GetNumberOfActivations(300299403, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(300299403, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(300299403, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 202696 , @StartDate, @EndDate))*/ 'N/A' as [Doc],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 211508 , @StartDate, @EndDate))*/ 'N/A' as [Edit],	
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300227565 , @StartDate, @EndDate))*/ 'N/A' as [Enforce],
(select dbo.ICE_GetNumberOfActivations(300299403, 183236 , @StartDate, @EndDate)) as [Log],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300168796 , @StartDate, @EndDate))*/ 'N/A' as [Log_API],
(select dbo.ICE_GetNumberOfActivations(300299403, 300100681 , @StartDate, @EndDate)) as [Recover],	
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300172712 , @StartDate, @EndDate))*/ 'N/A' as [Refactor],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 141141 , @StartDate, @EndDate))*/ 'N/A' as [Script],
/*(select dbo.ICE_GetNumberOfActivations(300299403, 300172715 , @StartDate, @EndDate))*/ 'N/A' as [Ssis_Copmare]

union

select
'DBA Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 300267312 
) as [Total_Purchased],
(select dbo.ICE_GetNumberOfActivations(300267312, 141573 , @StartDate, @EndDate)) as [Audit],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 300100678 , @StartDate, @EndDate))*/ 'N/A' as [Audit_viewer],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 143480 , @StartDate, @EndDate))*/ 'N/A' as [Clean],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 300171838 , @StartDate, @EndDate))*/ 'N/A' as [Debug],
(select dbo.ICE_GetNumberOfActivations(300267312, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(300267312, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(300267312, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 202696 , @StartDate, @EndDate))*/ 'N/A' as [Doc],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 211508 , @StartDate, @EndDate))*/ 'N/A' as [Edit],	
(select dbo.ICE_GetNumberOfActivations(300267312, 300227565 , @StartDate, @EndDate)) as [Enforce],
(select dbo.ICE_GetNumberOfActivations(300267312, 183236 , @StartDate, @EndDate)) as [Log],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 300168796 , @StartDate, @EndDate))*/ 'N/A' as [Log_API],
(select dbo.ICE_GetNumberOfActivations(300267312, 300100681 , @StartDate, @EndDate)) as [Recover],	
/*(select dbo.ICE_GetNumberOfActivations(300267312, 300172712 , @StartDate, @EndDate))*/ 'N/A' as [Refactor],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 141141 , @StartDate, @EndDate))*/ 'N/A' as [Script],
/*(select dbo.ICE_GetNumberOfActivations(300267312, 300172715 , @StartDate, @EndDate))*/ 'N/A' as [Ssis_Copmare]

union

select
'SSMS Plus Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 300235435 
) as [Total_Purchased],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 141573 , @StartDate, @EndDate))*/ 'N/A' as [Audit],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 300100678 , @StartDate, @EndDate))*/ 'N/A' as [Audit_viewer],
(select dbo.ICE_GetNumberOfActivations(300235435, 143480 , @StartDate, @EndDate)) as [Clean],
(select dbo.ICE_GetNumberOfActivations(300235435, 300171838 , @StartDate, @EndDate)) as [Debug],
(select dbo.ICE_GetNumberOfActivations(300235435, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(300235435, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(300235435, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
(select dbo.ICE_GetNumberOfActivations(300235435, 202696 , @StartDate, @EndDate)) as [Doc],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 211508 , @StartDate, @EndDate))*/ 'N/A' as [Edit],	
/*(select dbo.ICE_GetNumberOfActivations(300235435, 300227565 , @StartDate, @EndDate))*/ 'N/A' as [Enforce],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 183236 , @StartDate, @EndDate))*/ 'N/A' as [Log],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 300168796 , @StartDate, @EndDate))*/ 'N/A' as [Log_API],
/*(select dbo.ICE_GetNumberOfActivations(300235435, 300100681 , @StartDate, @EndDate))*/ 'N/A' as [Recover],	
(select dbo.ICE_GetNumberOfActivations(300235435, 300172712 , @StartDate, @EndDate)) as [Refactor],
(select dbo.ICE_GetNumberOfActivations(300235435, 141141 , @StartDate, @EndDate)) as [Script],
(select dbo.ICE_GetNumberOfActivations(300235435, 300172715 , @StartDate, @EndDate)) as [Ssis_Copmare]	

union

select
'Comparison Studio' as Product,
(
	select SUM(Od.qty) from 
	ICE_Orders O 
	inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID 
	where O.Order_Date between @StartDate and @EndDate and Od.Product_ID = 300299401 
) as [Total_Purchased],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 141573 , @StartDate, @EndDate))*/ 'N/A' as [Audit],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300100678 , @StartDate, @EndDate))*/ 'N/A' as [Audit_viewer],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 143480 , @StartDate, @EndDate))*/ 'N/A' as [Clean],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300171838 , @StartDate, @EndDate))*/ 'N/A' as [Debug],
(select dbo.ICE_GetNumberOfActivations(300299401, 167831 , @StartDate, @EndDate)) as [Diff],
(select dbo.ICE_GetNumberOfActivations(300299401, 300171837 , @StartDate, @EndDate)) as [Diff_API],
(select dbo.ICE_GetNumberOfActivations(300299401, 300267612 , @StartDate, @EndDate)) as [Data_Diff],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 202696 , @StartDate, @EndDate))*/ 'N/A' as [Doc],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 211508 , @StartDate, @EndDate))*/ 'N/A' as [Edit],	
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300227565 , @StartDate, @EndDate))*/ 'N/A' as [Enforce],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 183236 , @StartDate, @EndDate))*/ 'N/A' as [Log],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300168796 , @StartDate, @EndDate))*/ 'N/A' as [Log_API],
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300100681 , @StartDate, @EndDate))*/ 'N/A' as [Recover],	
/*(select dbo.ICE_GetNumberOfActivations(300299401, 300172712 , @StartDate, @EndDate))*/ 'N/A' as [Refactor],
(select dbo.ICE_GetNumberOfActivations(300299401, 141141 , @StartDate, @EndDate)) as [Script],
(select dbo.ICE_GetNumberOfActivations(300299401, 300172715 , @StartDate, @EndDate)) as [Ssis_Copmare]	

end
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByBundle]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByBundle]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ActivationsByBundle]
	TO [davor.dumeljic]
GO
