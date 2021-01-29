<!--#include file="common/SQL_Cn.asp"-->


<%
	
Response.Write("including the correct SQL")



'If Session("blnValidUser") = True and Session("Admin_ID") = "" Then
		Dim rsPersonIDCheck
		Set rsPersonIDCheck = Server.CreateObject("ADODB.Recordset")
		Dim strSQL
		strSQL = "SELECT * FROM users WHERE Admin_ID = '" & Session("Admin_ID") & "';"
		
		rsPersonIDCheck.Open strSQL, SQLCN
		
		If rsPersonIDCheck.EOF Then
			Session("blnValidUser") = False
            Response.Write("session not valid but none dies")
			
			
		Else
			Session("Admin_ID") = rsPersonIDCheck("Admin_ID")
			 Response.Write("asll well session ")
		End If
		rsPersonIDCheck.Close
		Set rsPersonIDCheck = Nothing
'End If
	
Response.Write("this is using users ")
	
	
Response.End


%>

