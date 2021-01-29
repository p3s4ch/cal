
<%


DeleteID = request("DeleteID")
AddID = request("AddID")
Response.Write "AddID =" & AddID 

If (DeleteID <> "") Then
  SQL = "DELETE FROM Operators WHERE ID = " & DeleteID
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted ID = " & DeleteID
End If

If (AddID <> "") Then
    ID = request("ID")
	Name    = request("Name")
	Plumbing    = request("Plumbing")
	Decorating    = request("Decorating")
	Garden= request("Garden")
	Quote       = request("Quote")
	Handyman    = request("Handyman")
	Services    = request("Services")
	Gas         = request("Gas")
	Telephone   = request("Telephone")
    Mobile      = request("Mobile")
    Status      = request("Status")
    Comment     = request("Comment")
    Team        = request("Team")
    AutoText    = request("AutoText")
    
    If (AddID = "-1") Then
	    Response.Write "Add New "
	    SQL = "insert into Operators ([Name],Plumbing, Decorating,Garden,Quote,Handyman,Services,Gas,Telephone,Mobile,Status,Comment,Team,AutoText) values ('" &_
	               name    & " ','" &_
	               Plumbing & "' , '" &_
	               Decorating  & "' , '" &_
	               Garden    & "' , '" &_
	               Quote    & "' , '" &_
	               Handyman    & "' , '" &_
	               Services    & "' , '" &_
	               Gas  & "' , '" &_
	               Telephone    & "' , '" &_
	               Mobile    & "' , '" &_
	               Status    & "' , '" &_
	               Comment    & "' , '" &_
	               Team    & "' , '" &_
	               AutoText    & "')"

	Else
	    Response.Write "Update " & AddID
 		SQL = "Update Operators     set name = '" & name & "' " &_
 		                            ", Plumbing = '" & Plumbing    & "' " &_
 		                            ", Decorating = '" & Decorating  & "' " &_
 		                            ", Garden = '" & Garden  & "' " &_
 		                            ", Quote = '" & Quote  & "' " &_
    	                            ", Handyman = '" & Handyman        & "' " &_
    	                            ", Services = '" & Services        & "' " &_
    	                            
    	                            ", Gas = '" & Gas        & "' " &_
    	                            ", Telephone = '" & Telephone        & "' " &_
    	                            ", Mobile = '" & Mobile        & "' " &_
    	                            ", Status = '" & Status        & "' " &_
    	                            ", Comment = '" & Comment        & "' " &_
    	                            ", Team = '" & Team        & "' " &_
    	                            ", AutoText = '" & AutoText        & "' " &_
    	                            
    	                             
    	                            "  where ID = "& AddID
	End If
	    Response.Write  " "
	    Response.Write  SQL
	    Set RS = SQLCN.Execute(SQL)
End If

SQL = "SELECT * FROM Operators"
'Response.Write SQL
%>
