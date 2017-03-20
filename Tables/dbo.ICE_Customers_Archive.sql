SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Customers_Archive] (
		[Cust_ID]         [int] IDENTITY(1, 1) NOT NULL,
		[First_Name]      [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Name]       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Password]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company]         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country]         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created_By]      [int] NULL,
		[Create_Date]     [datetime] NULL,
		[Edited_By]       [int] NULL,
		[Edit_Date]       [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customers_Archive]
	ADD
	CONSTRAINT [PK_ICE_Customer_Archive]
	PRIMARY KEY
	CLUSTERED
	([Cust_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customers_Archive] SET (LOCK_ESCALATION = TABLE)
GO
