SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_ICE_Products]
ON [dbo].[ICE_Products]
FOR DELETE
NOT FOR REPLICATION
AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[ICE_Products]
-- Author:       ApexSQL Software
-- Date:		 3/16/2009 2:06:04 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Products]'
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
		'ICE_Products',
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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'Product_ID',
		CONVERT(nvarchar(4000), OLD.[Product_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Product_ID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'Price',
		CONVERT(nvarchar(4000), OLD.[Price], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Price] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'A_Key',
		CONVERT(nvarchar(4000), OLD.[A_Key], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[A_Key] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'E_Key',
		CONVERT(nvarchar(4000), OLD.[E_Key], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[E_Key] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'N_Key',
		CONVERT(nvarchar(4000), OLD.[N_Key], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[N_Key] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'Product_Alias',
		CONVERT(nvarchar(4000), OLD.[Product_Alias], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Product_Alias] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'Is_Private',
		CONVERT(nvarchar(4000), OLD.[Is_Private], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Is_Private] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Product_ID]='+CONVERT(nvarchar(4000), OLD.[Product_ID], 0), '[Product_ID] Is Null')),
		'Default_Major_Build_Version',
		CONVERT(nvarchar(4000), OLD.[Default_Major_Build_Version], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Product_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Default_Major_Build_Version] Is Not Null

	-- Lookup
	
	
	-- Restore @@IDENTITY Value
	DECLARE @maxprec AS varchar(2)
	SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
	EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_ICE_Products]', @order='Last', @stmttype='DELETE'
GO
