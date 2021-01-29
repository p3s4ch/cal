
<%

CustomerID = trim(request("CustomerID"))
Category = request("Category")

    
If (CustomerID <> "" ) Then
    CusTitle = request("Title")
    Name = request("Name")
    Surname   = request("Surname")
    BillAddress = request("BillAddress")
    BillPostCode = request("BillPostCode")
    Email = request("Email")
    Phone = request("Phone")
    Mobile= request("Mobile")
    
    If (CustomerID = "-1") Then
	    Response.Write "Add New Customer "
	    SQL = "insert into Customers (Surname,Title, FirstName, Address, Postcode, Email, Phone,Mobile) values ('tempPlaceHolder','"&_
                   CusTitle    & "' , '" &_
	               Name    & "' , '" &_
	               BillAddress & "' , '" &_
	               BillPostcode & "' , '" &_
	               Email    & "' , '" &_
	               Phone    & "' , '" &_
	               Mobile    & "')"
	     Set RSID = SQLCN.Execute("select ID from Customers where Surname='tempPlaceHolder'")
	     CustomerID=RSID("ID")
	     SQLCN.Execute("Update Customers set Surname = '"& Surname &"' where ID=" & CustomerID)
	     Response.Write "<br>Added New Customer ID = "& CustomerID
	Else
 		SQL = "Update Customers set Surname = '" & Surname & "' " &_
 		                            ",Title = '" & CusTitle    & "' " &_
 		                            ", FirstName = '" & Name    & "' " &_
 		                            ", Email = '" & Email  & "' " &_
 		                            ", Address = '" & BillAddress  & "' " &_
 		                            ", PostCode = '" & BillPostCode  & "' " &_
    	                            ", Phone = '" & Phone        & "' " &_
    	                            ", Mobile = '" & Mobile        & "' " &_
                        			 " where ID = "& CustomerID

        Response.Write "Updated Customer " & CustomerID
        Response.Write "<HR>"
        'Response.Write SQL 
        SQLCN.Execute(SQL)
    End If
End If
%>
