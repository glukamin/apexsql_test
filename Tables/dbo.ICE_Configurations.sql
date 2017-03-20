SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Configurations] (
		[ID]                     [int] NOT NULL,
		[AllowActivation]        [int] NULL,
		[BlockActivation]        [int] NULL,
		[CDCharge]               [money] NULL,
		[InvoicePrefix]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MaxRecords]             [int] NULL,
		[Sender_Email]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_0]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_0_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_1]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_1_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_2]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_2_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_3]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_3_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_4]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_4_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_5]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_5_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_6]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_6_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_7]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_7_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PageRecords]            [int] NULL,
		[QuotePrefix]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Wire_Transfer]          [money] NULL,
		[ResultCode_8]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_8_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Pass_Code]              [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TrialExtensionCode]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_9]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_9_Long]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_10]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_10_Long]     [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_11]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_11_Long]     [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_12]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_12_Long]     [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_13]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_13_Long]     [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_0_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_1_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_2_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_3_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_4_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_5_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_6_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_7_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_8_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_9_Fix]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_10_Fix]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_11_Fix]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_12_Fix]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultCode_13_Fix]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Configurations]
	ADD
	CONSTRAINT [PK_ICE_Configurations]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Configurations] SET (LOCK_ESCALATION = TABLE)
GO
