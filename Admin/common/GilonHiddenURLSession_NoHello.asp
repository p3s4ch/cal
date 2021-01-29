
<%

uid = request("uid")

if  (uid <> "" ) Then

    SQL = "select u.* ,  isNull(c.ReqInv,0) ReqInv from users u left join Customers c on u.CustomerID = c.ID where u.ID=  "& uid

	Set RS = SQLCN.Execute(SQL)
	     'isPole = RS("isPole")
         isContractor = RS("isContractor")
         isStaff = RS("isStaff")
         'isAdmin = RS("isAdmin")
         'isDebug  = RS("isDebug")
         'isJam       =     RS("isJam")
         showPayments = RS("showPayments")
         team           = RS("team")
         'isAudit        = RS("isAudit")
         CustomerID = RS("CustomerID")
	     Admin_ID = RS("Admin_ID")

	     seeAllCustomers = RS("seeAllCustomers")

	 if CustomerID > 0 then
	   isCustomer = 1

	   ReqInv = RS("ReqInv")

	else
	   isCustomer = 0
	end if

    if Admin_ID = "bsconstructions.uk@gmail.com" then
		    showBillashersOwnCards = 1
	end if

    Response.Write "<input type=hidden name=uid value="& uid &">"
    'Response.Write "ReqInv="& ReqInv &" "
else
   Response.Redirect "loggedout.asp"
end if




%>

