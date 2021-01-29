





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")




if filter_on = "" OR filter_on="Initial" then
   myheader="The Nolig Chad Dashboard"
   SQL = "select 'Extracting numbers from card merchant...'"
End If



if filter_on="usersByrole" then
   SQL_Where5 = " where Admin_ID like '%" & SearchFor &"%' or Surname like '%" & SearchFor &"%'"
   SQL = "select * from usersByrole ('" & role &"') " & SQL_Where5
End If

if filter_on="RoleByUser" then
   SQL_Where5 = " where Admin_ID = '" & SearchFor &"'"
   SQL = "select * from userRoles " & SQL_Where5
End If


%>




<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<br>
<Table border="1">

<TR>

<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Dashboard.Buttons" />
<input type="hidden"      name="filter_on" value="adiReport" />
<input type="hidden"      name="mysql" value=" select * from Adi " />
<input type="submit"     name="Submit" value="Show Caluculated Report Results" class="inputSubmit">
</form>
</TD>

</TR>
<TR>


<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="MonthView.asp?Operator=Ronit&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Ronit`s Calendar</b></font></a></td></tr>
<tr>
<td bgcolor="#000000" height="1"></td>


</TR>
<TR>

<TD>
<form action="MonthView.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Dashboard.Buttons" />
<input type="hidden"      name="Operator" value="Ronit" />
<input type="hidden"      name="filter_on" value="adiReport" />
<input type="hidden"      name="mysql" value=" select * from Adi " />
<input type="submit"     name="Submit" value="Ronit`s Calendar" class="inputSubmit">
</form>
</TD>

</TR>


<tr>
<tr><td height="5">&nbsp;</td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
   <a href="ScannedDocsIndex.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=red ><b>&nbsp;Scanned Docs</b></font></a>   </td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<tr><td height="5">&nbsp;</td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
     <a href="MultiMonthView.asp?Operator=Gilon&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Gilon MultiMonthView</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr>
<tr><td height="5">&nbsp;</td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="generic.asp?uid=<%=uid%>&tablename=Logs"><font face="Verdana" size="1"><b>&nbsp;Logs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>



<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="FINAL_WAGES" /> <%=spacing%>
<input type="submit" name="Submit" value="Show Wages"  class="inputSubmit">
</form>
</TD>


</Table>




