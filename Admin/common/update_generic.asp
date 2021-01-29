
<%
'Response.Write "update_generic <br> Request.Form.Count="& Request.Form.Count & "<br>"

'tableName = request("tableName")
'AddID = request("AddID")
uid = request("uid")

Response.Write "tableName="& tableName & "<br>"
Response.Write "AddID ="& AddID  & "<br>"


Response.Write "Request.frmUser.Count="& Request.Form.Count & "<br>"





If (AddID <> "" ) Then

    	'cDt =  CDate(Dt)
	'sqlDate  =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)


	    sql ="exec  [dbo].[add_dbo." & tableName & "]  "


        For x = 1 to Request.Form.Count - 4
             sql = sql & "'"& Request.Form.Item(x) & "' , "
        Next

        sql = sql & "'"& Request.Form.Item(x) &"'"

        Response.Write sql
        set RS = SQLCN.execute(sql)
        Response.Write "<br> Update Successful! ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>

