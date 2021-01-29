<!--#include file="SQL_Cn2.asp" -->
<!--#include file="Loggedin.asp"-->


<%

orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")

if Submit ="Delete" then
	DeleteID = AddID
	AddID =""
end if



Response.Write "<h2> Cannot delete invoices"
Response.Write "</h2>"
Response.Write "<a href=Admin\main.asp?><font color=black>Main Menu</font></a> "
Response.End




If (AddID <> "") Then
	Description = request("Description")
	TotalInclVAT    = request("TotalInclVAT")
	CustomerID    = request("CustomerID")
	DateOfInvoice    = request("DateOfInvoice")
	Cat    = request("Cat")

    If (AddID = "-1") Then
	    Response.Write "Add New Customer "

	   ' SQL = "insert into Invoices (Description, TotalInclVAT, CustomerID, DateOfInvoice, Cat) values ('"&_
	   '            Description & "', " &_
	   '            TotalInclVAT    & " , " &_
	   '            CustomerID & " , '" &_
	   '            DateOfInvoice & "' , " &_
	   '            Cat   &_
	   '            ")"

	Else
	    Response.Write "Update " & AddID
	    	SQL = "Update Invoices set Description = '" & Description & "' " &_
	               " where ID = "& AddID




	End If
	    Response.Write  " "
	    Response.Write  " "
	    Response.Write  SQL
		Set RS = SQLCN.Execute(SQL)
End If




Name = request("Name")
Surname   = request("Surname")
BillAddress = request("BillAddress")
BillPostCode = request("BillPostCode")
Email = request("Email")
Phone = request("Phone")
Mobile= request("Mobile")

CustomerID = request("CustomerID")





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





'To do Get CustomerID
if CustomerID      = "" then CustomerID =0 end if



SiteAddress0   = request("Address")
SitePostCode0  = request("PostCode")



Response.Write "<br>"
Response.Write "AddID = " & AddID
Response.Write "<br>"

StartDate = request("StartDate")
StartHour = request("StartHour")
EndDate = request("EndDate")
EndHour = request("EndHour")
Title = request("Title")
Details0 = request("Details")
Assigned = request("Assigned")
Category = request("Category")
Operator = request("Operator")
AllDay =request("AllDayEvent")
'CatA = request("CatA")
CatB = request("CatB")

Office0 = request("Office")
Email    = request("Email")

'SiteAddress   = request("Address")
'SitePostCode  = request("PostCode")

SameAsBill  = request("SameAsBill")
Phone    = request("Phone")
BillTotal = request("BillTotal")
if BillTotal   = "" then BillTotal=0 end if
if CustomerID  = "" then CustomerID =0  end if
if SameAsBill  = "" then  SameAsBill =0 end if

x= StartDate & " " & StartHour
z= EndDate & " " & EndHour
cDtStart =  CDate(x)
cDtEnd   =  CDate(z)
StartTime =Month(cDtStart) & "/" & Day(cDtStart)& "/" &Year(cDtStart)& " " & StartHour
Endtime   =Month(cDtEnd) & "/" & Day(cDtEnd)& "/" &Year(cDtEnd)& " " & EndHour

StartTime  	="'" & StartTime 	&"'"
EndTime    	="'" & EndTime		&"'"
Title  		="'" & Title  		&"'"
Details 		="'" & Details0		&"'"
Category      ="'" & Category 	&"'"
Office        ="'" & Office0    	&"'"
SiteAddress   ="'" & SiteAddress0 	&"'"
SitePostCode 	="'" & SitePostCode0 &"'"
Color 		="'" & Color  		&"'"
Operator 		="'" & Operator		&"'"




if AllDay = "" then AllDay =0 end if
if CatB = "" then CatB =0 end if
if CustomerID = "" then CustomerID =0 end if
if BillTotal = "" then BillTotal =0 end if
if SameAsBill = "" then SameAsBill =0 end if
if siteID = "" then siteID =0 end if
if GroupID = "" then GroupID =0 end if



Response.Write "<br>"
Response.Write  "<h2> Micro Men Invoice: <br>"
Response.Write   "From:" & WeekdayName(Weekday(cDtStart))&" " & Day(cDtStart)&  "/"& Month(cDtStart) & "/" & Year(cDtStart)& " at " & StartHour    & "<br> "

Response.Write   request("Operator") & "  " & request("Category") & "<br>"

Response.Write  "<hr>"

Response.Write   "Customer  &nbsp;:" &  FirstName & " &nbsp; &nbsp; " & Surname & "<br>"

Response.Write   "Site Address :" &  SiteAddress0 & " &nbsp; &nbsp; " & SitePostCode0 & "<br>"

Response.Write   "Details:" & "  " & Details0 & "<br>"

Response.Write   "Office:" & "  " & Office0 & "<br>"

Response.Write   "Estimated Bill " & BillTotal & "<br>"

Response.Write  "Please make a note of your booking number # "& id &" <br>"

Response.Write  "<hr>"


Response.Write  "This number should please be given to the customer and also recorded in the telephone message </h1></b></font>"


Response.Write  "<br><hr>"

Response.Write  "<br><br><br><a href=Admin\events_add.asp?AddID=" &id &"><font color=red>click here to delete or to make correction</font></a>"



%>
<br>
<p align=centre>

   <a href=Admin\main.asp?><font color=black>Main Menu</font></a>

</p>
