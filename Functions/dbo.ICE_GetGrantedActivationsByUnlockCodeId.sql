SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_GetGrantedActivationsByUnlockCodeId]
(
	@UnlockCodeID int
)
returns int
As
/*
Returns the number of activations granted for an unlock code id (the 
sum between the initial activations number and the number of activations 
granted until present time).
*/
begin
	declare @GrantedActivationsByUnlockCodeId int -- output

	declare @InitialActivationsNumber int
	-- We cannot determine the actual number of activations received initially
	-- with current database design. Therefore we use the max counter value  
	-- for this unlock code, assuming that this is the number of activations
	-- received initially.
	/*set @InitialActivationsNumber = IsNull(
		(
		SELECT TOP 1 
			[Activation_Counter]
		FROM 
			[dbo].[ICE_Unlock_Code_Logs]
		WHERE 
			Unlock_Code_Id = @UnlockCodeId AND 
			ID IN
			(
			SELECT 
				C2.ID 
			FROM 
				ICE_Unlock_Code_Logs C2 
			WHERE 
				C2.Activation_Counter = 
					(SELECT Max(C3.Activation_Counter) 
					 FROM ICE_Unlock_Code_Logs C3 
					 WHERE C3.Unlock_Code_ID = C2.Unlock_Code_ID)
			)
		),
	0)*/

    set @InitialActivationsNumber = ISNULL(
			 (	SELECT Activations
				FROM ICE_License_Types
				WHERE License_Type_ID=
				( 
				    SELECT OD.License_Type_ID
				    FROM ICE_Unlock_Codes UC JOIN ICE_Order_Details OD ON UC.Order_Detail_ID=OD.Order_Detail_ID
				    WHERE UC.Unlock_Code_ID=@UnlockCodeID)
				)
			 ,0)

	
	declare @NumberOfActivationsGrantedSoFar int
	set @NumberOfActivationsGrantedSoFar = IsNull(
		(
		select 
			sum(U.Counter_Change)
		from 
			[ICE_Unlock_Code_Logs] as U 
		where
			U.Unlock_Code_Id = @UnlockCodeId AND 
			Counter_Change > 0	
		), 
		0
	)

	set @GrantedActivationsByUnlockCodeId = @InitialActivationsNumber + 
			@NumberOfActivationsGrantedSoFar

	return @GrantedActivationsByUnlockCodeId
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGrantedActivationsByUnlockCodeId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGrantedActivationsByUnlockCodeId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGrantedActivationsByUnlockCodeId]
	TO [davor.dumeljic]
GO
