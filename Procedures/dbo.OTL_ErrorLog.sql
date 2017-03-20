SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:-    Pankaj Sutradhar
-- Create date: 09/06/2007
-- Description:	logs the error
-- =============================================

CREATE PROCEDURE dbo.OTL_ErrorLog
(
	@Timestamp datetime,
	@MachineName varchar(256),
	@WindowsIdentity varchar(256),
	@ThreadIdentity varchar(50),
	@Type varchar(256),
	@Message text,
	@TargetSite varchar(256),
	@Source varchar(256),
	@StackTrace text,
	@AdditionalInfo text
)
AS
	INSERT INTO OTL_Errors ([Timestamp], MachineName, WindowsIdentity, ThreadIdentity, Type, Message, TargetSite, Source, StackTrace, AdditionalInfo)
	VALUES (@Timestamp, @MachineName, @WindowsIdentity, @ThreadIdentity, @Type, @Message, @TargetSite, @Source, @StackTrace, @AdditionalInfo)
	RETURN
GO
GRANT EXECUTE
	ON [dbo].[OTL_ErrorLog]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_ErrorLog]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_ErrorLog]
	TO [davor.dumeljic]
GO
