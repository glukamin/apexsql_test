SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Page_Visits] (
		[Page_Visit_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[TrackingID]        [uniqueidentifier] NOT NULL,
		[Full_URL]          [nvarchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Short_URL]         [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[VisitTime]         [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Page_Visits]
	ADD
	CONSTRAINT [PK_ICE_Page_Visits]
	PRIMARY KEY
	CLUSTERED
	([Page_Visit_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Page_Visits]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Page_Visits_ICE_Web_Visitors]
	FOREIGN KEY ([TrackingID]) REFERENCES [dbo].[ICE_Web_Visitors] ([Web_Visitor_ID])
ALTER TABLE [dbo].[ICE_Page_Visits]
	CHECK CONSTRAINT [FK_ICE_Page_Visits_ICE_Web_Visitors]

GO
CREATE NONCLUSTERED INDEX [IX_TrackingID]
	ON [dbo].[ICE_Page_Visits] ([TrackingID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Page_Visits] SET (LOCK_ESCALATION = TABLE)
GO
