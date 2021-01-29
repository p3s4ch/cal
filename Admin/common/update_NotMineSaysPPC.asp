
<%


'AddID = request("AddID")

If (AddID <> "" ) Then
    addID = request("addID")

    origSlipNo = request("origSlipNo")
    notMinePPC = request("notMinePPC")

    costCode   = request("costCode")
    CostCodeOther   = request("CostCodeOther")

    supplier = request("supplier")
    supplierOther   = request("supplierOther")

    description = request("description")
    gilonDetails   = request("gilonDetails")
    scan = request("scan")
    location = request("location")
    total   = request("total")
    receiptNo = request("receiptNo")
    invoiceNo = request("invoiceNo")

    payment= request("payment")
    paymentOther= request("paymentOther")


    if costCodeOther <> "" then costCode=CostCodeOther end if
    if paymentOther <> "" then payment=paymentOther end if

    Response.Write "<br>paymentOther =" & paymentOther &"<br>"
    Response.Write "<br>payment =" & payment &"<br>"


   	cDt =  CDate(request("asofdate"))
	sqlDate =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)
	if invoiceNo ="" then invoiceNo=0 end if

    sql ="exec  [dbo].[addNotMinePPCCosts] "   & addID & "," &_
    							     origSlipNo & "," &_
  								 "'" & costCode & "'," &_
                                 "'" & supplier & "'," &_
                                 "'" & description & "'," &_
								 "'" & gilonDetails & "'," &_
                                 "'" & scan & "'," &_
                                 "'" & location & "'," &_
                                 "'" & notMinePPC & "'," &_
                                 "'" & sqlDate & "'," &_
                                 "'" & receiptNo & "'," &_
                                      invoiceNo  & "," &_
                                  "'" & payment  &"'"

        set RS = SQLCN.execute(sql)
        Response.Write sql
        'Response.End
        Response.Write "<br> SlipNo : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
