SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE   Procedure tiUPDATE_User
(
@UserID int,
@UserHandle varchar(20),
@UserPassword varchar(20),
@UserTimeOffSet smallint,
@UserFirstName varchar(30),
@UserLastName varchar(30),
@UserEmail varchar(75),
@UserAddress1 varchar(50)= Null,
@UserAddress2 varchar(50)= Null,
@UserCity varchar(30)= Null,
@UserState varchar(30)= Null,
@UserZip varchar(10)= Null,
@UserCompanyName varchar(100)= Null,
@UserPhone varchar(25)= Null,
@UserFax varchar(10)= Null,
@UserSig varchar(300),
@UserMailingSubscribe bit,
@UserLevel smallint,
@UserDateDisplay smallint
)
/*
06Mar05
Code modified to map tblAuthor
*/
As
DECLARE @Date_Format nvarchar(10)
SET @Date_Format = 'dd/mm/yy'
IF @UserDateDisplay = 2
BEGIN
	SET @Date_Format = 'mm/dd/yy'
END

UPDATE tblAuthor
SET Username = @UserHandle, [Password] = @UserPassword, 
	Real_name = @UserFirstName,
	Author_email = @UserEmail, 
	Signature = @UserSig, 
 	Date_Format = @Date_Format
WHERE Author_ID = @UserID

GO
GRANT EXECUTE
	ON [apexsql].[tiUPDATE_User]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiUPDATE_User]
	TO [davor.dumeljic]
GO
