SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_SalesLeads]
ON [dbo].[ICE_SalesLeads]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_SalesLeads]
-- Author:       ApexSQL Software
-- Date:		 12/8/2009 1:23:51 AM
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

	--Set @TABLE_NAME = '[dbo].[ICE_SalesLeads]'
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
		'ICE_SalesLeads',
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
	
	If UPDATE([First_Name])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'First_Name',
			CONVERT(nvarchar(4000), OLD.[First_Name], 0),
			CONVERT(nvarchar(4000), NEW.[First_Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[First_Name] <>
					OLD.[First_Name]
				) Or
			
				(
					NEW.[First_Name] Is Null And
					OLD.[First_Name] Is Not Null
				) Or
				(
					NEW.[First_Name] Is Not Null And
					OLD.[First_Name] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Last_Name])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Last_Name',
			CONVERT(nvarchar(4000), OLD.[Last_Name], 0),
			CONVERT(nvarchar(4000), NEW.[Last_Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Last_Name] <>
					OLD.[Last_Name]
				) Or
			
				(
					NEW.[Last_Name] Is Null And
					OLD.[Last_Name] Is Not Null
				) Or
				(
					NEW.[Last_Name] Is Not Null And
					OLD.[Last_Name] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Phone])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Phone',
			CONVERT(nvarchar(4000), OLD.[Phone], 0),
			CONVERT(nvarchar(4000), NEW.[Phone], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Phone] <>
					OLD.[Phone]
				) Or
			
				(
					NEW.[Phone] Is Null And
					OLD.[Phone] Is Not Null
				) Or
				(
					NEW.[Phone] Is Not Null And
					OLD.[Phone] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Email])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Email',
			CONVERT(nvarchar(4000), OLD.[Email], 0),
			CONVERT(nvarchar(4000), NEW.[Email], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Email] <>
					OLD.[Email]
				) Or
			
				(
					NEW.[Email] Is Null And
					OLD.[Email] Is Not Null
				) Or
				(
					NEW.[Email] Is Not Null And
					OLD.[Email] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Country])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Country',
			CONVERT(nvarchar(4000), OLD.[Country], 0),
			CONVERT(nvarchar(4000), NEW.[Country], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Country] <>
					OLD.[Country]
				) Or
			
				(
					NEW.[Country] Is Null And
					OLD.[Country] Is Not Null
				) Or
				(
					NEW.[Country] Is Not Null And
					OLD.[Country] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Zip])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Zip',
			CONVERT(nvarchar(4000), OLD.[Zip], 0),
			CONVERT(nvarchar(4000), NEW.[Zip], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Zip] <>
					OLD.[Zip]
				) Or
			
				(
					NEW.[Zip] Is Null And
					OLD.[Zip] Is Not Null
				) Or
				(
					NEW.[Zip] Is Not Null And
					OLD.[Zip] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Author_ID])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Author_ID',
			CONVERT(nvarchar(4000), OLD.[Author_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Author_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Author_ID] <>
					OLD.[Author_ID]
				) Or
			
				(
					NEW.[Author_ID] Is Null And
					OLD.[Author_ID] Is Not Null
				) Or
				(
					NEW.[Author_ID] Is Not Null And
					OLD.[Author_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Date_Added])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Date_Added',
			CONVERT(nvarchar(4000), OLD.[Date_Added], 121),
			CONVERT(nvarchar(4000), NEW.[Date_Added], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Date_Added] <>
					OLD.[Date_Added]
				) Or
			
				(
					NEW.[Date_Added] Is Null And
					OLD.[Date_Added] Is Not Null
				) Or
				(
					NEW.[Date_Added] Is Not Null And
					OLD.[Date_Added] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Date_Submitted_To_SF])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Date_Submitted_To_SF',
			CONVERT(nvarchar(4000), OLD.[Date_Submitted_To_SF], 121),
			CONVERT(nvarchar(4000), NEW.[Date_Submitted_To_SF], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Date_Submitted_To_SF] <>
					OLD.[Date_Submitted_To_SF]
				) Or
			
				(
					NEW.[Date_Submitted_To_SF] Is Null And
					OLD.[Date_Submitted_To_SF] Is Not Null
				) Or
				(
					NEW.[Date_Submitted_To_SF] Is Not Null And
					OLD.[Date_Submitted_To_SF] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Lead_Source])
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
		    convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesLeadId], NEW.[SalesLeadId]), 0), '[SalesLeadId] Is Null')),
		    'Lead_Source',
			CONVERT(nvarchar(4000), OLD.[Lead_Source], 0),
			CONVERT(nvarchar(4000), NEW.[Lead_Source], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesLeadId], 0)=CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0) or (NEW.[SalesLeadId] Is Null and OLD.[SalesLeadId] Is Null))
			where (
			
			
				(
					NEW.[Lead_Source] <>
					OLD.[Lead_Source]
				) Or
			
				(
					NEW.[Lead_Source] Is Null And
					OLD.[Lead_Source] Is Not Null
				) Or
				(
					NEW.[Lead_Source] Is Not Null And
					OLD.[Lead_Source] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_SalesLeads]', @order='Last', @stmttype='UPDATE'
GO
