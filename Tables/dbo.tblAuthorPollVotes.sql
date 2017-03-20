SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblAuthorPollVotes] (
		[Vote_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Author_ID]     [int] NOT NULL,
		[Poll_ID]       [int] NOT NULL,
		[Vote_Date]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAuthorPollVotes]
	ADD
	CONSTRAINT [PK_tblAuthorPollVotes]
	PRIMARY KEY
	CLUSTERED
	([Vote_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAuthorPollVotes] SET (LOCK_ESCALATION = TABLE)
GO
