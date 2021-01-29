
<%

CusTitle = request("Title")
Name = request("FirstName")
Surname   = request("Surname")
BillAddress = request("BillAddress")
BillPostCode = request("BillPostCode")
Email = request("Email")
Phone = request("Phone")
Mobile= request("Mobile")
Category = request("Category")
Comment = request("Comment")
CustomerID = request("CustomerID")

Response.Write "<br>update_TelephoneBook"

If (CustomerID <> "") Then

    If (CustomerID = "-1") Then
	        'Response.Write "Add New TelephoneBook "
	        SQL = "insert into TelephoneBook (Surname,Title, FirstName, Address, Postcode, Email, Phone,Mobile,Comment) values ('tempPlaceHolder','"&_
                       CusTitle    & "' , '" &_
	                   Name    & "' , '" &_
	                   BillAddress & "' , '" &_
	                   BillPostcode & "' , '" &_
	                   Email    & "' , '" &_
	                   Phone    & "' , '" &_
	                   Mobile    & "' , '" &_
	                   Comment    & "')"

             
             Set RS = SQLCN.Execute(SQL)
             'Response.Write SQL
             'Response.End
	         Set RSID = SQLCN.Execute("select ID from TelephoneBook where Surname='tempPlaceHolder'")
	         CustomerID=RSID("ID")
	         SQLCN.Execute("Update TelephoneBook set Surname = '"& Surname &"' where ID=" & CustomerID)
	         Response.Write "Added New TelephoneBook ID = "& CustomerID
	    Else
 		    SQL = "Update TelephoneBook set Surname = '" & Surname & "' " &_
 		                                ",Title = '" & CusTitle    & "' " &_
 		                                ", FirstName = '" & Name    & "' " &_
 		                                ", Email = '" & Email  & "' " &_
 		                                ", Address = '" & BillAddress  & "' " &_
 		                                ", PostCode = '" & BillPostCode  & "' " &_
    	                                ", Phone = '" & Phone        & "' " &_
    	                                ", Mobile = '" & Mobile        & "' " &_
    	                                 ", Comment = '" & Comment        & "' " &_
                        			     " where ID = "& CustomerID

           'Response.Write "Updated TelephoneBook " & CustomerID
           'Response.Write "<HR>"
           Response.Write SQL
           Set RS = SQLCN.Execute(SQL)
    End If

End If
%>
