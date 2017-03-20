SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure tiSELECT_UserProfile
(
		@UserID  int
/*
06Mar05
Code modified to map tblAuthor
*/
)
As
	SELECT Username as UserHandle, [Password] as UserPassword, 
		Time_offset as UserTimeOffset,Real_name as UserFirstName,'' as UserLastName, Author_email as UserEmail,
		'' as UserAddress1, '' as UserAddress2 , '' as UserCity ,Location as UserState , '' as UserZip ,Homepage as UserCompanyName , '' as UserPhone ,'' as UserFax ,
		Signature as UserSig, Join_date as UserRegisterDate, No_of_posts as  UserTopicsPosted, 0 as UserRepliesPosted, 0 as UserMailingSubscribe, Group_iD as UserLevel, 
		UserDateDisplay = 
		CASE Date_format
			WHEN 'dd/mm/yy' THEN 1	
			WHEN 'mm/dd/yy' THEN 2
			Else 1		
		END		
	FROM tblAuthor
	WHERE Author_ID = @UserID

GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UserProfile]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UserProfile]
	TO [davor.dumeljic]
GO
