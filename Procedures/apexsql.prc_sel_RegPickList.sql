SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE   PROCEDURE prc_sel_RegPickList 
/* ------------------------------------------------------------
   PROCEDURE:    prc_sel_RegPickList                                   
   
   DESCRIPTION:  This sproc populates all picklists.  You must add a 
new block
		 of code for each new picklist                             
   
   AUTHOR:       Brian Lockwood 10/09/2000                    
   ------------------------------------------------------------ */
	@ListID		int,
	@SelectedValue	varchar(50) = NULL,
	@Parameter int= NULL
AS
	Declare @Default bit
	If IsNull(@SelectedValue,'-9999') = '-9999' 
	BEGIN
		SET @Default = 1
	END
	ELSE
	BEGIN
		SET @Default = 0
	END
	If @ListID = 1 
	BEGIN
		--Product for reg dropdown
		Select ProductName as Literal,
		ProductID as Value ,
		Case ProductID
		When @SelectedValue Then 1
		Else 0
		End as Selected
		From codProducts
		Where ProductName IS NOT NULL
		And ShowRegFlag=1
		Order By ProductName
	END
	If @ListID = 2 
	BEGIN
		--vendor
		Select VendorName as Literal,
		VendorID as Value ,
		Case VendorID
		When @SelectedValue Then 1
		Else 0
		End as Selected
		From codVendors
		Where VendorName IS NOT NULL
		Order By SortOrder
	END
	If @ListID = 3 
	BEGIN
		--Product for download track
		Select ProductName as Literal,
		ProductID as Value ,
		Case ProductID
		When @SelectedValue Then 1
		Else 0
		End as Selected
		From codProducts
		Where ProductName IS NOT NULL		
		Order By ProductName
	END
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_RegPickList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_RegPickList]
	TO [davor.dumeljic]
GO
