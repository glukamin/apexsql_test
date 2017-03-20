SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Resellers] (
		[First_Name]              [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Last_Name]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Email]                   [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Company]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone]                   [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax]                     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City]                    [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State]                   [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip]                     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Discount]                [float] NOT NULL,
		[Reseller_ShareIt_ID]     [int] NULL,
		[Reseller_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Agent_Email]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created_By]              [int] NULL,
		[Create_Date]             [datetime] NULL,
		[Edited_By]               [int] NULL,
		[Edit_Date]               [datetime] NULL,
		[Password]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Allow]                   [tinyint] NULL,
		[IS_Var]                  [bit] NOT NULL,
		[Country_Discount]        [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Resellers]
	ADD
	CONSTRAINT [PK_ICE_Resellers]
	PRIMARY KEY
	CLUSTERED
	([Reseller_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Resellers]
	ADD
	CONSTRAINT [DF__ICE_Resel__IS_Va__799EBDB9]
	DEFAULT ((0)) FOR [IS_Var]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ICE_Resellers_Email]
	ON [dbo].[ICE_Resellers] ([Email])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Resellers] SET (LOCK_ESCALATION = TABLE)
GO
