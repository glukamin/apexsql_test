SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Contacts] (
		[Contact_ID]          [int] IDENTITY(6000, 1) NOT NULL,
		[Cust_ID]             [int] NULL,
		[Last_Name_Ship]      [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[First_Name_Ship]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email_Ship]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone_Ship]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax_Ship]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1_Ship]       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2_Ship]       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City_Ship]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State_Ship]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country_Ship]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip_Ship]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Is_active01]         [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created_By]          [int] NULL,
		[Create_Date]         [datetime] NULL,
		[Edited_By]           [int] NULL,
		[Edit_Date]           [datetime] NULL,
		[Notes]               [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Contacts]
	ADD
	CONSTRAINT [PK_ICE_Contacts]
	PRIMARY KEY
	CLUSTERED
	([Contact_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Contacts]
	ADD
	CONSTRAINT [DF_ICE_Contacts_Is_active01]
	DEFAULT ('Y') FOR [Is_active01]
GO
ALTER TABLE [dbo].[ICE_Contacts] SET (LOCK_ESCALATION = TABLE)
GO
