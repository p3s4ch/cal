
<%

AddId = trim(request("AddId"))
Response.Write "AddId=" & AddId 
Response.Write "<br>"

If (AddId <> "" ) Then
    Name = request("Name")
    Comment   = request("Comment")
    paymentDate = request("paymentDate")
    Amount = request("Amount")
    
    PayMethod = request("PayMethod")
    InvoiceGiven = request("InvoiceGiven")
    
    if (Amount = "") then Amount=0 End if
    
    
    cDt =  CDate(paymentDate)
    DateOfPay =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)



    If ( AddId = "-1" ) Then
	    Response.Write "Add New"
	     SQL = "insert into Expenses (Name,[Date], Amount, PayMethod, InvoiceGiven, Comment) values ('tempPlaceHolder','"&_
                   DateOfPay & "' , " &_
	               Amount & " , '" &_
	               PayMethod & "' , '" &_
	               InvoiceGiven & "' , '" &_
	               Comment & "')"
	    
         SQLCN.Execute (SQL)
         Set RSID = SQLCN.Execute("select ID from Expenses where Name ='tempPlaceHolder'")
	     AddID=RSID("ID")
	     SQLCN.Execute("Update Expenses set Name = '"& Name &"' where ID=" & AddID)
	     Response.Write "Added ID="& AddID &"<BR>"
   Else
	    Response.Write "Update " & AddId
	    SQL = "Update Expenses set Name = '" & Name & "' " &_
 		                            ",[Date] = '" & DateOfPay    & "' " &_
 		                            ", Comment = '" & Comment    & "' " &_
 		                            
 		                             ", PayMethod = '" & PayMethod    & "' " &_
 		                              ", InvoiceGiven = '" & InvoiceGiven    & "' " &_
 		                            
 		                            ", Amount = " & Amount        &_
 		                            " where ID = "& AddID

       
        
        Response.Write SQL 
        SQLCN.Execute(SQL)
	    Response.Write "Updated ID " & AddID     
    End If   
         
End If    

Response.Write "<HR>"
%>
