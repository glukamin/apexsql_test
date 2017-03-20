SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_CustomersFromSameDomain
AS
BEGIN
select substring(Email, charindex('@', Email), 1000) as Domain, count('x') as [Customer Count]
    from ICE_Customers
    where Email not like '%@gmail%' 
        and Email not like '%@hotmail%' 
        and Email not like '%@yahoo%'
        and Email not like '%@aol.com%'
        and Email not like '%@apexsql.com%'
        and Email not like '%@aim.com%'
        and Email not like '%@gmx.com%'
        and Email not like '%@zenbe.com%'
        and Email not like '%@inbox.com%'
        and Email not like '%@fastmail%'
        and Email not like '%@live.com%'                                                
        and Email not like '%@Lavabit.com%'
        and Email not like '%@Gawab.com%'
        and Email not like '%@hotpop.com%' 
        and Email not like '%@zapak.com%' 
        and Email not like '%@bigstring.com%' 
        and Email not like '%@myway.com%' 
        and Email not like '%@care2.com%' 
        and Email not like '%@Email.%' 
        and Email not like '%@bellsouth.%' 
        and Email not like '%@Verizon.%' 
        and Email not like '%@Comcast.%' 
        and Email not like '%@cox.%' 
        and Email not like '%@earthlink.%' 
        and Email not like '%@msn.%' 
        and Email not like '%@mvps.prg%' 
        and Email not like '%@nc.rr.com%' 
        and Email not like '%@pacbell.net%' 
        and Email not like '%@usa.net%' 
        and Email not like '%@vbcity.com%' 
        and substring(Email, charindex('@', Email), 1000) not in (select distinct substring(Email, charindex('@', Email), 1000) from ICE_Resellers)
    group by substring(Email, charindex('@', Email), 1000)
    having Count(*) > 1
    order by substring(Email, charindex('@', Email), 1000)
END	
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersFromSameDomain]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersFromSameDomain]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersFromSameDomain]
	TO [davor.dumeljic]
GO
