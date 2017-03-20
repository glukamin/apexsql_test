SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure prc_sel_all_customers
@ProcessFlag Bit
As
	If @ProcessFlag = 0
	BEGIN
		--latest
		SELECT Author_ID, Username, Real_name, '' as LastName, Author_email, Homepage, Convert(varchar,Join_date, 101) as UserRegisterDate 
		FROM tblAuthor
		WHERE Active = 1
		ORDER BY Username		
		/*
		SELECT UserID, UserHandle, UserFirstName, UserLastName, UserEmail, UserCompanyName, Convert(varchar,UserRegisterDate, 101) as UserRegisterDate 
		FROM tiUsers
		WHERE UserLevel <> 666 AND UserLevel <> -1
		and ProcessFlag = 0
		ORDER BY UserHandle
		*/
	END	
	ELSE
	BEGIN
		--All
		SELECT Author_ID, Username, Real_name, '' as LastName, Author_email, Homepage, Convert(varchar,Join_date, 101) as UserRegisterDate 
		FROM tblAuthor
		WHERE Active = 1
		ORDER BY Username		
	END

GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_all_customers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_all_customers]
	TO [davor.dumeljic]
GO
