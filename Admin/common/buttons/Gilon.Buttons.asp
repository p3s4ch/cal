





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


if filter_on = "Customers" then
   SearchFor   = request("SearchFor")
   myheader="Customers"
   SQL = "select ID id2edit , ID [#], FirstName , Surname,  Address ,Postcode, Email, Mobile, Comment ,ReqInv from Customers " &_
          "where FirstName like '%" &SearchFor& "%' or Surname like '%" &SearchFor& "%' "
   hasBasicSearch="YES"
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

<TD>
<form  action="?" name="frmUser" Method="POST" >
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="FixAccounts.Buttons" />
<input type="hidden"      name="filter_on" value="INITIAL" />
<input type="submit"      name="Submit" value="Fix Prep Accounts: HSBC ADI VAT HMRC" class="inputSubmit">
</form>
</TD>



<TD>
<form action="ChadUtils.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="submit"     name="Submit" value="Chad Utils" class="inputSubmit">
</form>
</TD>



<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Dashboard.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Dashboard: Logs , Latest Activity, Money </b></font></a></td>


<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GilDev.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Gilon's DEV: Blanks Templates and Pickle - SQL </b></font></a></td>


<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;Gilon's Jobs</b></font></a></td>



</TR>

<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Gilon.Buttons" />
<input type="hidden"      name="filter_on" value="Customers" />
<input type="submit"     name="Submit" value="Customers" class="inputSubmit">
</form>
</TD>



<TD>

<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="http://79.171.34.90/eComm/pretakeOff.php"><font face="Verdana" size="1"><b>&nbsp;eComm</b></font></a></td>


</TD>





</TR>




</Table>




<%
if hasBasicSearch="YES" then

%>
  <form  Method="GET">
  <input type="hidden"      name="bttns" value="Gilon.Buttons" />
  <input type="hidden"      name="filter_on" value="Customers" />
   <br>
     <!--#include file="searchForm.asp"-->
</form>

<%
End If
%>