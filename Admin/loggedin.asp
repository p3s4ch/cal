<%
    'Session.Timeout=1440
	
    
    hiddenUser = Request.Cookies("hiddenUser")
    'Response.Redirect "renew.asp"
	
    If Session("isLoggedIn") <> True Then
		If  hiddenUser <>"" then
		   Response.Redirect "renew.asp"
		End If
		     
	    Response.Redirect "loggedout.asp"
		 
	End If
%>