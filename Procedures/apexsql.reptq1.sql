SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE reptq1 AS
select pub_id, title_id, price, pubdate
from titles
where price is NOT NULL
order by pub_id
COMPUTE avg(price) BY pub_id
COMPUTE avg(price)
GO
GRANT EXECUTE
	ON [apexsql].[reptq1]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[reptq1]
	TO [davor.dumeljic]
GO
