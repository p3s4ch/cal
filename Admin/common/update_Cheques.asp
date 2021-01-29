
<%

'AddID = request("AddID")
DeleteID = request("DeleteID")

If (DeleteID <> "")      Then
      SQL = "DELETE FROM Cheques WHERE ID = " & DeleteID
      Set RS = SQLCN.Execute(SQL)
      Response.Write "Succesfully deleted ID : " & DeleteID & "<br>"
end If

If (AddID <> "" ) Then
    addID = request("addID")
    ChequeNo = request("ChequeNo")
    Beneficiary    = request("Beneficiary")
    CostCode    = request("CostCode")
    description = request("details")
    Dt    = request("asofdate")
    Amount    = request("Amount")
    DateReceived    = request("DateOf")
	hsbc_tx    = request("hsbc_tx")

	cDt =  CDate(Dt)
	sqlDate  =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)
    if Total = "" then Total =0.0 end if
	if ChequeNo = "" then ChequeNo =0 end if
	if hsbc_tx = "" then hsbc_tx =-1 end if



    sql ="exec  [dbo].[addCheque] "   & addID & "," &_
                                         ChequeNo & "," &_
  								         "'" & sqlDate & "'," &_
  								         "'" & Beneficiary & "'," &_
  								         "'" & CostCode & "'," &_
  								         "'" & description & "'," &_
                                         Amount & "," &_
                                         hsbc_tx

        Response.Write sql
        'Response.End
        set RS = SQLCN.execute(sql)


        msg = "update_cheques :: " & sql
        call gc_logger (uid, msg)

        'Response.Write sql
        'Response.End
        Response.Write "<br> ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
