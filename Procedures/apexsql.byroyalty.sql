SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE byroyalty 
	@percentage int
AS
select au_id from titleauthor
where titleauthor.royaltyper = @percentage
GO
GRANT EXECUTE
	ON [apexsql].[byroyalty]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[byroyalty]
	TO [davor.dumeljic]
GO
