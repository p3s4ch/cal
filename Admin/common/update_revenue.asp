<%

AddID = request("AddID")
Submit = request("Submit")


if (AddID <> "") And Submit <> "Delete" then

    InvoiceID    = request("InvoiceID")
    if trim(InvoiceID) = "" then InvoiceID=0 end if
	PaymentType = request("PaymentType")
	DateReceived    = request("DateOf")
	cDt =  CDate(DateReceived)
	sqlDateReceived  =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)





    Amount= Replace(request("Amount"), ",", "")
    if Amount = "" then Amount =0.0 end if



    sql ="exec  [dbo].[add_dbo.Revenue] "   & addID & "," &_
	  								    "'" & sqlDateReceived & "',"    &_
	  								          Amount  & ","     &_
	                                    "'" & PaymentType  &"'," &_
	                                          InvoiceID



	Response.Write  SQL
	SQLCN.Execute(SQL)
End If



%>
