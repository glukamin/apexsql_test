SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Web_Visitors] (
		[Web_Visitor_ID]      [uniqueidentifier] NOT NULL,
		[Visitor_IP]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Full_Referrer]       [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Referrer_Domain]     [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RegisterID]          [int] NULL,
		[User_Agent]          [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Visitors]
	ADD
	CONSTRAINT [PK_ICE_Web_Visitors]
	PRIMARY KEY
	CLUSTERED
	([Web_Visitor_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Visitors]
	ADD
	CONSTRAINT [DF_ICE_Web_Visitors_Web_Visitor_ID]
	DEFAULT (newsequentialid()) FOR [Web_Visitor_ID]
GO
CREATE NONCLUSTERED INDEX [Registration_ID]
	ON [dbo].[ICE_Web_Visitors] ([RegisterID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Visitors] SET (LOCK_ESCALATION = TABLE)
GO
