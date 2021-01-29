<!--#include file="common/SQL_Cn.asp"-->


<%

hiddenUser = Request.Cookies("hiddenUser")
Response.Write "user="&hiddenUser	
Response.Write "<br>Sorry, Site is under maintenance will be back up in 20 minutes"

Dim rsUsers
set rsUsers = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT * FROM users WHERE Admin_ID = '" & hiddenUser & "';"
rsUsers.Open strSQL, SQLCN
 

If rsUsers.EOF Then
	Session("Admin_ID") = Request("Admin_ID")
	Response.Redirect "default.asp?SecondTry=True"
Else
    Session("Operator") = Request("Admin_ID")
    Session("isPole") = rsUsers("isPole")   
    Session("isContractor") = rsUsers("isContractor")   
    Session("isStaff") = rsUsers("isStaff")   
    Session("isAdmin") = rsUsers("isAdmin")
    Session("isDebug")  = rsUsers("isDebug")
    Session("isJam") = rsUsers("isJam")
    Session("showPayments") = rsUsers("showPayments")
    Session("team") = rsUsers("team")
    Session("Admin_ID") = rsUsers("Admin_ID")
    Session("isLoggedIn") = True
    Session("blnValidUser") = True
    Response.Write "Session has been auto renewed with a cookie"
    Response.Cookies("hiddenUser")=strID
    Response.Redirect "main.asp"
End If

%>

