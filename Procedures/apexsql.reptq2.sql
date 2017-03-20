SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE reptq2 AS
select type, pub_id, titles.title_id, au_ord,
   Name = substring (au_lname, 1,15), ytd_sales
from titles, authors, titleauthor
where titles.title_id = titleauthor.title_id AND authors.au_id = titleauthor.au_id
   AND pub_id is NOT NULL
order by pub_id, type
COMPUTE avg(ytd_sales) BY pub_id, type
COMPUTE avg(ytd_sales) BY pub_id
GO
GRANT EXECUTE
	ON [apexsql].[reptq2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[reptq2]
	TO [davor.dumeljic]
GO
