SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_WebsiteStats
(
	@StartDate datetime,
	@EndDate   datetime	
)
AS 
BEGIN

	
CREATE TABLE #TotalDownloads
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #TotalDownloads
([Value], [Month])
SELECT COUNT(*), YEAR(Download_Date)*100 + MONTH(Download_Date)
FROM ICE_Downloads
WHERE ICE_Downloads.Download_Date BETWEEN @StartDate AND @EndDate
group by YEAR(Download_Date)*100 + MONTH(Download_Date)



CREATE TABLE #DistinctDownloads
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #DistinctDownloads
([Value], [Month])
SELECT Count(*), M.Mnt
FROM
(
	SELECT COUNT(*) as Cnt, YEAR(Download_Date)*100 + MONTH(Download_Date) as Mnt
	FROM ICE_Downloads
	WHERE ICE_Downloads.Download_Date BETWEEN @StartDate AND @EndDate
	GROUP BY ICE_Downloads.Sales_Lead_Id, YEAR(Download_Date)*100 + MONTH(Download_Date)
) M
GROUP BY M.Mnt



CREATE TABLE #TotalRegistered
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #TotalRegistered
([Value], [Month])
SELECT COUNT(*), YEAR(Join_date)*100 + MONTH(Join_date)
FROM tblAuthor
WHERE tblAuthor.Join_date BETWEEN @StartDate AND @EndDate
GROUP BY YEAR(Join_date)*100 + MONTH(Join_date)



CREATE TABLE #TotalActivated
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #TotalActivated
([Value], [Month])
SELECT COUNT(*), YEAR(Join_date)*100 + MONTH(Join_date)
FROM tblAuthor
WHERE tblAuthor.Join_date BETWEEN @StartDate AND @EndDate
AND tblAuthor.Active = 1
GROUP BY YEAR(Join_date)*100 + MONTH(Join_date)



CREATE TABLE #NeverLoggedIn
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #NeverLoggedIn
([Value], [Month])
SELECT COUNT(*), YEAR(Join_date)*100 + MONTH(Join_date)
FROM tblAuthor
WHERE tblAuthor.Join_date BETWEEN @StartDate AND @EndDate
AND tblAuthor.Join_date = tblAuthor.Last_visit 
AND tblAuthor.Active = 1
GROUP BY YEAR(Join_date)*100 + MONTH(Join_date)



CREATE TABLE #PostedAtLeastOnce
(
	[Month]	int,
	[Value]	int
)
INSERT INTO #PostedAtLeastOnce
([Value], [Month])
SELECT Count(*), M.Mnt
FROM
(
	SELECT COUNT(*) as Cnt, YEAR(Join_date)*100 + MONTH(Join_date) as Mnt
	FROM tblAuthor A inner join tblThread T on A.Author_ID = T.Author_ID
	WHERE A.Join_date BETWEEN @StartDate AND @EndDate
	GROUP BY A.Author_ID, YEAR(Join_date)*100 + MONTH(Join_date)
) M
GROUP BY M.Mnt

SELECT 
dbo.ICE_GetMonthName(TR.[Month]) as [Month],
TR.[Value] as [Total_Registered],
TA.[Value] as [Total_Activated],
NLI.[Value] as [Never_Logged_In],
PO.[Value] as [Posted_In_Forum],
DD.[Value] as [Distinct_Downloads],
TD.[Value] as [Total_Downloads]
FROM
#DistinctDownloads DD 
inner join #PostedAtLeastOnce PO on DD.[Month] = PO.[Month]
inner join #NeverLoggedIn NLI on PO.[Month] = NLI.[Month]
inner join #TotalActivated TA on NLI.[Month] = TA.[Month]
inner join #TotalRegistered TR on TA.[Month] = TR.[Month]
inner join #TotalDownloads TD on TR.[Month] = TD.[Month]

DROP TABLE #DistinctDownloads;
DROP TABLE #PostedAtLeastOnce;
DROP TABLE #NeverLoggedIn;
DROP TABLE #TotalRegistered;
DROP TABLE #TotalActivated;
DROP TABLE #TotalDownloads;

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_WebsiteStats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_WebsiteStats]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_WebsiteStats]
	TO [davor.dumeljic]
GO
