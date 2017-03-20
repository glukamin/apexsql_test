SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure prc_ins_tbl_Audit_Forum
@TableName varchar(255),
@DeletedOn datetime
as
Insert into tbl_Audit_Forum(TableName,DeletedOn)
 values(@TableName,@DeletedOn)
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tbl_Audit_Forum]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tbl_Audit_Forum]
	TO [davor.dumeljic]
GO
