
<%

'AddID = request("AddID")




If (AddID <> "" ) Then
    addID=request("addID")
    Admin_ID =request("Admin_ID")
    Admin_Pass  =request("Admin_Pass")

    isPole =request("isPole")
    isContractor =request("isContractor")
    isStaff  =request("isStaff")
    isAdmin   =request("isAdmin")
    isDebug   =request("isDebug")
    isJam   =request("isJam")
    showPayments   =request("showPayments")
    team =request("team")
    isAudit =request("isAudit")
    isActive =request("isActive")
    CustomerID=request("Customer")
    seeAllCustomers=request("seeAllCustomers")


    Response.Write "<br>CustomerID =" & CustomerID
    Response.Write "<br>"

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
                                 isAudit & "," &_
                                 isActive  & "," &_
                                 seeAllCustomers

        Response.Write sql
        set RS = SQLCN.execute(sql)
        Response.Write "<br> ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
