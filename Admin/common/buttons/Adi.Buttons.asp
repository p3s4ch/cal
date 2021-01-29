





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")




if filter_on = "" OR filter_on="Initial" then
   myheader="Calculating the monthly results... results are now ready"
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
<input type="hidden"      name="bttns" value="Adi.Buttons" />
<input type="hidden"      name="filter_on" value="adiReport" />
<input type="hidden"      name="mysql" value=" select * from Adi " />
<input type="submit"     name="Submit" value="Show Caluculated Report Results" class="inputSubmit">
</form>
</TD>
</TR>

<TR>


</TR>
</Table>




