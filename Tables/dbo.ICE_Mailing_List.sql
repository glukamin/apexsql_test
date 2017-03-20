SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Mailing_List] (
		[Mailing_List_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[List_Name]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Date_Sent]           [datetime] NOT NULL,
		[Desription]          [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Mailing_List]
	ADD
	CONSTRAINT [PK_ICE_Mailing_List]
	PRIMARY KEY
	CLUSTERED
	([Mailing_List_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Mailing_List] SET (LOCK_ESCALATION = TABLE)
GO
