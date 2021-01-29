
<%


if tableName = "" then
    tableName = request("tableName")
End if


UpdateID = request("AddID")
submit = request("submit")

If (submit = "Save" ) AND NOT tableName ="" Then


        SQL="exec dbo.update_  "  &  UpdateID & " , " & uid & " ,'" & tableName & "'"

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

