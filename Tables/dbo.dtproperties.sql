SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtproperties] (
		[id]           [int] IDENTITY(1, 1) NOT NULL,
		[objectid]     [int] NULL,
		[property]     [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[value]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[uvalue]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[lvalue]       [image] NULL,
		[version]      [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[dtproperties]
	ADD
	CONSTRAINT [pk_dtproperties]
	PRIMARY KEY
	CLUSTERED
	([id], [property])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[dtproperties]
	ADD
	CONSTRAINT [DF__dtpropert__versi__0DAF0CB0]
	DEFAULT ((0)) FOR [version]
GO
ALTER TABLE [dbo].[dtproperties] SET (LOCK_ESCALATION = TABLE)
GO
