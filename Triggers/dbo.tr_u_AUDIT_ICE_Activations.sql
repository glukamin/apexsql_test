SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_Activations]
ON [dbo].[ICE_Activations]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_Activations]
-- Author:       ApexSQL Software
-- Date:		 1/9/2009 10:47:26 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE			varchar(50),
		@AUDIT_LOG_TRANSACTION_ID	Int,
		@PRIM_KEY			nvarchar(4000),
		@Inserted	    		bit,
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Activations]'
	Select @ROWS_COUNT=count(*) from inserted
	SET @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO dbo.AUDIT_LOG_TRANSACTIONS 
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'ICE_Activations',
		'dbo',
		1,	--	ACTION ID For UPDATE
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'apexsql'
	)
	
	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	
	
	SET @Inserted = 0
	
	If UPDATE([Activation_ID])
	BEGIN
    
		INSERT
		INTO dbo.AUDIT_LOG_DATA 
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[Activation_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Activation_ID], NEW.[Activation_ID]), 0), '[Activation_ID] Is Null')),
		    'Activation_ID',
			CONVERT(nvarchar(4000), OLD.[Activation_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Activation_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Activation_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Activation_ID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[Activation_ID], 0)=CONVERT(nvarchar(4000), OLD.[Activation_ID], 0) or (NEW.[Activation_ID] Is Null and OLD.[Activation_ID] Is Null))
			WHERE (
			
			
				(
					NEW.[Activation_ID] <>
					OLD.[Activation_ID]
				) Or
			
				(
					NEW.[Activation_ID] Is Null And
					OLD.[Activation_ID] Is Not Null
				) Or
				(
					NEW.[Activation_ID] Is Not Null And
					OLD.[Activation_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Unlock_Code_ID])
	BEGIN
    
		INSERT
		INTO dbo.AUDIT_LOG_DATA 
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[Activation_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Activation_ID], NEW.[Activation_ID]), 0), '[Activation_ID] Is Null')),
		    'Unlock_Code_ID',
			CONVERT(nvarchar(4000), OLD.[Unlock_Code_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Unlock_Code_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Activation_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Activation_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Activation_ID], 0)=CONVERT(nvarchar(4000), OLD.[Activation_ID], 0) or (NEW.[Activation_ID] Is Null and OLD.[Activation_ID] Is Null))
			where (
			
			
				(
					NEW.[Unlock_Code_ID] <>
					OLD.[Unlock_Code_ID]
				) Or
			
				(
					NEW.[Unlock_Code_ID] Is Null And
					OLD.[Unlock_Code_ID] Is Not Null
				) Or
				(
					NEW.[Unlock_Code_ID] Is Not Null And
					OLD.[Unlock_Code_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	-- Watch
	
	-- Lookup
	
	IF @Inserted = 0
	BEGIN
		DELETE FROM dbo.AUDIT_LOG_TRANSACTIONS WHERE AUDIT_LOG_TRANSACTION_ID = @AUDIT_LOG_TRANSACTION_ID
	END
	-- Restore @@IDENTITY Value  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_Activations]', @order='Last', @stmttype='UPDATE'
GO
