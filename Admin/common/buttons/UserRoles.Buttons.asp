





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

SQL_SELECT4ADD    = " select '' username , '' password "
SQL_SELECT4EDIT   = " select Admin_Id , Admin_Pass "

editSQL=SQL_SELECT4EDIT & " FROM users where ID="
mysql=SQL_SELECT4EDIT & " FROM users where ID="

addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="users"

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Reservation Reports "
   SQL = "select 'please select one of the Reports above'"
End If

if filter_on="AllStaff" then
   SQL = "select * from usersByrole ('isStaff')"
End If

if filter_on="usersByrole" then
   SQL_Where5 = " where Admin_ID like '%" & SearchFor &"%' or Surname like '%" & SearchFor &"%'"
   SQL = "select * from usersByrole ('" & role &"') " & SQL_Where5
End If


if filter_on="UserByCustomerID" then
   SQL_Where5 = " where CustomerID =  '" & SearchFor &"' "
   SQL = "select * from vPreferences " & SQL_Where5
End If




if filter_on="RoleByUser" then
   SQL_Where5 = " where Admin_ID = '" & SearchFor &"'"
   SQL = "select * from userRoles " & SQL_Where5
End If


if filter_on="Show_Tools" then
   SQL = "select ControlledResource Tool , UserRole [Role] from AccessControl order by ControlledResource "
End If

%>




<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<br>
<Table border="1">
<TR>

<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.addUser  " />
<input type="hidden"                name="pm0" value="-1" />
Username:<input type="text"         name="pm1" value="" size="8" maxlength="255" />
Password:<input type="text"         name="pm2" value="123" size="8" maxlength="255" />
<input type="hidden" name="filter" value="dbo.addUser" /> <%=spacing%>
<input type="hidden" name="NoOfPMs" value="3" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New User" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.addUserRole  " />
<input type="hidden"                name="pm0" value="-1" />
User:<input type="text"             name="pm1" value="" size="8" maxlength="255" />
New Role:<input type="text"         name="pm2" value="123" size="8" maxlength="255" />
<input type="hidden" name="filter"  value="dbo.addUser" /> <%=spacing%>
<input type="hidden"                name="pm3" value=<%=uid%> />
<input type="hidden" name="NoOfPMs" value="4" /> <%=spacing%>
<input type="submit" name="Submit" value="Add Role" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.delUserRole  " />
<input type="hidden"                name="pm0" value="-1" />
User:<input type="text"             name="pm1" value="" size="8" maxlength="255" />
Remove Role:<input type="text"         name="pm2" value="123" size="8" maxlength="255" />
<input type="hidden" name="filter"  value="dbo.addUser" /> <%=spacing%>
<input type="hidden"                name="pm3" value=<%=uid%> />
<input type="hidden" name="NoOfPMs" value="4" /> <%=spacing%>
<input type="submit" name="Submit" value="Remove Role" class="inputSubmit">
</form>
</TD>
</TR>


<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="UserRoles.Buttons" />
<input type="hidden"      name="mysql" value="exec dbo.addUserRole  " />
<input type="hidden"                name="pm0" value="-1" />
User:<input type="text"             name="pm1" value="" size="8" maxlength="255" />
<%
fieldName="pm2"
%>
Select from Existing Role: <!--#include file="dropDownUserRole.asp"-->
<input type="hidden"                name="pm3" value=<%=uid%> />
<input type="hidden" name="NoOfPMs" value="4" /> <%=spacing%>
<input type="submit" name="Submit" value="Add Role" class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="POST"><%=spacing%><%=spacing%>
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="<%=bttns%>" />
<input type="hidden"      name="filter_on" value="Show_Tools" />
<input type="submit" name="Submit" value="Show Tools" class="inputSubmit">
</form>
</TD>
</TR>



<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="UserRoles.Buttons" />
<input type="hidden"      name="mysql" value="exec dbo.addUserTeams  " />
<input type="hidden"                name="pm0" value="-1" />
User:<input type="text"             name="pm1" value="" size="8" maxlength="255" />
<%
fieldName="TeamDiary"
fieldThis="pm2"
SQL_DropDown ="select distinct Team dropDown from OpTeams"
%>
<!--#include file="thisOrOther.asp"-->
<input type="hidden"                name="pm3" value=<%=uid%> />
<input type="hidden" name="NoOfPMs" value="4" /> <%=spacing%>
<input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>
</TD>
</TR>




<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.UsersRoleClone  " />
<input type="hidden" name="NoOfPMs" value="3" />
Clone From: <input type="text"                name="pm0" value="-1" />
Clone To:   <input type="text"         name="pm1" value="" size="8" maxlength="255" />
<input type="hidden"         name="pm2" value=<%=uid%>    size="8" maxlength="255" />
<input type="hidden" name="filter" value="dbo.addUser" /> <%=spacing%>
<input type="submit" name="Submit" value="UsersRoleClone" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="UserRoles.Buttons" />
<input type="hidden"      name="filter_on" value="usersByrole" />
<%
fieldName="pm2"
%>
View All Users where Role : <!--#include file="dropDownUserRole.asp"-->
SearchFor <input type="text"        name="SearchFor"    value="" />  &nbsp;
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>
</TR>




<TR>

<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="UserRoles.Buttons" />
<input type="hidden"      name="filter_on" value="RoleByUser" />
<input type="hidden"      name="mysql" value="select top 5 * from Users" />
Show All Roles for user <input type="text"        name="SearchFor"    value="" />  &nbsp;
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>

<TR>


<TR>

<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="UserRoles.Buttons" />
<input type="hidden"      name="filter_on" value="UserByCustomerID" />
Show All Users associated with Customer ID <input type="text"        name="SearchFor"  value="" />  &nbsp;
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>

<TR>



<TD>
<form action="GSE5.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.killUser  " />
<input type="hidden" name="NoOfPMs" value="2" />
Kill User: <input type="text"                name="pm0" value="" />
<input type="hidden"                         name="pm1" value=<%=uid%>    size="8" maxlength="255" />
<input type="hidden" name="filter" value="dbo.killUser" /> <%=spacing%>
<input type="submit" name="Submit" value="kill" class="inputSubmit">
</form>
</TD>
</TR>

<TR>




</TR>
</Table>




