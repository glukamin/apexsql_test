SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Activations] (
		[Activation_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Unlock_Code_ID]          [int] NOT NULL,
		[Hardware_ID]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[IP_Address]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Process_Date]            [datetime] NOT NULL,
		[Reactivation]            [tinyint] NULL,
		[Failed]                  [tinyint] NULL,
		[Reason]                  [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Received_Via]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reason_Code]             [int] NULL,
		[Reg_Key]                 [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Major_Build_Version]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Activations]
	ADD
	CONSTRAINT [PK_ICE_Activations]
	PRIMARY KEY
	CLUSTERED
	([Activation_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Activations]
	ADD
	CONSTRAINT [DF_ICE_Activations_Major_Build_Number]
	DEFAULT ('') FOR [Major_Build_Version]
GO
ALTER TABLE [dbo].[ICE_Activations] SET (LOCK_ESCALATION = TABLE)
GO
