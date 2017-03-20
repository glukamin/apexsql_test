SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Request_A_Demo] (
		[DemoID]          [int] IDENTITY(1, 1) NOT NULL,
		[Product]         [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FirstName]       [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LastName]        [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]           [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company]         [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone]           [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[NoServers]       [int] NULL,
		[NoDevDba]        [int] NULL,
		[Interest]        [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RequestDate]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Request_A_Demo]
	ADD
	CONSTRAINT [PK__ICE_Requ__977B8095385F975D]
	PRIMARY KEY
	CLUSTERED
	([DemoID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Request_A_Demo] SET (LOCK_ESCALATION = TABLE)
GO
