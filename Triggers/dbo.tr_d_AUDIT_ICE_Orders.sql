SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_ICE_Orders]
ON [dbo].[ICE_Orders]
FOR DELETE
NOT FOR REPLICATION
AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[ICE_Orders]
-- Author:       ApexSQL Software
-- Date:		 3/18/2010 5:59:10 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Orders]'
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
		'ICE_Orders',
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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Order_ID',
		CONVERT(nvarchar(4000), OLD.[Order_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Order_ID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Cust_ID',
		CONVERT(nvarchar(4000), OLD.[Cust_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Cust_ID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Company',
		CONVERT(nvarchar(4000), OLD.[Company], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Email',
		CONVERT(nvarchar(4000), OLD.[Email], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Country',
		CONVERT(nvarchar(4000), OLD.[Country], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Total',
		CONVERT(nvarchar(4000), OLD.[Total], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Total] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Invoice',
		CONVERT(nvarchar(4000), OLD.[Invoice], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Invoice] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Email_Ship',
		CONVERT(nvarchar(4000), OLD.[Email_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Email_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Company_Ship',
		CONVERT(nvarchar(4000), OLD.[Company_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Company_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'ShareIt_Purchase_ID',
		CONVERT(nvarchar(4000), OLD.[ShareIt_Purchase_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ShareIt_Purchase_ID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Order_ID]='+CONVERT(nvarchar(4000), OLD.[Order_ID], 0), '[Order_ID] Is Null')),
		'Sales_Person_ID',
		CONVERT(nvarchar(4000), OLD.[Sales_Person_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Order_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Sales_Person_ID] Is Not Null

	-- Lookup
	
	
	-- Restore @@IDENTITY Value
	DECLARE @maxprec AS varchar(2)
	SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
	EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_ICE_Orders]', @order='Last', @stmttype='DELETE'
GO
