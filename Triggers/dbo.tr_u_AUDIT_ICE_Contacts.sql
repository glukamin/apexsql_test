SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ICE_Contacts]
ON [dbo].[ICE_Contacts]
FOR UPDATE
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ICE_Contacts]
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

	--Set @TABLE_NAME = '[dbo].[ICE_Contacts]'
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
		'ICE_Contacts',
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Cust_ID',
			CONVERT(nvarchar(4000), OLD.[Cust_ID], 0),
			CONVERT(nvarchar(4000), NEW.[Cust_ID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
	
	If UPDATE([Last_Name_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Last_Name_Ship',
			CONVERT(nvarchar(4000), OLD.[Last_Name_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Last_Name_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Last_Name_Ship] <>
					OLD.[Last_Name_Ship]
				) Or
			
				(
					NEW.[Last_Name_Ship] Is Null And
					OLD.[Last_Name_Ship] Is Not Null
				) Or
				(
					NEW.[Last_Name_Ship] Is Not Null And
					OLD.[Last_Name_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([First_Name_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'First_Name_Ship',
			CONVERT(nvarchar(4000), OLD.[First_Name_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[First_Name_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[First_Name_Ship] <>
					OLD.[First_Name_Ship]
				) Or
			
				(
					NEW.[First_Name_Ship] Is Null And
					OLD.[First_Name_Ship] Is Not Null
				) Or
				(
					NEW.[First_Name_Ship] Is Not Null And
					OLD.[First_Name_Ship] Is Null
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Email_Ship',
			CONVERT(nvarchar(4000), OLD.[Email_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Email_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
	
	If UPDATE([Phone_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Phone_Ship',
			CONVERT(nvarchar(4000), OLD.[Phone_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Phone_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Phone_Ship] <>
					OLD.[Phone_Ship]
				) Or
			
				(
					NEW.[Phone_Ship] Is Null And
					OLD.[Phone_Ship] Is Not Null
				) Or
				(
					NEW.[Phone_Ship] Is Not Null And
					OLD.[Phone_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Fax_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Fax_Ship',
			CONVERT(nvarchar(4000), OLD.[Fax_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Fax_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Fax_Ship] <>
					OLD.[Fax_Ship]
				) Or
			
				(
					NEW.[Fax_Ship] Is Null And
					OLD.[Fax_Ship] Is Not Null
				) Or
				(
					NEW.[Fax_Ship] Is Not Null And
					OLD.[Fax_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Address1_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Address1_Ship',
			CONVERT(nvarchar(4000), OLD.[Address1_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Address1_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Address1_Ship] <>
					OLD.[Address1_Ship]
				) Or
			
				(
					NEW.[Address1_Ship] Is Null And
					OLD.[Address1_Ship] Is Not Null
				) Or
				(
					NEW.[Address1_Ship] Is Not Null And
					OLD.[Address1_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Address2_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Address2_Ship',
			CONVERT(nvarchar(4000), OLD.[Address2_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Address2_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Address2_Ship] <>
					OLD.[Address2_Ship]
				) Or
			
				(
					NEW.[Address2_Ship] Is Null And
					OLD.[Address2_Ship] Is Not Null
				) Or
				(
					NEW.[Address2_Ship] Is Not Null And
					OLD.[Address2_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([City_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'City_Ship',
			CONVERT(nvarchar(4000), OLD.[City_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[City_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[City_Ship] <>
					OLD.[City_Ship]
				) Or
			
				(
					NEW.[City_Ship] Is Null And
					OLD.[City_Ship] Is Not Null
				) Or
				(
					NEW.[City_Ship] Is Not Null And
					OLD.[City_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([State_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'State_Ship',
			CONVERT(nvarchar(4000), OLD.[State_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[State_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[State_Ship] <>
					OLD.[State_Ship]
				) Or
			
				(
					NEW.[State_Ship] Is Null And
					OLD.[State_Ship] Is Not Null
				) Or
				(
					NEW.[State_Ship] Is Not Null And
					OLD.[State_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Country_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Country_Ship',
			CONVERT(nvarchar(4000), OLD.[Country_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Country_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Country_Ship] <>
					OLD.[Country_Ship]
				) Or
			
				(
					NEW.[Country_Ship] Is Null And
					OLD.[Country_Ship] Is Not Null
				) Or
				(
					NEW.[Country_Ship] Is Not Null And
					OLD.[Country_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Zip_Ship])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Zip_Ship',
			CONVERT(nvarchar(4000), OLD.[Zip_Ship], 0),
			CONVERT(nvarchar(4000), NEW.[Zip_Ship], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Zip_Ship] <>
					OLD.[Zip_Ship]
				) Or
			
				(
					NEW.[Zip_Ship] Is Null And
					OLD.[Zip_Ship] Is Not Null
				) Or
				(
					NEW.[Zip_Ship] Is Not Null And
					OLD.[Zip_Ship] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Is_active01])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Is_active01',
			CONVERT(nvarchar(4000), OLD.[Is_active01], 0),
			CONVERT(nvarchar(4000), NEW.[Is_active01], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Is_active01] <>
					OLD.[Is_active01]
				) Or
			
				(
					NEW.[Is_active01] Is Null And
					OLD.[Is_active01] Is Not Null
				) Or
				(
					NEW.[Is_active01] Is Not Null And
					OLD.[Is_active01] Is Null
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Created_By',
			CONVERT(nvarchar(4000), OLD.[Created_By], 0),
			CONVERT(nvarchar(4000), NEW.[Created_By], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Create_Date',
			CONVERT(nvarchar(4000), OLD.[Create_Date], 121),
			CONVERT(nvarchar(4000), NEW.[Create_Date], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Edited_By',
			CONVERT(nvarchar(4000), OLD.[Edited_By], 0),
			CONVERT(nvarchar(4000), NEW.[Edited_By], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Edit_Date',
			CONVERT(nvarchar(4000), OLD.[Edit_Date], 121),
			CONVERT(nvarchar(4000), NEW.[Edit_Date], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
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
	
	If UPDATE([Notes])
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
		    convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), IsNull(OLD.[Contact_ID], NEW.[Contact_ID]), 0), '[Contact_ID] Is Null')),
		    'Notes',
			CONVERT(nvarchar(4000), OLD.[Notes], 0),
			CONVERT(nvarchar(4000), NEW.[Notes], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[Contact_ID], 0)=CONVERT(nvarchar(4000), OLD.[Contact_ID], 0) or (NEW.[Contact_ID] Is Null and OLD.[Contact_ID] Is Null))
			where (
			
			
				(
					NEW.[Notes] <>
					OLD.[Notes]
				) Or
			
				(
					NEW.[Notes] Is Null And
					OLD.[Notes] Is Not Null
				) Or
				(
					NEW.[Notes] Is Not Null And
					OLD.[Notes] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ICE_Contacts]', @order='Last', @stmttype='UPDATE'
GO
