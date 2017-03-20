SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_MC_Lead_Activities] (
		[MC_Lead_Activity_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Lead_ID]                 [int] NOT NULL,
		[Action]                  [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Action_Date]             [datetime] NOT NULL,
		[Action_URL]              [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Campaign]                [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_MC_Lead_Activities]
	ADD
	CONSTRAINT [PK_ICE_MC_Lead_Activities]
	PRIMARY KEY
	CLUSTERED
	([MC_Lead_Activity_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_MC_Lead_Activities]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_MC_Lead_Activities_ICE_SalesLeads]
	FOREIGN KEY ([Lead_ID]) REFERENCES [dbo].[ICE_SalesLeads] ([SalesLeadId])
ALTER TABLE [dbo].[ICE_MC_Lead_Activities]
	CHECK CONSTRAINT [FK_ICE_MC_Lead_Activities_ICE_SalesLeads]

GO
CREATE NONCLUSTERED INDEX [IX_ICE_MC_Lead_Activities]
	ON [dbo].[ICE_MC_Lead_Activities] ([Lead_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_MC_Lead_Activities] SET (LOCK_ESCALATION = TABLE)
GO
