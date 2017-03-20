SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_ICE_SalesLeads]
ON [dbo].[ICE_SalesLeads]
FOR DELETE
NOT FOR REPLICATION
AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[ICE_SalesLeads]
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

	--Set @TABLE_NAME = '[dbo].[ICE_SalesLeads]'
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
		'ICE_SalesLeads',
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'First_Name',
		CONVERT(nvarchar(4000), OLD.[First_Name], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Last_Name',
		CONVERT(nvarchar(4000), OLD.[Last_Name], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Phone',
		CONVERT(nvarchar(4000), OLD.[Phone], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Email',
		CONVERT(nvarchar(4000), OLD.[Email], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Country',
		CONVERT(nvarchar(4000), OLD.[Country], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Zip',
		CONVERT(nvarchar(4000), OLD.[Zip], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Author_ID',
		CONVERT(nvarchar(4000), OLD.[Author_ID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
	FROM deleted OLD
	WHERE
		OLD.[Author_ID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Date_Added',
		CONVERT(nvarchar(4000), OLD.[Date_Added], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
	FROM deleted OLD
	WHERE
		OLD.[Date_Added] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Date_Submitted_To_SF',
		CONVERT(nvarchar(4000), OLD.[Date_Submitted_To_SF], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
	FROM deleted OLD
	WHERE
		OLD.[Date_Submitted_To_SF] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesLeadId]='+CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0), '[SalesLeadId] Is Null')),
		'Lead_Source',
		CONVERT(nvarchar(4000), OLD.[Lead_Source], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesLeadId], 0))
	FROM deleted OLD
	WHERE
		OLD.[Lead_Source] Is Not Null

	-- Lookup
	
	
	-- Restore @@IDENTITY Value
	DECLARE @maxprec AS varchar(2)
	SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
	EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_ICE_SalesLeads]', @order='Last', @stmttype='DELETE'
GO
