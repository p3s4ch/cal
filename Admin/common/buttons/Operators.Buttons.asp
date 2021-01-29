

<%


bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")

SQL = "select 'please select on of the reports'"

if filter_on = "" OR filter_on="Initial" then
End If

If NOT (inc_status = "") Then
    SQL_incl =" AND Status= '" & inc_status & "'"
End If

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" ID LIKE ('%" & SearchFor & "%') or " &_
	" [Name] LIKE ('%" & SearchFor & "%') or " &_
	" Telephone LIKE ('%" & SearchFor & "%') or " &_
	" Services LIKE ('%" & SearchFor & "%') or " &_
	" Mobile LIKE ('%" & SearchFor & "%') or " &_
	" email LIKE ('%" & SearchFor & "%') or " &_
	" Status LIKE ('%" & SearchFor & "%') )"
End If



SQL_Where = SQL_WhereBetween & SQL_Excl_cat & SQL_SearchFor & SQL_incl

Response.Write SQL_SearchFor

SQL_SELECT = " select ID id2edit , [Name] , Services ,  Telephone , Mobile , Status, Comment  "
SQL_SELECT4EDIT = " select   [Name] ,    Services ,      Telephone , Mobile ,      email, Status,        Comment , Team  "
SQL_SELECT4ADD = " select '' [Name] , '' Services ,  '' Telephone , '' Mobile , '' email, '' Status, '' Comment , '' Team   "
SQL4ADD        = " select '' [Name] , '' Services ,  '' Telephone , '' Mobile , '' email, '' Status, '' Comment , '' Team   "

if filter_on = "SHOW" then
   myheader="Operators"
   SQL = SQL_SELECT & " from Operators where name not like '%Room%' and isActive = 0  " & SQL_SearchFor
End If


if filter_on = "ALL_APPLICANTS" then
   myheader="Operators"
   SQL = SQL_SELECT & " from Operators where name not like '%Room%' and isActive = 0 "
End If

myheader="OPERATORS"
tableName="Operators"

editSQL=SQL_SELECT4EDIT & " FROM Operators where ID= "

addEditPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
editSQL=SQL_SELECT4EDIT & " FROM Operators where ID= "
editSQL2saveAsNew =SQL_SELECT4EDIT


if filter_on="ALL" OR filter_on="INITIAL"  or filter_on = "" then
   orderby = "ID_Desc"
   myheader="<i>ALL OPERATORS </i>"
   SQL = SQL_SELECT & " from Operators "
End If

spacing = "&nbsp; &nbsp; &nbsp; "

%>


<Table border="1">

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Operators.Buttons" />
<input type="hidden"      name="filter_on" value="ALL_APPLICANTS" />
<input type="submit"     name="Submit" value="Show All Applicants" class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="submit"     name="Submit" value="OperatorCategories and Services" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden"   name="uid" value=<%=uid%> />
<input type="hidden"   name="tableName" value="Operators" />
<input type="hidden"      name="bttns" value="Operators.Buttons" />
<input type="hidden"      name="mysql" value="<%=SQL4ADD%>" />
<input type="submit" name="Submit" value="Add New Operator" class="inputSubmit"><%=spacing%>
</form>

</TD>

<TD>
<form action="AvailSlots.asp" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorCategories.Buttons" />
<input type="submit"     name="Submit" value="Create some available slots" class="inputSubmit">
</form>
</TD>

<TR>
</TR>



</Table>


<DIV ALIGN=center>
<form action="?" name="frmUser" Method="GET">
	<input type="hidden" name="filter_on" value="SHOW" />

	Status:   <input type="checkbox" name="ck1" value="Applied" <%=incl_blank_isCked%>             />  Applied
			  <input type="checkbox" name="ck1" value="Emailed" <%=incl_cancelled_isCked%> />  Emailed

    <input type="hidden"   name="tableName"   value="Operators" />
    <input type="hidden"   name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>

	<!--#include file="searchGSBetweenDates_NoForm.asp"-->
	<div align=center>
	   <font face="Verdana, arial" size="1"  color="48576C"><b>Search for</b></font>
	   <input type="text" size="80" name="SearchFor" class="inputBox" value="<%=SearchFor%>" >
    </div>

	<input type="submit" value="Show" class="inputSubmit">
</form>
</DIV>