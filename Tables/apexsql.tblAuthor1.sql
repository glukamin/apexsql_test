SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [apexsql].[tblAuthor1] (
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
		[MSN]                   [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Yahoo]                 [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ICQ]                   [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AIM]                   [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Occupation]            [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Interests]             [nvarchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DOB]                   [datetime] NULL,
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
		[PM_notify]             [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblAuthor1] SET (LOCK_ESCALATION = TABLE)
GO
