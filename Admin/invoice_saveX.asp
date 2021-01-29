<%

AddID = request("AddID")
Submit = request("Submit")

if Submit ="Delete" then
	Response.Write "<h2> Cannot delete invoices"
	Response.Write "</h2>"
	Response.End
	DeleteID = AddID
	AddID =""
end if



if (AddID <> "") then

    Name = request("Name")
    Surname   = request("Surname")
    BillAddress = request("BillAddress")
    BillPostCode = request("BillPostCode")
    Email = request("Email")
    Phone = request("Phone")
    Mobile= request("Mobile")

    Description = request("Description")
    TotalInclVAT    = request("TotalInclVAT")

    DateOfInvoice    = request("DateOfInvoice")
    Cat    = request("Cat")
    Status    = request("Status")

    'The CustomerID is already set do not reassign as in 
    'CustomerID    = request("CustomerID")
    Response.Write "<br>CustomerID : " & CustomerID


	Description = request("Description")
	TotalInclVAT    = request("TotalInclVAT")

	DateOfInvoice    = request("DateOfInvoice")
	cDt =  CDate(DateOfInvoice)
	sqlDateOfInvoice =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)
    Cat    = request("Cat")


    if Cat = "" then Cat =1 end if
    if TotalInclVAT = "" then TotalInclVAT =0.0 end if


    If (AddID = "-1") Then
	    Response.Write "Add New Invoice "
	    SQL = "insert into Invoices (Description, TotalInclVAT, CustomerID, DateOfInvoice,Status, Cat) values ('"&_
	               Description & "', " &_
	               TotalInclVAT    & " , " &_
	               CustomerID & " , '" &_
	               sqlDateOfInvoice & "' , '" &_
	               Status 			& "' , " &_
	               Cat   			& ")"
	    Else
	        Response.Write "Update " & AddID
	    	SQL = "Update Invoices set Description  = '" & Description       & "' " &_
	    	                        ", TotalInclVAT = " & TotalInclVAT              &_
	    	                        ", CustomerID   = " & CustomerID                &_
	    	                        ", DateOfInvoice= '" & sqlDateOfInvoice  & "' " &_
	    	                        ", Status = '" 		 & Status  			 & "' " &_
	    	                        ", Cat           = " & Cat                       &_


	               " where ID = "& AddID
    
    End If
    Response.Write  " "
	Response.Write  " "
	Response.Write  SQL
	SQLCN.Execute(SQL)
End If

%>
