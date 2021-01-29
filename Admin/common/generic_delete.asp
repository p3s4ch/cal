
<%


if tableName = "" then
    tableName = request("tableName")
End if


DeleteID = request("AddID")
submit = request("submit")

If (submit = "Delete" ) AND NOT tableName ="" Then


        SQL="exec dbo.delete_  "  &  DeleteID & " , " & uid & " ,'" & tableName & "'"

        Response.Write "<br>"

        if isDebug then
             Response.Write SQL
        End If

        Response.Write "<br>"
        set RSUPDATE = SQLCN.execute(SQL)
        Response.Write "<HR>"
        'no need to do an add edit update on a dead record
        AddID=""

End If

%>

