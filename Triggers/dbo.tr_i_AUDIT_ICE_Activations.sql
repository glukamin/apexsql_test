SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_i_AUDIT_ICE_Activations]
ON [dbo].[ICE_Activations]
FOR INSERT
NOT FOR REPLICATION
As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [dbo].[ICE_Activations]
-- Author:       ApexSQL Software
-- Date:		 1/9/2009 10:47:26 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int
 
	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[ICE_Activations]'
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
		'ICE_Activations',
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
		convert(nvarchar(1500), IsNull('[Activation_ID]='+CONVERT(nvarchar(4000), NEW.[Activation_ID], 0), '[Activation_ID] Is Null')),
		'Activation_ID',
		CONVERT(nvarchar(4000), NEW.[Activation_ID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Activation_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Activation_ID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[Activation_ID]='+CONVERT(nvarchar(4000), NEW.[Activation_ID], 0), '[Activation_ID] Is Null')),
		'Unlock_Code_ID',
		CONVERT(nvarchar(4000), NEW.[Unlock_Code_ID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[Activation_ID], 0))
	FROM inserted NEW
	WHERE NEW.[Unlock_Code_ID] Is Not Null
    
	
	-- Lookup 
	

	-- Restore @@IDENTITY Value 
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
	
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_i_AUDIT_ICE_Activations]', @order='Last', @stmttype='INSERT'
GO
