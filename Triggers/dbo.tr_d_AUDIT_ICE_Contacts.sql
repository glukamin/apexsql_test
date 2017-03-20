SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_ICE_Contacts]
ON [dbo].[ICE_Contacts]
FOR DELETE
NOT FOR REPLICATION
AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[ICE_Contacts]
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
		'ICE_Contacts',
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Cust_ID',
		CONVERT(nvarchar(4000), OLD.[Cust_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Last_Name_Ship',
		CONVERT(nvarchar(4000), OLD.[Last_Name_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Last_Name_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'First_Name_Ship',
		CONVERT(nvarchar(4000), OLD.[First_Name_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[First_Name_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Email_Ship',
		CONVERT(nvarchar(4000), OLD.[Email_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Phone_Ship',
		CONVERT(nvarchar(4000), OLD.[Phone_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Phone_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Fax_Ship',
		CONVERT(nvarchar(4000), OLD.[Fax_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Fax_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Address1_Ship',
		CONVERT(nvarchar(4000), OLD.[Address1_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Address1_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Address2_Ship',
		CONVERT(nvarchar(4000), OLD.[Address2_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Address2_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'City_Ship',
		CONVERT(nvarchar(4000), OLD.[City_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[City_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'State_Ship',
		CONVERT(nvarchar(4000), OLD.[State_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[State_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Country_Ship',
		CONVERT(nvarchar(4000), OLD.[Country_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Country_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Zip_Ship',
		CONVERT(nvarchar(4000), OLD.[Zip_Ship], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Zip_Ship] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Is_active01',
		CONVERT(nvarchar(4000), OLD.[Is_active01], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Is_active01] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Created_By',
		CONVERT(nvarchar(4000), OLD.[Created_By], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Create_Date',
		CONVERT(nvarchar(4000), OLD.[Create_Date], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Edited_By',
		CONVERT(nvarchar(4000), OLD.[Edited_By], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Edit_Date',
		CONVERT(nvarchar(4000), OLD.[Edit_Date], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Edit_Date] Is Not Null

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
		convert(nvarchar(1500), IsNull('[Contact_ID]='+CONVERT(nvarchar(4000), OLD.[Contact_ID], 0), '[Contact_ID] Is Null')),
		'Notes',
		CONVERT(nvarchar(4000), OLD.[Notes], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[Contact_ID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Notes] Is Not Null

	-- Lookup
	
	
	-- Restore @@IDENTITY Value
	DECLARE @maxprec AS varchar(2)
	SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
	EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_ICE_Contacts]', @order='Last', @stmttype='DELETE'
GO
