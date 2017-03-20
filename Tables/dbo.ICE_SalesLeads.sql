SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_SalesLeads] (
		[SalesLeadId]                     [int] IDENTITY(1, 1) NOT NULL,
		[First_Name]                      [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Last_Name]                       [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Phone]                           [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Email]                           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Country]                         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Zip]                             [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Author_ID]                       [int] NOT NULL,
		[Date_Added]                      [datetime] NOT NULL,
		[Date_Submitted_To_SF]            [datetime] NULL,
		[Lead_Source]                     [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Post_Download_Status_ID]         [int] NULL,
		[Date_Post_Download_Started]      [datetime] NULL,
		[Post_Download_List_ID]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Thank_You_Email]            [datetime] NULL,
		[Do_Not_Contact]                  [bit] NULL,
		[CRM_ID]                          [uniqueidentifier] NULL,
		[First_Downloaded_Product_ID]     [int] NULL,
		[Web_Score]                       [int] NULL,
		[Email_Activity_Score]            [int] NULL,
		[Last_Score_Update]               [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_SalesLeads]
	ADD
	CONSTRAINT [PK_SalesLeads]
	PRIMARY KEY
	CLUSTERED
	([SalesLeadId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_SalesLeads]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_SalesLeads_ICE_Post_Download_Status]
	FOREIGN KEY ([Post_Download_Status_ID]) REFERENCES [dbo].[ICE_Post_Download_Status] ([Post_Download_Status_ID])
ALTER TABLE [dbo].[ICE_SalesLeads]
	CHECK CONSTRAINT [FK_ICE_SalesLeads_ICE_Post_Download_Status]

GO
ALTER TABLE [dbo].[ICE_SalesLeads]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_SalesLeads_tblAuthor]
	FOREIGN KEY ([Author_ID]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_SalesLeads]
	CHECK CONSTRAINT [FK_ICE_SalesLeads_tblAuthor]

GO
ALTER TABLE [dbo].[ICE_SalesLeads] SET (LOCK_ESCALATION = TABLE)
GO
