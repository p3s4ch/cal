





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")




if filter_on = "" OR filter_on="INITIAL" then
   myheader="Fix Accounts: for HMRC VAT ADI CHAD"
   SQL = "select 'select the top buttons'"
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
<input type="hidden"      name="bttns" value="FixAccounts.Buttons" />
<input type="hidden"      name="filter_on" value="adiReport" />
<input type="hidden"      name="mysql" value=" select max (date) from hsbc_bib " />
<input type="submit"     name="Submit" value="FIX HSBC" class="inputSubmit">
</form>
</TD>



<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="FixAccounts.Buttons" />
<input type="hidden"      name="filter_on" value="adiReport" />
<input type="hidden"      name="mysql" value=" select max (date) from hsbc_bib " />
<input type="submit"     name="Submit" value="FIX HSBC"     class="inputSubmit">
</form>
</TD>



<TD>
<form action="imports.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="FixAccounts.Buttons" />
<input type="hidden"      name="filter_on" value="INITIAL" />
<input type="submit"     name="Submit" value="Imports ..."     class="inputSubmit">
</form>
</TD>





<td>
<form action="GenericSQLExecutor.asp?"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="dbo.UpdateCostCodes" />
<input type="hidden" name="code" value="23" />
<input type="submit" name="Submit" value="dbo.UpdateCostCodes" class="inputSubmit" >
</form>

</td>



<TD>
<form action="ChadUtils.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="submit"     name="Submit" value="Chad Utils" class="inputSubmit">
</form>
</TD>



<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;Gilon's Jobs</b></font></a></td>



</TR>

<TR>


</TR>
</Table>




