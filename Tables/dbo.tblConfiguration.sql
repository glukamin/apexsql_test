SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblConfiguration] (
		[website_name]            [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[forum_name]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[forum_path]              [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[website_path]            [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[forum_email_address]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[email_notify]            [bit] NOT NULL,
		[mail_component]          [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[mail_server]             [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IE_editor]               [bit] NOT NULL,
		[L_code]                  [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Topics_per_page]         [smallint] NULL,
		[Title_image]             [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Text_link]               [bit] NOT NULL,
		[Emoticons]               [bit] NOT NULL,
		[Avatar]                  [bit] NOT NULL,
		[Email_activate]          [bit] NOT NULL,
		[Email_post]              [bit] NOT NULL,
		[Hot_views]               [smallint] NULL,
		[Hot_replies]             [smallint] NOT NULL,
		[Private_msg]             [bit] NOT NULL,
		[No_of_priavte_msg]       [smallint] NULL,
		[Threads_per_page]        [smallint] NULL,
		[Spam_seconds]            [smallint] NULL,
		[Spam_minutes]            [smallint] NULL,
		[Vote_choices]            [smallint] NULL,
		[Email_sys]               [bit] NOT NULL,
		[Upload_img_path]         [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_img_types]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_img_size]         [smallint] NULL,
		[Upload_files_path]       [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_files_type]       [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_files_size]       [smallint] NULL,
		[Upload_avatar]           [bit] NOT NULL,
		[Upload_avatar_path]      [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_avatar_types]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Upload_avatar_size]      [smallint] NULL,
		[Upload_component]        [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Active_users]            [bit] NOT NULL,
		[Forums_closed]           [bit] NOT NULL,
		[Show_edit]               [bit] NOT NULL,
		[Process_time]            [bit] NOT NULL,
		[Flash]                   [bit] NOT NULL,
		[Show_mod]                [bit] NOT NULL,
		[Reg_closed]              [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblConfiguration]
	ADD
	CONSTRAINT [PK__tblConfiguration__104C4D90]
	PRIMARY KEY
	CLUSTERED
	([website_name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblConfiguration] SET (LOCK_ESCALATION = TABLE)
GO
