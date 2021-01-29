
<%


'AddID = request("AddID")

If (AddID <> "" ) Then
    addID = request("addID")
    TxID   = request("HSBC_TX")
    costCode   = request("costCode")
    CostCodeOther   = request("CostCodeOther")

    supplier = request("supplier")
    supplierOther   = request("supplierOther")

    description = request("description")

    scan = request("scan")
    location = request("location")
    total   = request("total")
    receiptNo = request("receiptNo")
    invoiceNo = request("invoiceNo")

    payment= request("payment")
    paymentOther= request("paymentOther")

    details   = request("ProjectDetails")
    detailsOther   = request("ProjectDetailsOther")

    if costCodeOther <> "" then costCode=CostCodeOther end if
    if paymentOther <> "" then payment=paymentOther end if
    if detailsOther <> "" then details=detailsOther end if


    if trim(total) = "" then total=0 end if
    if trim(invoiceNo) = "" then invoiceNo=-4 end if
    if trim(receiptNo) = "" then receiptNo=-2 end if
    if trim(TxID) = "" then TxID=-3 end if




    Response.Write "<br>paymentOther =" & paymentOther &"<br>"
    Response.Write "<br>payment =" & payment &"<br>"


   	cDt =  CDate(request("Dt"))
	sqlDate =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)
	if invoiceNo ="" then invoiceNo=0 end if

    sql ="exec  [dbo].[add_dbo.Costs] "   & addID & "," &_
                                	 "'" & sqlDate & "'," &_
                               		 "'" & costCode & "'," &_
                                     "'" & supplier & "'," &_
                                          total     & "," &_
                                          invoiceNo & "," &_
								          receiptNo & "," &_
                                     "'" & description & "'," &_
								     "'" & details     & "'," &_
                                     "'" & location    & "'," &_
                                     "'" & scan        & "'," &_
                                     "'" & payment     &"'," &_
                                          TxID

        set RS = SQLCN.execute(sql)
        Response.Write sql

        msg = "update_costs :: " & sql
        call gc_logger (uid, msg)

        'Response.End
        'Response.Write "<br> SlipNo : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
