SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Major_Builds] (
		[Major_Build_ID]              [int] IDENTITY(1, 1) NOT NULL,
		[Product_ID]                  [int] NOT NULL,
		[Dated]                       [datetime] NOT NULL,
		[A_Key]                       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[E_Key]                       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[N_Key]                       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Created_By]                  [int] NULL,
		[Create_Date]                 [datetime] NULL,
		[Edited_By]                   [int] NULL,
		[Edit_Date]                   [datetime] NULL,
		[Major_Build_Version]         [int] NOT NULL,
		[Is_Pro_Version]              [bit] NULL,
		[First_Minor_Pro_Version]     [int] NULL,
		[D]                           [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DP]                          [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DQ]                          [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exponent]                    [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[InverseQ]                    [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Modulus]                     [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[P]                           [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Q]                           [varchar](1200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Major_Builds]
	ADD
	CONSTRAINT [PK_ICE_Major_Builds]
	PRIMARY KEY
	CLUSTERED
	([Major_Build_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Major_Builds]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Major_Builds_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Major_Builds]
	CHECK CONSTRAINT [FK_ICE_Major_Builds_ICE_Products]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ICE_Major_Builds]
	ON [dbo].[ICE_Major_Builds] ([Major_Build_Version], [Product_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Major_Builds] SET (LOCK_ESCALATION = TABLE)
GO
