SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_ICE_Customers]
ON [dbo].[ICE_Customers]
FOR DELETE
NOT FOR REPLICATION
AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[ICE_Customers]
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
	Select @ROWS_COUNT=count(*) from deleted
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
		3,	--	ACTION ID For DELETE
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
	


	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'First_Name',
		CONVERT(nvarchar(4000), OLD.[First_Name], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[First_Name] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Last_Name',
		CONVERT(nvarchar(4000), OLD.[Last_Name], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Last_Name] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Email',
		CONVERT(nvarchar(4000), OLD.[Email], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Email] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Password',
		CONVERT(nvarchar(4000), OLD.[Password], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Password] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Company',
		CONVERT(nvarchar(4000), OLD.[Company], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Company] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Phone',
		CONVERT(nvarchar(4000), OLD.[Phone], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Phone] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Fax',
		CONVERT(nvarchar(4000), OLD.[Fax], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Fax] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Address1',
		CONVERT(nvarchar(4000), OLD.[Address1], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Address1] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Address2',
		CONVERT(nvarchar(4000), OLD.[Address2], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Address2] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'City',
		CONVERT(nvarchar(4000), OLD.[City], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[City] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'State',
		CONVERT(nvarchar(4000), OLD.[State], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[State] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Country',
		CONVERT(nvarchar(4000), OLD.[Country], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Country] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Zip',
		CONVERT(nvarchar(4000), OLD.[Zip], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Zip] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Created_By',
		CONVERT(nvarchar(4000), OLD.[Created_By], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Created_By] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Create_Date',
		CONVERT(nvarchar(4000), OLD.[Create_Date], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Create_Date] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Edited_By',
		CONVERT(nvarchar(4000), OLD.[Edited_By], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Edited_By] Is Not Null

	INSERT
	INTO dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[Cust_ID]='+CONVERT(nvarchar(4000), OLD.[Cust_ID], 0), '[Cust_ID] Is Null')),
		'Edit_Date',
		CONVERT(nvarchar(4000), OLD.[Edit_Date], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Cust_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Edit_Date] Is Not Null

	-- Lookup
	
	
	-- Restore @@IDENTITY Value
	DECLARE @maxprec AS varchar(2)
	SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
	EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_ICE_Customers]', @order='Last', @stmttype='DELETE'
GO
