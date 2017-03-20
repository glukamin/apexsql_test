SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function dbo.ICE_Proper  (@expression nvarchar(4000))
returns nvarchar(4000)
as
    begin
      if @expression is null
		return null
	  declare @i  smallint,   @properexpression nvarchar(4000),  @lenexpression  smallint, @flag bit, @symbol nchar(1)
      select  @flag = 1, @i = 1, @properexpression = '', @lenexpression =  datalength(@expression)/(case SQL_VARIANT_PROPERTY(@expression,'BaseType') when 'nvarchar' then 2  else 1 end) 

      while  @i <= @lenexpression
          begin
             select @symbol = lower(substring(@expression, @i, 1) )
               if @symbol in (nchar(32), nchar(9), nchar(10), nchar(11), nchar(12), nchar(13),  nchar(160)) and ascii(@symbol) <> 0
                   select @flag = 1
               else
                   if @flag = 1
                       select @symbol = upper(@symbol),  @flag = 0 
              select  @properexpression = @properexpression + @symbol,  @i = @i + 1 
          end

     return @properexpression 
    end
GO
GRANT EXECUTE
	ON [dbo].[ICE_Proper]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_Proper]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_Proper]
	TO [davor.dumeljic]
GO
