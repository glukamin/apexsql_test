SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE reptq3 @lolimit money, @hilimit money,
@type char(12)
AS
select pub_id, type, title_id, price
from titles
where price >@lolimit AND price <@hilimit AND type = @type OR type LIKE '%cook%'
order by pub_id, type
COMPUTE count(title_id) BY pub_id, type
GO
GRANT EXECUTE
	ON [apexsql].[reptq3]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[reptq3]
	TO [davor.dumeljic]
GO
