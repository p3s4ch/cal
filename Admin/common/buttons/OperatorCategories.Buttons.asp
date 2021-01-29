





<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = trim(request("SearchFor"))


if filter_on = "" OR filter_on="INITIAL" then
   myheader="Reservation Reports "
   SQL = "select 'please select one of the Reports above'"
End If

if filter_on="Categories" then
   SQL_Where5 = " where Operator =  '" & SearchFor &"' "
   SQL = "select * from OperatorCategory " & SQL_Where5
End If

if filter_on="Operators" then
   SQL_Where5 = " where Category =  '" & SearchFor &"' "
   SQL = "select * from OperatorCategory " & SQL_Where5
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
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="hidden"      name="mysql" value="exec dbo.addOperatorCategory  " />
<input type="hidden"      name="pm0" value="-1" />
Operator
<%
fieldName="pm1"
sql_column = "Name"
sql_table = "dbo.Operators"
%>
<!--#include file="dropDownG5.asp"-->

Add Service or Category :
<%
fieldName="pm2"
sql_column = "Category"
sql_table = "dbo.Categories"
%>
<!--#include file="dropDownG5.asp"-->

In Team
<%
fieldName="pm3"
sql_column = "Team"
sql_table = "dbo.vTeam"
%>
<!--#include file="dropDownG5.asp"-->
<input type="hidden" name="NoOfPMs" value="4" /> <%=spacing%>
<input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>
</TD>
</TR>



<TR>
<TD>
<form action="GSE5.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="hidden"      name="mysql" value="exec dbo.removeOperatorCategory  " />
<input type="hidden"      name="pm0" value="-1" />
Operator
<%
fieldName="pm1"
sql_column = "Name"
sql_table = "dbo.Operators"
%>
<!--#include file="dropDownG5.asp"-->
<%
fieldName="SearchFor"
sql_column = "Category"
sql_table = "dbo.Categories"
%>
Remove Service or Category : <!--#include file="dropDownG5.asp"-->
<input type="hidden"                name="pm3" value=<%=uid%> />
<input type="hidden" name="NoOfPMs" value="3" /> <%=spacing%>
<input type="submit" name="Submit" value="Remove" class="inputSubmit">
</form>
</TD>
</TR>




<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="hidden" name="filter_on" value="Categories" /> <%=spacing%>
View All Categories offered by Operator :
<%

fieldName="SearchFor"
sql_column = "Name"
sql_table = "dbo.Operators"

%>
<!--#include file="dropDownG5.asp"-->
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="hidden" name="filter_on" value="Operators" /> <%=spacing%>

<%
fieldName="SearchFor"
sql_column = "Category"
sql_table = "dbo.Categories"



%>
View All Operators with this Category  : <!--#include file="dropDownG5.asp"-->
 &nbsp;
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>
</TR>













</TR>
</Table>




