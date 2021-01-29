

<%
Response.Write "Hi " & Admin_ID

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



addEditPgLink="GSAdd5.asp"
printPgLink="invoice_print.asp"
editPgLink="GSAdd5.asp"

if filter_on = "" OR filter_on="INITIAL" then
  myheader="Instructions "
   SQL = "select 'please select from Buttons above'"
End If



if filter_on="Show_All" then
   myheader="Instructions "
   SQL = "select ID id2edit, Item = ROW_NUMBER() OVER (ORDER BY FirstName), Surname [Task], Comment from TelephoneBook " &_
          "where Title='2do' and ( FirstName like '%" & Admin_ID & "%' OR FirstName='All' ) "

End If


spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Instructions.Buttons" />
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Show All" class="inputSubmit">
</form>

</TD>
</TR>



</Table>


