

<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<Table>
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="select * from Operators" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="myheader" value="Next 7 Days Checkins" />
<input type="hidden" name="filter" value="CheckinsT7" /> <%=spacing%>
<input type="submit" name="Submit" value="not Rooms" class="inputSubmit">
</form></TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="select * from Operators" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="filter" value="CheckOutsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Check Outs Today" class="inputSubmit">
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
<input type="hidden" name="mysql" value="select * from Operators" />
<input type="hidden" name="where_sql" value=" where Name not like '%Room%' " />
<input type="hidden" name="filter" value="groupByMultiLets" /> <%=spacing%>
<input type="submit" name="Submit" value="Reservations of Multiple Rooms" class="inputSubmit">
</form></TD>

</TR>
</Table>


