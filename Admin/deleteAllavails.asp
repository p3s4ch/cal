<%

deleteAllID = request("deleteAllID")
Response.Write  "deleteAllID="& deleteAllID

If (deleteAllID <> "") Then
   SQL = "DELETE FROM cEvents WHERE dbo.truncDate(startTime) = (select dbo.truncDate(startTime) from cEvents where id = " & deleteAllID &_
          " ) and Operator= ( select Operator from cEvents where id = " & deleteAllID & ")"
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted ID = " & DeleteID
End If

%>