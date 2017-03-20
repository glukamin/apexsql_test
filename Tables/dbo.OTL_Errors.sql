SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTL_Errors] (
		[ID]                  [int] IDENTITY(1, 1) NOT NULL,
		[Timestamp]           [datetime] NOT NULL,
		[MachineName]         [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[WindowsIdentity]     [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ThreadIdentity]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Type]                [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Message]             [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TargetSite]          [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Source]              [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StackTrace]          [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AdditionalInfo]      [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Errors] SET (LOCK_ESCALATION = TABLE)
GO
