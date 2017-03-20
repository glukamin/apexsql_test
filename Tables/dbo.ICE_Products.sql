SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Products] (
		[Product_ID]                      [int] NOT NULL,
		[Product_Name]                    [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Product_Description]             [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Price]                           [money] NOT NULL,
		[A_Key]                           [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[E_Key]                           [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[N_Key]                           [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Bundle_Products]                 [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Unlock_Code_Pattern]             [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created_By]                      [int] NULL,
		[Create_Date]                     [datetime] NULL,
		[Edited_By]                       [int] NULL,
		[Edit_Date]                       [datetime] NULL,
		[Product_Alias]                   [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Product_Icon]                    [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Product_Thumb]                   [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Is_Private]                      [tinyint] NULL,
		[Default_Major_Build_Version]     [int] NULL,
		[HasSiteLicense]                  [bit] NULL,
		[Dev_Version_ID]                  [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Products]
	ADD
	CONSTRAINT [PK_ICE_Product]
	PRIMARY KEY
	CLUSTERED
	([Product_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Products] SET (LOCK_ESCALATION = TABLE)
GO
