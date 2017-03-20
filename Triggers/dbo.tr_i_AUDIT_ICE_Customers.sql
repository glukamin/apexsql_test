SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_i_AUDIT_ICE_Customers]
ON [dbo].[ICE_Customers]
FOR INSERT
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [dbo].[ICE_Customers]
-- Author:       ApexSQL Software
-- Date:		 12/4/2009 4:48:54 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Customers]'
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
		'ICE_Customers',
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'First_Name',
		CONVERT(nvarchar(4000), NEW.[First_Name], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[First_Name] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Last_Name',
		CONVERT(nvarchar(4000), NEW.[Last_Name], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Last_Name] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Email',
		CONVERT(nvarchar(4000), NEW.[Email], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Email] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Password',
		CONVERT(nvarchar(4000), NEW.[Password], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Password] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Company',
		CONVERT(nvarchar(4000), NEW.[Company], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Company] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Phone',
		CONVERT(nvarchar(4000), NEW.[Phone], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Phone] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Fax',
		CONVERT(nvarchar(4000), NEW.[Fax], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Fax] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Address1',
		CONVERT(nvarchar(4000), NEW.[Address1], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Address1] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Address2',
		CONVERT(nvarchar(4000), NEW.[Address2], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Address2] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'City',
		CONVERT(nvarchar(4000), NEW.[City], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[City] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'State',
		CONVERT(nvarchar(4000), NEW.[State], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[State] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Country',
		CONVERT(nvarchar(4000), NEW.[Country], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Country] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Zip',
		CONVERT(nvarchar(4000), NEW.[Zip], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Zip] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Created_By',
		CONVERT(nvarchar(4000), NEW.[Created_By], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Create_Date',
		CONVERT(nvarchar(4000), NEW.[Create_Date], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Edited_By',
		CONVERT(nvarchar(4000), NEW.[Edited_By], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), NEW.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Edit_Date',
		CONVERT(nvarchar(4000), NEW.[Edit_Date], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Cust_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Edit_Date] Is Not Null
    
	
	-- Lookup 
	

	-- Restore @@IDENTITY Value 
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
	
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_i_AUDIT_ICE_Customers]', @order='Last', @stmttype='INSERT'
GO
