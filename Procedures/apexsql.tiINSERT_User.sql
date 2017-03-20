SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE   Procedure tiINSERT_User
(
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
@UserDateDisplay smallint,
@TempUserHandle smallint OUTPUT,
@UserID integer OUTPUT
)
/*
06Mar05
Code modified to map tblAuthor
*/
As
DECLARE @Date_Format nvarchar(10)

SELECT @TempUserHandle = (SELECT COUNT(UserName) FROM tblAuthor WHERE UserName = @UserHandle)
IF @TempUserHandle = 0
BEGIN
	
	SET @Date_Format = 'dd/mm/yy'
	IF @UserDateDisplay = 2
	BEGIN
		SET @Date_Format = 'mm/dd/yy'
	END	
	/*
	INSERT INTO tiUsers(UserHandle, UserPassword, UserFirstName, UserLastName, UserEmail,
	UserAddress1,UserAddress2 ,UserCity ,UserState ,UserZip ,UserCompanyName ,UserPhone ,UserFax ,
	UserSig, UserRegisterDate, UserTopicsPosted, UserRepliesPosted, UserMailingSubscribe,
	UserLevel, UserTimeOffSet, UserDateDisplay)
	values(@UserHandle, @UserPassword, @UserFirstName, @UserLastName, @UserEmail,
	@UserAddress1, @UserAddress2,@UserCity ,@UserState ,@UserZip ,@UserCompanyName ,@UserPhone,@UserFax,
	@UserSig, CURRENT_TIMESTAMP, 0, 0, @UserMailingSubscribe,
	@UserLevel, @UserTimeOffSet, @UserDateDisplay)
	*/

	INSERT INTO tblAuthor(UserName, User_code, [Password], [Salt], Real_Name, Author_email, Show_email,
	Location, HomePage,Signature, Attach_signature, Join_Date, No_of_posts, 	
	Active, Group_ID,
	MSN, Yahoo, ICQ, AIM, Occupation, Interests, DOB, Avatar, Avatar_title, Last_visit, 
	Time_offset, Time_offset_hours, Date_format, Rich_editor, Reply_notify, PM_notify
	) 
	Values(@UserHandle,@UserHandle,@UserPassword, Null, @UserFirstName ,  @UserEmail,0,
	Null, @UserCompanyName, @UserSig, 1, CURRENT_TIMESTAMP, 0,
	0,4,
	Null,Null,Null,Null,Null,Null,Null,Null,Null, CURRENT_TIMESTAMP, 
	'+' ,0, @Date_format, 0,1,0)	
	SELECT @UserID = @@IDENTITY
END

GO
GRANT EXECUTE
	ON [apexsql].[tiINSERT_User]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiINSERT_User]
	TO [davor.dumeljic]
GO
