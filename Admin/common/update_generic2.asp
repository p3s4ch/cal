
<%
'Response.Write "update_generic <br> Request.Form.Count="& Request.Form.Count & "<br>"
tableName = Request("tableName")
'Response.Write "tableName="& tableName & "<br>"

addID = request("addID")

If (AddID <> "" ) Then
    addID = request("addID")

	'cDt =  CDate(Dt)
	'sqlDate  =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)


	    sql ="exec  [dbo].[add_" & tableName & "]  " & Request.Form.Item("AddId") & ","

        For x = 1 to Request.Form.Count - 4
            sql = sql & "'"& replace (Request.Form.Item(x), "'" , "") & "' , "
        Next

        sql = sql & "'"& replace (Request.Form.Item(x), "'" , "") &"'"
        Response.Write sql
        set RS = SQLCN.execute(sql)
        Response.Write "<br> Update Successful! ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>

