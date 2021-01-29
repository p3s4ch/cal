<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->


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


Name = request("Name")
Surname   = request("Surname")
BillAddress = request("BillAddress")
BillPostCode = request("BillPostCode")
Email = request("Email")
Phone = request("Phone")
Mobile= request("Mobile")

Description = request("Description")
TotalInclVAT    = request("TotalInclVAT")
CustomerID    = request("CustomerID")
DateOfInvoice    = request("DateOfInvoice")
Cat    = request("Cat")


If (CustomerID = "-1") Then
	    Response.Write "Add New Customer "
	    SQL = "insert into Customers (Surname, FirstName, Address, Postcode, Email, Phone,Mobile) values ('tempPlaceHolder','"&_

	               Name    & "' , '" &_
	               BillAddress & "' , '" &_
	               BillPostcode & "' , '" &_
	               Email    & "' , '" &_
	               Phone    & "' , '" &_
	               Mobile    & "')"

         Set RS = SQLCN.Execute(SQL)
	     Set RSID = SQLCN.Execute("select ID from Customers where Surname='tempPlaceHolder'")
	     CustomerID=RSID("ID")
	     Response.Write "New CustomerID = "& CustomerID
	     SQLCN.Execute("Update Customers set Surname = '"& Surname &"' where ID=" & CustomerID)


	Else
	    Response.Write "Update Customer " & CustomerID
 		SQL = "Update Customers set Surname = '" & Surname & "' " &_
 		                            ", FirstName = '" & Name    & "' " &_
 		                            ", Email = '" & Email  & "' " &_
 		                            ", Address = '" & BillAddress  & "' " &_
 		                            ", PostCode = '" & BillPostCode  & "' " &_
    	                            ", Phone = '" & Phone        & "' " &_
    	                            ", Mobile = '" & Mobile        & "' " &_

                        			 " where ID = "& CustomerID
       Response.Write "<BR>"
       Response.Write "<HR>"

       'Response.Write SQL
       Set RS = SQLCN.Execute(SQL)
End If

Response.Write "<br>CustomerID : " & CustomerID




If (AddID <> "") Then
	Description = request("Description")
	TotalInclVAT    = request("TotalInclVAT")
	CustomerID    = request("CustomerID")
	DateOfInvoice    = request("DateOfInvoice")
	cDt =  CDate(DateOfInvoice)
	sqlDateOfInvoice =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)
    Cat    = request("Cat")


    if Cat = "" then Cat =1 end if
    if TotalInclVAT = "" then TotalInclVAT =0.0 end if


    If (AddID = "-1") Then
	    Response.Write "Add New Customer "

	    SQL = "insert into Invoices (Description, TotalInclVAT, CustomerID, DateOfInvoice, Cat) values ('"&_
	               Description & "', " &_
	               TotalInclVAT    & " , " &_
	               CustomerID & " , '" &_
	               sqlDateOfInvoice & "' , " &_
	               Cat   &_
	               ")"

	Else
	    Response.Write "Update " & AddID
	    	SQL = "Update Invoices set Description  = '" & Description       & "' " &_
	    	                        ", TotalInclVAT = " & TotalInclVAT              &_
	    	                        ", CustomerID   = " & CustomerID                &_
	    	                        ", DateOfInvoice= '" & sqlDateOfInvoice  & "' " &_
	    	                        ", Cat          = " & Cat                       &_


	               " where ID = "& AddID

	End If
	    Response.Write  " "
	    Response.Write  " "
	    Response.Write  SQL
		Set RS = SQLCN.Execute(SQL)
End If






Response.Write "<br><a href=main.asp><font color=black>Main Menu</font></a> "
%>



