SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Survey] (
		[ICE_Survey_ID]                      [int] IDENTITY(1, 1) NOT NULL,
		[Overal_Quality]                     [int] NULL,
		[Problem_Timely_Resolved]            [int] NULL,
		[Support_Team_Knowledge]             [int] NULL,
		[Overal_Tool_Quality]                [int] NULL,
		[Support_Team_Improvement_Areas]     [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[No_Of_Servers]                      [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[No_Of_Devs]                         [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Potential_Problems]                 [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Applications]                       [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Desired_Features]                   [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Preferred_Contact_Method]           [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Completed]                     [datetime] NOT NULL,
		[Author_ID]                          [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Survey]
	ADD
	CONSTRAINT [PK_ICE_Survey]
	PRIMARY KEY
	CLUSTERED
	([ICE_Survey_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Survey] SET (LOCK_ESCALATION = TABLE)
GO
