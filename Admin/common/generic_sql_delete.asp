
<%
tableName = request("tableName")
DeleteID = request("AddID")
submit = request("submit")

If (submit = "Delete" ) Then
      SQL="delete from dbo." & tableName & "  where ID = " &  DeleteID

        Response.Write "<br>"
        'Response.Write SQL
        'Response.Write "<br>"
        set RSDEL = SQLCN.execute(SQL)
        Response.Write "Record Deleted <HR>"
        'no need to do an add edit update on a dead record
        AddID=""

End If
%>

