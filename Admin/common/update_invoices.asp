
<%
Response.Write "v4"

Response.Write "<br>"
myString = request("CustomerID")
CustomerIDx = request("CustomerIDx")


if CustomerID > 0 then
	Response.Write "passed from prev server call updateCustomers CustomerID  ="& CustomerID & "<br>"
else
	CustomerID = request("CustomerID")
end if

Response.Write "simple CustomerID  ="& CustomerID & "<br>"
Response.Write "CustomerID string ="& myString & "<br>"
Response.Write "CustomerIDx  ="& CustomerIDx & "<br>"
endIndex = InStr(myString, "~")
Response.Write "endIndex ="& endIndex & "<br>"
if endIndex > 2 then
	strVar1=Mid(myString,1,endIndex-1)
	CustomerID = strVar1
end if
if CustomerID="" and CustomerIDx <> "" then CustomerID=CustomerIDx end if
Response.Write "<br><b>CustomerID="&CustomerID & "</b><br>"


Response.Write "CustomerID = " & CustomerID & "<br>"



AddID = request("AddID")

If (AddID <> "" ) Then
    addID = request("addID")

	Description = request("Description")
	'CustomerID    = request("CustomerID")


	Total= Replace(request("Total"), ",", "")
	VAT= Replace(request("VAT"), ",", "")
	VATpct= Replace(request("VATpct"), ",", "")
	TotalInclVAT= Replace(request("TotalInclVAT"), ",", "")



	Cat    = trim(request("Cat"))
	Status    = trim(request("Status"))
    EventID = trim(request("EventID"))


	DateOfInvoice    = request("DateOfInvoice")
	cDt =  CDate(DateOfInvoice)
	sqlDate =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)


	if Cat = "" then Cat =1 end if
    if EventID = "" then EventID =-9 end if


    if Total = "" then Total =0.0 end if
    if VAT = "" then VAT =0.0 end if
    if VATpct = "" then VATpct =0.0 end if
    if TotalInclVAT = "" then TotalInclVAT =0.0 end if


    Response.Write "asofdate=" & asofdate
    Response.Write "EventID=" & EventID
    Response.Write "Cat=" & Cat

    Response.Write "<br>"

    sql ="exec  [dbo].[add_dbo.Invoice] "   & addID & "," &_
  								 "'" & Description & "',"    &_
  								     CustomerID & ","     &_

  								    Total & ","     &_
                                     VATpct & ","     &_
                                     VAT & ","     &_
                                     TotalInclVAT & "," &_
                                 "'" & sqlDate & "'," &_
                                    Cat       & ", " &_
                                    EventID   & ",'" &_
                                    Status  &"', 0"



        Response.Write sql

        set RS = SQLCN.execute(sql)

        msg = "update_invoices :: " & sql
        call gc_logger (uid, msg)

        'Response.End
        Response.Write "<br> AddID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
