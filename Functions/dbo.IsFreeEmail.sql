SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION dbo.IsFreeEmail 
(
    @EmailDomain nvarchar(50)
)
RETURNS bit
AS
BEGIN
    DECLARE @Result bit
    SET @Result = 0
    
    DECLARE @FreeEmailProviders nvarchar(4000)
    SET @FreeEmailProviders = '10minutemail.com,163.com,aemail4u.com,aol.com,att.net,bestsearch.com,bol.com.br,byke.com,canada.com,care2.com,catholic.org,comcast.net,computermail.net,dcemail.com,earthlink.net,easypeasy.com,eboxmail.net,ecologyfund.com,email.com,email.it,emailaccount.com,e-mailanywhere.com,emailchoice.com,emailx.net,emailyou.co.uk,everymail.com,everyone.net,execs2k.com,fastmail.fm,fuzzmail.org,galacmail.com,gmail.com,gmx.at,gmx.ch,gmx.de,gmx.fr,gmx.net,go.com,googlemail.com,hotmail.com,,howlermonkey.net,hushmail.com,ig.com.br,inbox.com,indiatimes.com,interia.pl,iwon.com,jershie.zzn.com,kukamail.com,libero.it,live.com,ail.com,mail.excite.com,mail.lycos.com,mail.ru,mail2web.com,mail2world.com,mailinator.com,mauimail.com,msn.com,muchomail.com,my.screenname.aol.com,mynet.com,myplace.com,myway.com,netaddress.com,netscape.aol.com,,nopeddlers.com,nz11.com,o2.pl,onet.eu,parsmail.com,peakinternet.com,poczta.fm,postmaster.co.uk,prontomail.com,rambler.ru,rediff.com,rediffmail.com,snowboard.ch,soltecsis.com,swissmail.net,thedoghousemai.com,t-online.de,ultimateemail.com,uol.com.br,verizon.net,virgilio.it,walla.co.il,web.de,web.synacor.com,webmail.juno.com,witchesbrew.zzn.com,wp.pl,yahoo.com,yandex.ru,ymail.com,zzn.com'    

    if @FreeEmailProviders like '%' + @EmailDomain + '%'
	   SET @Result = 1

    RETURN @Result
    
END
GO
GRANT EXECUTE
	ON [dbo].[IsFreeEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[IsFreeEmail]
	TO [davor.dumeljic]
GO
