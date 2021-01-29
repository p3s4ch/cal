

<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")



SQL = "select * from Invoices where Status='Unpaid'"


IF filter_on="Action_Required" THEN
   SQL = "select * from Invoices where Status <> 'Paid' "
End IF




addEditPgLink="Invoices_add.asp"

spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices That Require Action" />
<input type="hidden" name="filter_on" value="Action_Required" /> <%=spacing%>
<input type="submit" name="Submit" value="Action Required" class="inputSubmit">
</form></TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="mysql" value="select * from Invoices" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="filter" value="CheckOutsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Invoices" class="inputSubmit">
</form></TD>

</TR>

<TR>

<td>
<form action="Generic_add5.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select '' Name" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Generic Add 5" /> <%=spacing%>
<input type="submit" name="Submit" value="ADD" class="inputSubmit" />
</form></td>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="mysql" value="select * from Invoices" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="filter" value="groupByMultiLets" /> <%=spacing%>
<input type="submit" name="Submit" value="All Invoices" class="inputSubmit">
</form></TD>

</TR>
</Table>


