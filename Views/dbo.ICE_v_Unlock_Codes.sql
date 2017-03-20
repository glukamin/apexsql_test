SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.ICE_v_Unlock_Codes
AS
SELECT [Unlock_Code_ID]
    ,[Order_Detail_ID]
    ,Unlock_Code = CASE ISNULL(Unlock_Code, '')
	   WHEN '' then (select top 1 U.Unlock_Code from ICE_Unlock_Codes U where U.Unlock_Code_ID = UC.Parent_Code_ID)
	   ELSE Unlock_Code
	   END	   
    ,[Comment]
    ,[Dated]
    ,[Order_ID]
    ,[Product_ID]
    ,[License_No]
    ,[Activation_Counter]
    ,[Activation_Blocked]
    ,[Parent_Code_ID]
FROM [dbo].[ICE_Unlock_Codes] UC
GO
