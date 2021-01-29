

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

thedatefield = "Arrival"
if filter_on="deposits" then thedatefield= "date" end if

if isAdmin then
     SearchWhere = request("SearchWhere")
     SearchFor = request("SearchFor")
     Response.Write "<h1> isAdmin</h1> <br>"
     ' Response.Write "<h1> "& Admin_ID & "`s payments </h1> <br>"
      SQL_SearchFor ="  "

Else
      Response.Write "Admin_ID = " & Admin_ID
      SQL_SearchFor ="  AND [Name] = '" & Admin_ID &"'"
End If

%>


<!--#include file="func_SQL_WhereBetweenMonth.asp"-->
<!--#include file="searchBetween.extract.asp"-->
<%
'iMonth=8
'iYear=2015
SQL_WhereBetween = " where [Date] " & getSQL_WhereBetweenMonth(iMonth,iYear)

addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="payments"


SQL_SELECT4ADD    = " select '' Payee , '' PaymentOn_GS5date_Ext,   0 Amount, '' Comment , '' PayMethod "
SQL_SELECT4EDIT   = " select Name , Date PaidOn_GS5date_Ext , Amount , Comment , PayMethod  "

editSQL=SQL_SELECT4EDIT & " FROM payment where ID="

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Timesheet"
   SQL = "select 'please select one of the Reports above'"
End If

if filter_on="Show_All" then

	SQL_Where = SQL_WhereBetween & SQL_SearchFor


    SQL = "select top 10 * from vTimesheet "

	SQL = "select * from vTimesheet " &  SQL_Where  & " order by [date] desc"
	Response.Write "<br> was SQL = " & SQL
	Response.Write "<br>"

	SQL = "select top 10 * from vTimesheet "

	SQL_TOT = "SELECT  IsNull (Sum(Total),0) Tot  FROM vTimesheet " &  SQL_Where

	'Set RS_TOT = SQLCN.Execute(SQL_TOT)
	'tots = RS_TOT("Tot")

	'if tots <> "" then
	  'Response.Write "<br><br> <b>Total &nbsp; &pound; " & FormatNumber(tots) & "</b><br>"
	'end if

   myheader="MyTimesheet"

End If





SQL_Where = SQL_WhereBetween & SQL_SearchFor
SQL = "SELECT  ID id2edit, Name , Date, Amount , Comment , PayMethod  FROM Payment" & SQL_Where

mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "


SQL_t= "SELECT IsNull(sum( IsNull(Amount,0)),0) as tot FROM Payment " & SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_t)
tot = 0
if NOT RS_TOT.EOF then tot= FormatNumber(RS_TOT("tot"), 2) end if
Response.Write "<br><b>Total Paid &nbsp;&pound;" & tot & "<b><br>"





%>



<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="vTimesheet" />
<input type="hidden"      name="bttns"  value="Timesheet.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TD>
</TR>




</Table>

<form action="?" Method="GET">
   <input type="hidden"   name="tableName"   value="vTimesheet" />
   <input type="hidden"   name="bttns"  value="Timesheet.Buttons" />
   <input type="hidden"   Name="Operator" Value="<%=Operator%>" />
   <input type="hidden"   name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
   <!--#include file="searchMonthForm.asp"-->



</form>

<h1>Timesheet : <%= Operator  %>  for <%= MonthName(iMonth)  %> , <%= iYear  %> </h1>


