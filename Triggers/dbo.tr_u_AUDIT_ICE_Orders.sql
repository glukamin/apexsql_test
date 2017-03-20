SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_Orders]
ON [dbo].[ICE_Orders]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_Orders]
-- Author:       ApexSQL Software
-- Date:		 3/18/2010 5:59:10 AM
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

	--Set @TABLE_NAME = '[dbo].[ICE_Orders]'
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
		'ICE_Orders',
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
	
	If UPDATE([Order_ID])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Order_ID',
			CONVERT(nvarchar(4000), OLD.[Order_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Order_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			WHERE (
			
			
				(
					NEW.[Order_ID] <>
					OLD.[Order_ID]
				) Or
			
				(
					NEW.[Order_ID] Is Null And
					OLD.[Order_ID] Is Not Null
				) Or
				(
					NEW.[Order_ID] Is Not Null And
					OLD.[Order_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Cust_ID])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Cust_ID',
			CONVERT(nvarchar(4000), OLD.[Cust_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Cust_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Cust_ID] <>
					OLD.[Cust_ID]
				) Or
			
				(
					NEW.[Cust_ID] Is Null And
					OLD.[Cust_ID] Is Not Null
				) Or
				(
					NEW.[Cust_ID] Is Not Null And
					OLD.[Cust_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Company])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Company',
			CONVERT(nvarchar(4000), OLD.[Company], 0),
			CONVERT(nvarchar(4000), NEW.[Company], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Company] <>
					OLD.[Company]
				) Or
			
				(
					NEW.[Company] Is Null And
					OLD.[Company] Is Not Null
				) Or
				(
					NEW.[Company] Is Not Null And
					OLD.[Company] Is Null
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Email',
			CONVERT(nvarchar(4000), OLD.[Email], 0),
			CONVERT(nvarchar(4000), NEW.[Email], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Country',
			CONVERT(nvarchar(4000), OLD.[Country], 0),
			CONVERT(nvarchar(4000), NEW.[Country], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
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
	
	If UPDATE([Total])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Total',
			CONVERT(nvarchar(4000), OLD.[Total], 2),
			CONVERT(nvarchar(4000), NEW.[Total], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Total] <>
					OLD.[Total]
				) Or
			
				(
					NEW.[Total] Is Null And
					OLD.[Total] Is Not Null
				) Or
				(
					NEW.[Total] Is Not Null And
					OLD.[Total] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Invoice])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Invoice',
			CONVERT(nvarchar(4000), OLD.[Invoice], 0),
			CONVERT(nvarchar(4000), NEW.[Invoice], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Invoice] <>
					OLD.[Invoice]
				) Or
			
				(
					NEW.[Invoice] Is Null And
					OLD.[Invoice] Is Not Null
				) Or
				(
					NEW.[Invoice] Is Not Null And
					OLD.[Invoice] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Email_Ship])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Email_Ship',
			CONVERT(nvarchar(4000), OLD.[Email_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Email_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Email_Ship] <>
					OLD.[Email_Ship]
				) Or
			
				(
					NEW.[Email_Ship] Is Null And
					OLD.[Email_Ship] Is Not Null
				) Or
				(
					NEW.[Email_Ship] Is Not Null And
					OLD.[Email_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Company_Ship])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Company_Ship',
			CONVERT(nvarchar(4000), OLD.[Company_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Company_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Company_Ship] <>
					OLD.[Company_Ship]
				) Or
			
				(
					NEW.[Company_Ship] Is Null And
					OLD.[Company_Ship] Is Not Null
				) Or
				(
					NEW.[Company_Ship] Is Not Null And
					OLD.[Company_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ShareIt_Purchase_ID])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'ShareIt_Purchase_ID',
			CONVERT(nvarchar(4000), OLD.[ShareIt_Purchase_ID], 0),
			CONVERT(nvarchar(4000), NEW.[ShareIt_Purchase_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[ShareIt_Purchase_ID] <>
					OLD.[ShareIt_Purchase_ID]
				) Or
			
				(
					NEW.[ShareIt_Purchase_ID] Is Null And
					OLD.[ShareIt_Purchase_ID] Is Not Null
				) Or
				(
					NEW.[ShareIt_Purchase_ID] Is Not Null And
					OLD.[ShareIt_Purchase_ID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Sales_Person_ID])
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
		    convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Order_ID], NEW.[Order_ID]), 0), '[Order_ID] Is Null')),
		    'Sales_Person_ID',
			CONVERT(nvarchar(4000), OLD.[Sales_Person_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Sales_Person_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Order_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Order_ID], 0)=CONVERT(nvarchar(4000), OLD.[Order_ID], 0) or (NEW.[Order_ID] Is Null and OLD.[Order_ID] Is Null))
			where (
			
			
				(
					NEW.[Sales_Person_ID] <>
					OLD.[Sales_Person_ID]
				) Or
			
				(
					NEW.[Sales_Person_ID] Is Null And
					OLD.[Sales_Person_ID] Is Not Null
				) Or
				(
					NEW.[Sales_Person_ID] Is Not Null And
					OLD.[Sales_Person_ID] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_Orders]', @order='Last', @stmttype='UPDATE'
GO
