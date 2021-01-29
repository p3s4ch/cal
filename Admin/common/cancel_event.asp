
<%

DeleteID = request("DeleteID")
Response.Write "DeleteID="& DeleteID

If (DeleteID <> "")      Then
  if ( Category = "Holiday" or Category = "available" or Category = "Kids" or Category = "Cancelled" ) then
		  SQL = "DELETE FROM cEvents WHERE ID = " & DeleteID
		  Set RS = SQLCN.Execute(SQL)
      else
		  SQL = "update cEvents set Confirmed = 'Cancelled' WHERE ID = " & DeleteID
		  Set RS = SQLCN.Execute(SQL)
  end If
End If

%>