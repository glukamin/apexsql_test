SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Leads per territory]
(
 @StartDate datetime ,
 @EndDate datetime )
AS
SET @EndDate = DATEADD(day,1, @EndDate ) 
BEGIN
WITH data as(
	SELECT 
	isl.Email,
	isl.First_Name,
	isl.Last_Name
	FROM dbo.ICE_SalesLeads isl
	WHERE isl.Date_Added BETWEEN @StartDate AND @EndDate
),
dataFree as(
	SELECT * FROM data d
	INNER JOIN dbo.ICE_Free_Domains ifd ON d.Email LIKE '%' + Domain
),
nonfree as(
	SELECT 
	1 AS ForOrder,
	UPPER(substring(da.Email,CHARINDEX('@', da.Email) + 1,1)) as Letters,
	count(*) AS OrdersForRenewal
	FROM data da
	left JOIN dbo.ICE_Free_Domains ifd ON Email LIKE '%' + Domain
	WHERE ifd.Domain IS NULL AND da.Email IS NOT NULL
	GROUP BY substring(da.Email,CHARINDEX('@', da.Email) + 1,1)
),
freelast as (
	SELECT 
	2 AS ForOrder,
	substring(df.Last_Name,1,1) as Letters,
	count(*) AS OrdersForRenewal
	FROM dataFree df
	WHERE df.Last_Name IS not NULL AND substring(df.Last_Name,1,1) NOT LIKE ' '
	GROUP BY substring(df.Last_Name,1,1)
),
freefirst as(
	SELECT 
	3 AS ForOrder,
	substring(df.First_Name,1,1) as Letters,
	count(*) AS OrdersForRenewal
	FROM dataFree df
	WHERE df.Last_Name IS NULL OR substring(df.Last_Name,1,1) LIKE ' '
	GROUP BY substring(df.First_Name,1,1)
)

SELECT ForOrder, totalData.Letters, 
totalData.OrdersForRenewal
FROM (
	SELECT
	1 AS ForOrder,
	' Non-free domains' as Letters,
	null AS OrdersForRenewal
	union all
	SELECT * FROM nonfree n
	UNION ALL 
	SELECT
	2 AS ForOrder,
	' Free domains - surname' as Letters,
	null AS OrdersForRenewal
	union all
	Select * from freefirst
	UNION ALL SELECT
	3 AS ForOrder,
	' Free domains - name' as Letters,
	null AS OrdersForRenewal
	union all
	Select * from freelast) AS totalData
ORDER BY totalData.ForOrder, totalData.Letters
END	  


GO
