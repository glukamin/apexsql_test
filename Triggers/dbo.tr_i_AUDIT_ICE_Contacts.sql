SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_i_AUDIT_ICE_Contacts]
ON [dbo].[ICE_Contacts]
FOR INSERT
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [dbo].[ICE_Contacts]
-- Author:       ApexSQL Software
-- Date:		 12/8/2009 1:23:51 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Contacts]'
	Select @ROWS_COUNT=count(*) from inserted
	Set @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

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
		2,	--	ACTION ID For INSERT
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
	

	
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Cust_ID',
		CONVERT(nvarchar(4000), NEW.[Cust_ID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Cust_ID] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Last_Name_Ship',
		CONVERT(nvarchar(4000), NEW.[Last_Name_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Last_Name_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'First_Name_Ship',
		CONVERT(nvarchar(4000), NEW.[First_Name_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[First_Name_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Email_Ship',
		CONVERT(nvarchar(4000), NEW.[Email_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Email_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Phone_Ship',
		CONVERT(nvarchar(4000), NEW.[Phone_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Phone_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Fax_Ship',
		CONVERT(nvarchar(4000), NEW.[Fax_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Fax_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Address1_Ship',
		CONVERT(nvarchar(4000), NEW.[Address1_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Address1_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Address2_Ship',
		CONVERT(nvarchar(4000), NEW.[Address2_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Address2_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'City_Ship',
		CONVERT(nvarchar(4000), NEW.[City_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[City_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'State_Ship',
		CONVERT(nvarchar(4000), NEW.[State_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[State_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Country_Ship',
		CONVERT(nvarchar(4000), NEW.[Country_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Country_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Zip_Ship',
		CONVERT(nvarchar(4000), NEW.[Zip_Ship], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Zip_Ship] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Is_active01',
		CONVERT(nvarchar(4000), NEW.[Is_active01], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Is_active01] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Created_By',
		CONVERT(nvarchar(4000), NEW.[Created_By], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Created_By] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Create_Date',
		CONVERT(nvarchar(4000), NEW.[Create_Date], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Create_Date] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Edited_By',
		CONVERT(nvarchar(4000), NEW.[Edited_By], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Edited_By] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Edit_Date',
		CONVERT(nvarchar(4000), NEW.[Edit_Date], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Edit_Date] Is Not Null
    
	INSERT INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), NEW.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Notes',
		CONVERT(nvarchar(4000), NEW.[Notes], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Contact_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Notes] Is Not Null
    
	
	-- Lookup 
	

	-- Restore @@IDENTITY Value 
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
	
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_i_AUDIT_ICE_Contacts]', @order='Last', @stmttype='INSERT'
GO
