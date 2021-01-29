
<%

'AddID = request("AddID")

If (AddID <> "" ) Then
    addID = request("addID")

      uid = request("uid")
      periodID   = request("periodID")

       sql ="exec  [dbo].[add_dbo.Preferences] "   & addID    & "," &_
  								        			uid       & "," &_
                                        			periodID  & "," &_
													periodID  & "," &_
													CustomerID  & ",'" &_
													Team  		& "','" &_
													Admin_ID  	& "'"




        set RS = SQLCN.execute(sql)
        Response.Write "<br> AddID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
