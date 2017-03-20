SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_Major_Builds]
ON [dbo].[ICE_Major_Builds]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_Major_Builds]
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

	--Set @TABLE_NAME = '[dbo].[ICE_Major_Builds]'
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
		'ICE_Major_Builds',
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
	
	If UPDATE([Major_Build_ID])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'Major_Build_ID',
			CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			WHERE (
			
			
				(
					NEW.[Major_Build_ID] <>
					OLD.[Major_Build_ID]
				) Or
			
				(
					NEW.[Major_Build_ID] Is Null And
					OLD.[Major_Build_ID] Is Not Null
				) Or
				(
					NEW.[Major_Build_ID] Is Not Null And
					OLD.[Major_Build_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Product_ID])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'Product_ID',
			CONVERT(nvarchar(4000), OLD.[Product_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Product_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[Product_ID] <>
					OLD.[Product_ID]
				) Or
			
				(
					NEW.[Product_ID] Is Null And
					OLD.[Product_ID] Is Not Null
				) Or
				(
					NEW.[Product_ID] Is Not Null And
					OLD.[Product_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([A_Key])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'A_Key',
			CONVERT(nvarchar(4000), OLD.[A_Key], 0),
			CONVERT(nvarchar(4000), NEW.[A_Key], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[A_Key] <>
					OLD.[A_Key]
				) Or
			
				(
					NEW.[A_Key] Is Null And
					OLD.[A_Key] Is Not Null
				) Or
				(
					NEW.[A_Key] Is Not Null And
					OLD.[A_Key] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([E_Key])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'E_Key',
			CONVERT(nvarchar(4000), OLD.[E_Key], 0),
			CONVERT(nvarchar(4000), NEW.[E_Key], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[E_Key] <>
					OLD.[E_Key]
				) Or
			
				(
					NEW.[E_Key] Is Null And
					OLD.[E_Key] Is Not Null
				) Or
				(
					NEW.[E_Key] Is Not Null And
					OLD.[E_Key] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([N_Key])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'N_Key',
			CONVERT(nvarchar(4000), OLD.[N_Key], 0),
			CONVERT(nvarchar(4000), NEW.[N_Key], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[N_Key] <>
					OLD.[N_Key]
				) Or
			
				(
					NEW.[N_Key] Is Null And
					OLD.[N_Key] Is Not Null
				) Or
				(
					NEW.[N_Key] Is Not Null And
					OLD.[N_Key] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Edited_By])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'Edited_By',
			CONVERT(nvarchar(4000), OLD.[Edited_By], 0),
			CONVERT(nvarchar(4000), NEW.[Edited_By], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[Edited_By] <>
					OLD.[Edited_By]
				) Or
			
				(
					NEW.[Edited_By] Is Null And
					OLD.[Edited_By] Is Not Null
				) Or
				(
					NEW.[Edited_By] Is Not Null And
					OLD.[Edited_By] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Major_Build_Version])
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
		    convert(nvarchar(1500), IsNull('[Major_Build_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Major_Build_ID], NEW.[Major_Build_ID]), 0), '[Major_Build_ID] Is Null')),
		    'Major_Build_Version',
			CONVERT(nvarchar(4000), OLD.[Major_Build_Version], 0),
			CONVERT(nvarchar(4000), NEW.[Major_Build_Version], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Major_Build_ID], 0)=CONVERT(nvarchar(4000), OLD.[Major_Build_ID], 0) or (NEW.[Major_Build_ID] Is Null and OLD.[Major_Build_ID] Is Null))
			where (
			
			
				(
					NEW.[Major_Build_Version] <>
					OLD.[Major_Build_Version]
				) Or
			
				(
					NEW.[Major_Build_Version] Is Null And
					OLD.[Major_Build_Version] Is Not Null
				) Or
				(
					NEW.[Major_Build_Version] Is Not Null And
					OLD.[Major_Build_Version] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_Major_Builds]', @order='Last', @stmttype='UPDATE'
GO
