
<%

If (AddID <> "" ) Then
    addID = request("addID")

      Payer = request("Payer")
      Response.Write "Payer=" & Payer
      PayerOther   = request("PayerOther")
      Comment   = request("Comment")
      asofdate = request("asof")
      Amount = request("Amount")

      Guest = request("Guest")
	  GuestOther   = request("GuestOther")
      StaffTransfer = request("StaffTransfer")

      if (Amount = "") then Amount=0 End if



      if PayerOther <> "" then Payer=PayerOther end if
      if GuestOther <> "" then Guest=GuestOther end if
      if (Guest = "") then Guest="#" End if

      if (StaffTransfer = "") then StaffTransfer="" End if

      Response.Write "asofdate=" & asofdate
      Response.Write "<br>"

      cDt =  CDate(request("asofdate"))
	  sqlDate =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)




    sql ="exec  [dbo].[add_dbo.Fees] "   & addID & "," &_
  								 "'" & Payer & "',"    &_
                                 "'" & sqlDate & "'," &_
                                     Amount & ",'"     &_
                                     Comment       &"','"  &_
                                     Guest         &"','"  &_
                                     StaffTransfer &"'"

        set RS = SQLCN.execute(sql)
        Response.Write sql
        'Response.Write "<br> AddID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
