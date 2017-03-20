SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Major_Builds_Helper] (
		[Major_Build_ID]     [int] NOT NULL,
		[Active]             [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Major_Builds_Helper]
	ADD
	CONSTRAINT [PK__ICE_Majo__455C39D9C9F033A1]
	PRIMARY KEY
	CLUSTERED
	([Major_Build_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Major_Builds_Helper]
	ADD
	CONSTRAINT [DF__ICE_Major__Activ__16FA1676]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ICE_Major_Builds_Helper]
	WITH CHECK
	ADD CONSTRAINT [Major_Build_ID]
	FOREIGN KEY ([Major_Build_ID]) REFERENCES [dbo].[ICE_Major_Builds] ([Major_Build_ID])
ALTER TABLE [dbo].[ICE_Major_Builds_Helper]
	CHECK CONSTRAINT [Major_Build_ID]

GO
ALTER TABLE [dbo].[ICE_Major_Builds_Helper] SET (LOCK_ESCALATION = TABLE)
GO
