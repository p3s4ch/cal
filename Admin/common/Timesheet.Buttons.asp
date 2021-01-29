

<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")



SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "
SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by DateOfInvoice desc "

SQL = "select * from Invoices where Status='Unpaid'" & SQL_ORDERBY
myheader="Invoices"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="Invoices_add.asp"

if filter_on = "" OR filter_on="INITIAL" then
  myheader="All Cash Accounts - Admin "
   SQL = "select 'please select from Buttons above'"
End If

if filter_on="Show_Balances" then
   myheader="All Cash Accounts - Admin "
   SQL = "select Payer CashAccount , cast(sum(Amount) as money) Balance from fees where Payer in " &_
          "(select Admin_ID from userRoles where Role= 'hasCashAccount') group by Payer"

End If


if filter_on="MyTimesheet" then

	SQL_Where = SQL_WhereBetween & SQL_SearchFor


   SQL = "select top 10 * from vTimesheet "

	SQL = "select * from vTimesheet " &  SQL_Where  & " order by [date] desc"
	Response.Write "<br> was SQL = " & SQL
	Response.Write "<br>"

	SQL = "select top 10 * from vTimesheet "

	SQL_TOT = "SELECT  IsNull (Sum(Total),0) Tot  FROM vTimesheet " &  SQL_Where

	Set RS_TOT = SQLCN.Execute(SQL_TOT)
	tots = RS_TOT("Tot")


	if tots <> "" then
	  Response.Write "<br><br> <b>Total &nbsp; &pound; " & FormatNumber(tots) & "</b><br>"
	end if

   myheader="MyTimesheet"

End If







spacing = "&nbsp; &nbsp; &nbsp; "

%>


<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Timesheet.Buttons" />
<input type="hidden" name="filter_on" value="MyTimesheet" /> <%=spacing%>
<input type="submit" name="Submit" value="Show MyTimesheet" class="inputSubmit">
</form>

</TD>
</TR>

</Table>


