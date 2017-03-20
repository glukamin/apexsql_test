SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE   PROCEDURE prc_sel_ProductRegStatistics 
/* ------------------------------------------------------------
   PROCEDURE:    prc_sel_ProductRegStatistics 
   
   DESCRIPTION:  Gives the count of Approved, Pending and Rejected Registrations based on the search
   
   AUTHOR:       Brian Lockwood 12/27/2001 3:13:39 PM
		 03/29/2005                   
   ------------------------------------------------------------ */
	@UserName		varchar(20)	= NULL,
	@FullName		varchar(40)	= NULL,
	@LastName		varchar(30)	= NULL,
	@Email			varchar(50)	= NULL,
	@Company		varchar(100)	= NULL,
	@LicenseNumber		varchar(12)	= NULL,
	@Product		int  		= NULL,
	@Vendor			int  		= NULL,
	@RegStatus		int		= NULL
	
	AS
	
	Declare @SearchStr		varchar(1000)
	Declare @SQLStr			varchar(2000)
	Select @SQLStr = 'Select count (a.UserID) Users, RegStatus
		FROM [tblProductRegistration] a, tblAuthor b,
	        codProducts c, codVendors d
		WHERE 
		a.UserID 			=	b.Author_ID AND   
		a.ProductID			=	c.ProductID AND
		a.VendorID			=	d.VendorID AND ' 
	--Print @SQLStr
	--search str
	--FirstName
	If @UserName is NUll 
	Begin
		Select @SearchStr = ' b.Username LIKE b.Username ' 
	End
	Else
	Begin
		
		Select @SearchStr = ' b.Username LIKE ''' + @UserName + '%'''
	End	
	--FirstName
	If @FullName is NUll 
	Begin
		Select @SearchStr = @SearchStr + ' AND (b.Real_name is Null or b.Real_name LIKE b.Real_name) ' 
	End
	Else
	Begin
		
		Select @SearchStr = @SearchStr + ' AND b.Real_name LIKE ''' + @FullName + '%'''
	End
	/*
	--LastName
	If @LastName is NUll 
	Begin
		Select @SearchStr = @SearchStr + 'AND (b.UserLastName is Null or b.UserLastName LIKE b.UserLastName) ' 
	End
	Else
	Begin
		
		Select @SearchStr = @SearchStr + 'AND b.UserLastName LIKE ''' + @LastName + '%'''
	End	
	*/
	--Email
	If @Email is NULL
	Begin
		Select @SearchStr = @SearchStr + ' AND b.Author_email LIKE b.Author_email '		
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND b.Author_email LIKE '''  + @Email + '%'''
	End
	--Company
	If @Company is NULL
	Begin
		Select @SearchStr = @SearchStr + ' AND (b.Homepage is Null or b.Homepage LIKE b.Homepage) '		
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND b.Homepage LIKE '''  + @Company + '%'''
	End	
	--LicenseNumber
	If @LicenseNumber is NUll 
	Begin
		Select @SearchStr = @SearchStr + ' And  a.LicenseNumber Like a.LicenseNumber '				
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND a.LicenseNumber LIKE '''  + @LicenseNumber + '%'''
	End	
	--Product
	If @Product is NUll 
	Begin
		Select @SearchStr = @SearchStr + ' And a.ProductID Like a.ProductID '				
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND a.ProductID LIKE ' + Convert(varchar,@Product)
	End	
	--Vendor
	If @Vendor is NUll 
	Begin
		Select @SearchStr = @SearchStr + ' And a.VendorID Like a.VendorID '				
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND a.VendorID LIKE ' + Convert(varchar,@Vendor)
	End
	--RegStatus		
	If @RegStatus is NUll 
	Begin
		Select @SearchStr = @SearchStr + ' And a.RegStatus Like a.RegStatus '				
	End
	Else
	Begin
		Select @SearchStr = @SearchStr +  ' AND a.RegStatus LIKE ' + Convert(varchar,@RegStatus)
	End
	--Print @SearchStr 		
	--Total str + order by str 
	Select @SQLStr= @SQLStr + @SearchStr + '  group by a.RegStatus'
	
	--Print @SQLStr
	Exec(@SQLStr)
	Return @@Error


GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_ProductRegStatistics]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_ProductRegStatistics]
	TO [davor.dumeljic]
GO
