
<%

uid = request("uid")

if  (uid <> "" ) Then
    SQL = "select * from users where ID="& uid
	Set RS = SQLCN.Execute(SQL)
	     isPole = RS("isPole")
         isContractor = RS("isContractor")
         isStaff = RS("isStaff")
         isAdmin = RS("isAdmin")
         isDebug  = RS("isDebug")
         isJam       =     RS("isJam")
         showPayments = RS("showPayments")
         team           = RS("team")
         isAudit        = RS("isAudit")
         CustomerID = RS("CustomerID")
	     isGuest = RS("isGuest")


	if CustomerID > 0 then
	   isCustomer = 1
	else
	   isCustomer = 0
	end if

else
    'Response.Write "uid = "& uid & ".<br>"
    Response.Redirect "loggedout.asp"
end if




%>

