SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
 Author:		Pankaj Sutradhar
 Create date: 08/28/2007
 Description:	Get template Details
 =============================================*/
CREATE VIEW [dbo].[uv_OTL_TemplateDetails]
AS
SELECT     T.Id, T.UserId, T.ProjectTypeId, T.DatabaseTypeId, T.OutputTypeId, T.ApplicationTypeId, T.Title, T.ShortDesc, T.LongDesc, T.Copyright, 
                      T.ScriptLanguage, T.OutputLanguage, T.DownloadCount, T.ViewCount, T.LinesCount, T.Status, CAST(FLOOR(CAST(T.DateUpdated AS float)) AS datetime) 
                      AS DateUpdated, CAST(FLOOR(CAST(T.DateLoaded AS float)) AS datetime) AS DateLoaded, T.DiscussionLink, dbo.tblAuthor.Username AS Poster, 
                      AppT.Name AS ApplicationName, dbo.OTL_OutputTypes.Name AS CategoryName, T.DateUpdated AS LastModified, T.TemplateFileName, 
                      T.ArchiveFileName
FROM         dbo.tblAuthor INNER JOIN
                      dbo.OTL_Templates AS T ON dbo.tblAuthor.Author_ID = T.UserId INNER JOIN
                      dbo.OTL_ApplicationTypes AS AppT ON T.ApplicationTypeId = AppT.Id INNER JOIN
                      dbo.OTL_DatabaseTypes ON T.DatabaseTypeId = dbo.OTL_DatabaseTypes.Id INNER JOIN
                      dbo.OTL_OutputTypes ON T.OutputTypeId = dbo.OTL_OutputTypes.Id
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[7] 2[51] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAuthor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 121
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AppT"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 211
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OTL_DatabaseTypes"
            Begin Extent = 
               Top = 126
               Left = 228
               Bottom = 211
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OTL_OutputTypes"
            Begin Extent = 
               Top = 216
               Left = 38
               Bottom = 301
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
        ', 'SCHEMA', N'dbo', 'VIEW', N'uv_OTL_TemplateDetails', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'uv_OTL_TemplateDetails', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'uv_OTL_TemplateDetails', NULL, NULL
GO
