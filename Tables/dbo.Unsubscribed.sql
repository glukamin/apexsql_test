SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unsubscribed] (
		[E-Mail]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last Modification]     [datetime] NULL,
		[FromMailChimp]         [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Unsubscribed] SET (LOCK_ESCALATION = TABLE)
GO
