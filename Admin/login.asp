<!--#include file="common/SQL_Cn.asp"-->


<%

'Response.Write("including the correct SQL")
Admin_ID = Request("Admin_ID")


If Session("blnValidUser") = True and Session("Admin_ID") = "" Then
		Dim rsPersonIDCheck
		Set rsPersonIDCheck = Server.CreateObject("ADODB.Recordset")
		Dim strSQL
		strSQL = "SELECT * FROM users WHERE Admin_ID = '" & Session("Admin_ID") & "';"

		rsPersonIDCheck.Open strSQL, SQLCN

		If rsPersonIDCheck.EOF Then
			Session("blnValidUser") = False
  		Else
			Session("Admin_ID") = rsPersonIDCheck("Admin_ID")

		End If
		rsPersonIDCheck.Close
		Set rsPersonIDCheck = Nothing
End If

Response.Write("this is using users ")



'Response.End

Dim strID, strPassword
	strID = Request("Admin_ID")
	Response.Cookies("hiddenUser")=strID
	strPassword = Request("Password")

	Dim rsUsers
	set rsUsers = Server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT * FROM users WHERE Admin_ID = '" & strID & "';"
	rsUsers.Open strSQL, SQLCN


    Session("Operator") = Request("Admin_ID")

	If rsUsers.EOF Then
		Session("Admin_ID") = Request("Admin_ID")
		Response.Redirect "default.asp?SecondTry=True"
	Else
		While Not rsUsers.EOF

            Session("isPole") = rsUsers("isPole")
            Session("isContractor") = rsUsers("isContractor")
            Session("isStaff") = rsUsers("isStaff")
            Session("isAdmin") = rsUsers("isAdmin")
            Session("isDebug")  = rsUsers("isDebug")
            Session("isJam") = rsUsers("isJam")
            Session("showPayments") = rsUsers("showPayments")
            Session("team") = rsUsers("team")
            Session("isAudit") = rsUsers("isAudit")
            Session("CustomerID") = rsUsers("CustomerID")

            Session("isMars")="1"

            uid = rsUsers("ID")


            Session.Timeout=1440

            sqllog = "exec [dbo].[add_dbo.Logs] -1," & uid    & ",'login where Admin_ID = "& Admin_ID   &"'"
            Response.Write sqllog
            SQLCN.Execute(sqllog)

            If UCase(rsUsers("Admin_Pass")) = UCase(strPassword) Then
				Session("Admin_ID") = rsUsers("Admin_ID")
    			Session("isLoggedIn") = True
				Session("blnValidUser") = True
				Response.Redirect "GSViewer5.asp?uid=" & uid
			Else
				rsUsers.MoveNext
			End If
		Wend
		Session("Admin_ID") = Request("Admin_ID")
		Response.Redirect "default.asp?SecondTry=True&WrongPW=True"
	End If
%>

