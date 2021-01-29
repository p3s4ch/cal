





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")

Response.Write "<h1>Just Fixing HSBC </h1>"



if filter_on = "" OR filter_on="INITIAL" then
   myheader="Fix HSBC this checks the bank statements are all loaded"
   SQL = "select 'select the top buttons'"
End If

if filter_on="LATEST" then
   myheader="Last HSBC imports thanks to Ronit "
   SQL = "select 'hsbc_bib' [table] , max(date) [max date]   from hsbc_bib union " &_
			" select 'hsbc_bib_java' [table] , max(date) [max date]   from hsbc_bib_java union " &_
			" select 'hsbc_buscard_java' [table] , max(date) [max date]   from hsbc_buscard_java union" &_
			" select 'hsbc_buscard' [table] , max(date) [max date]   from hsbc_buscard "
End If

if filter_on="LATEST.proc" then
   myheader="Last HSBC imports thanks to Ronit "
   SQL = "dbo.HSBCLatestImports "
End If

if filter_on="Balances" then
   myheader="Balance "
   SQL = "select max(date) [Date] , sum(amount) Balance  from HSBC_BIB"
End If



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
<input type="hidden"      name="bttns" value="FixHSBC.Buttons" />
<input type="hidden"      name="filter_on" value="LATEST" />
<input type="submit"     name="Submit" value="Show latest imports" class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="FixHSBC.Buttons" />
<input type="hidden"      name="filter_on" value="LATEST.proc" />
<input type="submit"     name="Submit" value="Show latest imports with proc" class="inputSubmit">
</form>
</TD>



<td><form action="GenericSQLExecutor.asp"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="dbo.ImportJava2HSBC" >
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="[dbo].[ImportJava2HSBC]" class="inputSubmit">
</form></td>



<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="FixHSBC.Buttons" />
<input type="hidden"      name="filter_on" value="Balances" />
<input type="submit"     name="Submit" value="Balances" class="inputSubmit">
</form>
</TD>




<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;Gilon's Jobs</b></font></a></td>



</TR>

<TR>


</TR>
</Table>




