
<%

CusTitle = Replace(trim(request("Title")),"'","`")
Name = Replace(trim(request("Name")),"'","`")
Surname   = Replace(trim(request("Surname")),"'","`")
BillAddress = Replace(trim(request("BillAddress")),"'","`")
BillPostCode = Replace(trim(request("BillPostCode")),"'","`")
Email = Replace(trim(request("Email")),"'","`")
Phone = Replace(trim(request("Phone")),"'","`")
Mobile= Replace(trim(request("Mobile")),"'","`")
Category = request("Category")
myString = request("CustomerID")
HeardAboutUs = request("HeardAboutUs")
Comment = request("Comment")
ReqInv = request("ReqInv")


If Surname = "NA" then Surname = "-" End If
If Comment = "" then Comment = "-" End If

If (Category = "Holiday" OR Category = "Kids" OR Category = "Available" ) Then
    'Response.END
    CustomerID = ""
end if



CustomerIDx = request("CustomerIDx")
CustomerID = request("CustomerID")

endIndex = InStr(myString, "~")

if endIndex > 2 then
	strVar1=Mid(myString,1,endIndex-1)
	CustomerID = strVar1
end if



if CustomerID="" and CustomerIDx <> "" then CustomerID=CustomerIDx end if

Response.Write "<br><b>CustomerID="&CustomerID & "</b><br>"


If (CustomerID <> "" ) Then
	sql =  "exec [dbo].[addCustomer] "& CustomerID  & ",'" &_
								CusTitle        & "','" &_
								Name & "','" &_
								Surname & "','" &_
								BillAddress & "','" &_
								BillPostcode & "','" &_
								Email & "','" &_
								Phone & "','" &_
								Mobile & "','" &_
								Comment & "','" &_
 								HeardAboutUs & "','" &_
								ReqInv & "'"

		Response.Write "<BR>" & sql

        set RS = SQLCN.execute(sql)
	    CustomerID = RS("MyID")

        Response.Write "Customer ID = "& CustomerID
        Response.Write "<HR>"
End if





    Response.Write "isGuest = "& isGuest & "<br>"

IF  isGuest THEN

    Response.Write "adding Guest as new user <br>"


    addID=-1
    Admin_ID =Email
    Admin_Pass  ="pickle"
    isPole =0
    isContractor =0
    isStaff  =0
    isAdmin   =0
    isDebug   =0
    isJam   =0
    showPayments   =0

    team ="ALL"
    isCustomer =1
    isAudit =0
    isActive =0
    Cust=CustomerID
    seeAllCustomers=0

    sql ="exec  [dbo].[addUsers] "   & addID & "," &_
  								 "'" & Admin_ID & "'," &_
                                 "'" & Admin_Pass & "'," &_
                                 isPole & "," &_
								 isContractor & "," &_
                                 isStaff & "," &_
                                 isAdmin & "," &_
                                 isDebug & "," &_
                                 isJam & "," &_
                                 showPayments & "," &_
                                 "'" & team & "'," &_
								 CustomerID  & "," &_
								 isCustomer & "," &_
                                 isAudit & "," &_
                                 isActive  & "," &_
                                 seeAllCustomers

        Response.Write sql
        set RS = SQLCN.execute(sql)
        Response.Write "<br> ID : " & RS("MyID")
        Response.Write "<HR>"



        Admin_ID=RS("Admin_ID")
        Admin_Pass=RS("Admin_Pass")


		Response.Write  "Thank you for using pickle please use the followind details to manage your bookings <br> "
		Response.Write  " User : <br>"     & Admin_ID
		Response.Write  " Password : <br>" & Admin_Pass
		Response.Write  " <br>"

		'Now switch user
		uid=RS("MyID")


End If

%>


