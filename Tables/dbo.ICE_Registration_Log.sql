SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Registration_Log] (
		[Registration_Log_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]                    [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]                   [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone]                   [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Login_Email]             [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Password]                [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Action_Successful]       [bit] NULL,
		[Post_Date]               [datetime] NULL,
		[Error_Message]           [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Session_ID]              [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Is_Login]                [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Registration_Log]
	ADD
	CONSTRAINT [PK_ICE_Registration_Log]
	PRIMARY KEY
	CLUSTERED
	([Registration_Log_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Registration_Log] SET (LOCK_ESCALATION = TABLE)
GO
