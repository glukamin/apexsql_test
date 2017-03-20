SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Trial_Extensions] (
		[Trial_Extension_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Product_ID]             [int] NOT NULL,
		[Major_Build_Number]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Hardware_ID]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[IP_Address]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Process_Date]           [datetime] NULL,
		[Received_Via]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Failed]                 [tinyint] NULL,
		[Reason_Code]            [int] NULL,
		[Reason]                 [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg_Key]                [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LeadID]                 [int] NOT NULL,
		[Edit_Date]              [datetime] NULL,
		[Trial_Expiry_Date]      [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Trial_Extensions]
	ADD
	CONSTRAINT [PK_ICE_Trial_Extensions]
	PRIMARY KEY
	CLUSTERED
	([Trial_Extension_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Trial_Extensions]
	ADD
	CONSTRAINT [DF_ICE_Trial_Extensions_Major_Build_Number]
	DEFAULT ('') FOR [Major_Build_Number]
GO
ALTER TABLE [dbo].[ICE_Trial_Extensions]
	WITH CHECK
	ADD CONSTRAINT [FK__ICE_Trial__Trial__6F212F46]
	FOREIGN KEY ([LeadID]) REFERENCES [dbo].[ICE_SalesLeads] ([SalesLeadId])
ALTER TABLE [dbo].[ICE_Trial_Extensions]
	CHECK CONSTRAINT [FK__ICE_Trial__Trial__6F212F46]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Duplicate_Extensions]
	ON [dbo].[ICE_Trial_Extensions] ([Product_ID], [Major_Build_Number], [Hardware_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Trial_Extensions] SET (LOCK_ESCALATION = TABLE)
GO
