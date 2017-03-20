SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAuthor] (
		[Author_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Group_ID]              [int] NOT NULL,
		[Username]              [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Real_name]             [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[User_code]             [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Password]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Salt]                  [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Author_email]          [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Show_email]            [bit] NOT NULL,
		[Homepage]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Location]              [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Signature]             [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Attach_signature]      [bit] NOT NULL,
		[No_of_posts]           [int] NOT NULL,
		[Join_date]             [datetime] NOT NULL,
		[Active]                [bit] NOT NULL,
		[Avatar]                [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Avatar_title]          [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_visit]            [datetime] NOT NULL,
		[Time_offset]           [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Time_offset_hours]     [smallint] NOT NULL,
		[Date_format]           [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rich_editor]           [bit] NOT NULL,
		[Reply_notify]          [bit] NOT NULL,
		[PM_notify]             [bit] NOT NULL,
		[Send_Newsletters]      [bit] NOT NULL,
		CONSTRAINT [IX_tblAuthor_email]
		UNIQUE
		NONCLUSTERED
		([Author_email])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAuthor]
	ADD
	CONSTRAINT [PK__tblAuthor__03E676AB]
	PRIMARY KEY
	CLUSTERED
	([Author_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAuthor]
	ADD
	CONSTRAINT [DF__tblAuthor__Join___05CEBF1D]
	DEFAULT (getdate()) FOR [Join_date]
GO
ALTER TABLE [dbo].[tblAuthor]
	ADD
	CONSTRAINT [DF__tblAuthor__Last___06C2E356]
	DEFAULT (getdate()) FOR [Last_visit]
GO
ALTER TABLE [dbo].[tblAuthor]
	ADD
	CONSTRAINT [DF__tblAuthor__No_of__04DA9AE4]
	DEFAULT (0) FOR [No_of_posts]
GO
CREATE NONCLUSTERED INDEX [Author_ID]
	ON [dbo].[tblAuthor] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Group_ID]
	ON [dbo].[tblAuthor] ([Group_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblGrouptblAuthor]
	ON [dbo].[tblAuthor] ([Group_ID])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [User_code]
	ON [dbo].[tblAuthor] ([User_code])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Username]
	ON [dbo].[tblAuthor] ([Username])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAuthor] SET (LOCK_ESCALATION = TABLE)
GO
