SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Orders_SEO]
(
      @StartDate datetime,
      @EndDate datetime ,
      @Email varchar(100)
)
AS
BEGIN
IF (@Email = '0')
BEGIN
select distinct P.Full_Referrer, O.Email_Ship, O.Total, O.Order_ID
from ICE_Orders O
inner join 
(
    select SUBSTRING(A.Author_email,CHARINDEX('@',A.Author_email,1),LEN(A.Author_email) - CHARINDEX('@',A.Author_email,1) + 1) as Eml ,
    W.Full_Referrer
   from ICE_Web_Visitors W
    inner join tblAuthor A on W.RegisterID = A.Author_ID
    where 
    SUBSTRING(A.Author_email,CHARINDEX('@',A.Author_email,1),LEN(A.Author_email) - CHARINDEX('@',A.Author_email,1) + 1) 
    not in ('@gmail.com', '@yahoo.com', '@hotmail.com', '@msn.com')
) P
on SUBSTRING(O.Email_Ship,CHARINDEX('@',O.Email_Ship,1),LEN(O.Email_Ship) - CHARINDEX('@',O.Email_Ship,1) + 1) = P.Eml
where O.Order_Date > @StartDate 
AND o.Order_Date < @EndDate
AND O.Order_Status_ID in (0,1,2,4)
order by P.Full_Referrer desc
END
ELSE
BEGIN
select distinct P.Full_Referrer, O.Email_Ship, O.Total, O.Order_ID
from ICE_Orders O
inner join 
(
    select SUBSTRING(A.Author_email,CHARINDEX('@',A.Author_email,1),LEN(A.Author_email) - CHARINDEX('@',A.Author_email,1) + 1) as Eml ,
    W.Full_Referrer
   from ICE_Web_Visitors W
    inner join tblAuthor A on W.RegisterID = A.Author_ID
    where 
    SUBSTRING(A.Author_email,CHARINDEX('@',A.Author_email,1),LEN(A.Author_email) - CHARINDEX('@',A.Author_email,1) + 1) 
    not in ('@gmail.com', '@yahoo.com', '@hotmail.com', '@msn.com')
) P
on SUBSTRING(O.Email_Ship,CHARINDEX('@',O.Email_Ship,1),LEN(O.Email_Ship) - CHARINDEX('@',O.Email_Ship,1) + 1) = P.Eml
where O.Order_Date > @StartDate 
AND o.Order_Date < @EndDate
AND O.Email_Ship = @Email
AND O.Order_Status_ID in (0,1,2,4)
order by P.Full_Referrer desc
END
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Orders_SEO]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Orders_SEO]
	TO [davor.dumeljic]
GO
