
Tuturial 3

<%

bttns = request("bttns")
SQL = "select 'Hello SQL'  "

%>

<Table>
<TR>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="flights" />
<input type="hidden"      name="bttns"  value="ReservationReports.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" />
<input type="hidden" name="filter_on" value="Show_All" />
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>
</TD>
</TR>
</Table>


