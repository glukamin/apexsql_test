SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[audit_demo_jobs] (
		[job_id]       [smallint] IDENTITY(1, 1) NOT NULL,
		[job_desc]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[min_lvl]      [tinyint] NOT NULL,
		[max_lvl]      [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[audit_demo_jobs]
	ADD
	CONSTRAINT [PK__audit_demo_jobs__5629CD9C]
	PRIMARY KEY
	CLUSTERED
	([job_id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[audit_demo_jobs]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK__audit_dem__max_l__5812160E]
	CHECK
	([max_lvl] <= 250)
GO
ALTER TABLE [dbo].[audit_demo_jobs]
CHECK CONSTRAINT [CK__audit_dem__max_l__5812160E]
GO
ALTER TABLE [dbo].[audit_demo_jobs]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK__audit_dem__min_l__59063A47]
	CHECK
	([min_lvl] >= 10)
GO
ALTER TABLE [dbo].[audit_demo_jobs]
CHECK CONSTRAINT [CK__audit_dem__min_l__59063A47]
GO
ALTER TABLE [dbo].[audit_demo_jobs]
	ADD
	CONSTRAINT [DF__audit_demo_jobs__job_desc__1273C1CD]
	DEFAULT ('New Position - title not formalized yet') FOR [job_desc]
GO
ALTER TABLE [dbo].[audit_demo_jobs] SET (LOCK_ESCALATION = TABLE)
GO
