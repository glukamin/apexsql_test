SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_Customers]
ON [dbo].[ICE_Customers]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_Customers]
-- Author:       ApexSQL Software
-- Date:		 12/4/2009 4:48:54 PM
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

	--Set @TABLE_NAME = '[dbo].[ICE_Customers]'
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
		'ICE_Customers',
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'First_Name',
			CONVERT(nvarchar(4000), OLD.[First_Name], 0),
			CONVERT(nvarchar(4000), NEW.[First_Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Last_Name',
			CONVERT(nvarchar(4000), OLD.[Last_Name], 0),
			CONVERT(nvarchar(4000), NEW.[Last_Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Email',
			CONVERT(nvarchar(4000), OLD.[Email], 0),
			CONVERT(nvarchar(4000), NEW.[Email], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
	
	If UPDATE([Password])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Password',
			CONVERT(nvarchar(4000), OLD.[Password], 0),
			CONVERT(nvarchar(4000), NEW.[Password], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Password] <>
					OLD.[Password]
				) Or
			
				(
					NEW.[Password] Is Null And
					OLD.[Password] Is Not Null
				) Or
				(
					NEW.[Password] Is Not Null And
					OLD.[Password] Is Null
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Company',
			CONVERT(nvarchar(4000), OLD.[Company], 0),
			CONVERT(nvarchar(4000), NEW.[Company], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Phone',
			CONVERT(nvarchar(4000), OLD.[Phone], 0),
			CONVERT(nvarchar(4000), NEW.[Phone], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
	
	If UPDATE([Fax])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Fax',
			CONVERT(nvarchar(4000), OLD.[Fax], 0),
			CONVERT(nvarchar(4000), NEW.[Fax], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Fax] <>
					OLD.[Fax]
				) Or
			
				(
					NEW.[Fax] Is Null And
					OLD.[Fax] Is Not Null
				) Or
				(
					NEW.[Fax] Is Not Null And
					OLD.[Fax] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Address1])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Address1',
			CONVERT(nvarchar(4000), OLD.[Address1], 0),
			CONVERT(nvarchar(4000), NEW.[Address1], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Address1] <>
					OLD.[Address1]
				) Or
			
				(
					NEW.[Address1] Is Null And
					OLD.[Address1] Is Not Null
				) Or
				(
					NEW.[Address1] Is Not Null And
					OLD.[Address1] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Address2])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Address2',
			CONVERT(nvarchar(4000), OLD.[Address2], 0),
			CONVERT(nvarchar(4000), NEW.[Address2], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Address2] <>
					OLD.[Address2]
				) Or
			
				(
					NEW.[Address2] Is Null And
					OLD.[Address2] Is Not Null
				) Or
				(
					NEW.[Address2] Is Not Null And
					OLD.[Address2] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([City])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'City',
			CONVERT(nvarchar(4000), OLD.[City], 0),
			CONVERT(nvarchar(4000), NEW.[City], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[City] <>
					OLD.[City]
				) Or
			
				(
					NEW.[City] Is Null And
					OLD.[City] Is Not Null
				) Or
				(
					NEW.[City] Is Not Null And
					OLD.[City] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([State])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'State',
			CONVERT(nvarchar(4000), OLD.[State], 0),
			CONVERT(nvarchar(4000), NEW.[State], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[State] <>
					OLD.[State]
				) Or
			
				(
					NEW.[State] Is Null And
					OLD.[State] Is Not Null
				) Or
				(
					NEW.[State] Is Not Null And
					OLD.[State] Is Null
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Country',
			CONVERT(nvarchar(4000), OLD.[Country], 0),
			CONVERT(nvarchar(4000), NEW.[Country], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Zip',
			CONVERT(nvarchar(4000), OLD.[Zip], 0),
			CONVERT(nvarchar(4000), NEW.[Zip], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
	
	If UPDATE([Created_By])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Created_By',
			CONVERT(nvarchar(4000), OLD.[Created_By], 0),
			CONVERT(nvarchar(4000), NEW.[Created_By], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Created_By] <>
					OLD.[Created_By]
				) Or
			
				(
					NEW.[Created_By] Is Null And
					OLD.[Created_By] Is Not Null
				) Or
				(
					NEW.[Created_By] Is Not Null And
					OLD.[Created_By] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Create_Date])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Create_Date',
			CONVERT(nvarchar(4000), OLD.[Create_Date], 121),
			CONVERT(nvarchar(4000), NEW.[Create_Date], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Create_Date] <>
					OLD.[Create_Date]
				) Or
			
				(
					NEW.[Create_Date] Is Null And
					OLD.[Create_Date] Is Not Null
				) Or
				(
					NEW.[Create_Date] Is Not Null And
					OLD.[Create_Date] Is Null
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Edited_By',
			CONVERT(nvarchar(4000), OLD.[Edited_By], 0),
			CONVERT(nvarchar(4000), NEW.[Edited_By], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
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
	
	If UPDATE([Edit_Date])
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
		    convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Cust_ID], NEW.[Cust_ID]), 0), '[Cust_ID] Is Null')),
		    'Edit_Date',
			CONVERT(nvarchar(4000), OLD.[Edit_Date], 121),
			CONVERT(nvarchar(4000), NEW.[Edit_Date], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Cust_ID], 0)=CONVERT(nvarchar(4000), OLD.[Cust_ID], 0) or (NEW.[Cust_ID] Is Null and OLD.[Cust_ID] Is Null))
			where (
			
			
				(
					NEW.[Edit_Date] <>
					OLD.[Edit_Date]
				) Or
			
				(
					NEW.[Edit_Date] Is Null And
					OLD.[Edit_Date] Is Not Null
				) Or
				(
					NEW.[Edit_Date] Is Not Null And
					OLD.[Edit_Date] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_Customers]', @order='Last', @stmttype='UPDATE'
GO
