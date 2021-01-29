



<%
Response.Write "  developed by steve  <br>"

bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

thedatefield = "Arrival"
if filter_on="deposits" then thedatefield= "date" end if

if isAdmin then
     Response.Write "<h1> isAdmin</h1> <br>"
End If

%>

<!--#include file="func_SQL_WhereBetweenMonth.asp"-->
<!--#include file="searchBetween.extract.asp"-->
<%

SQL_WhereBetween = " where [Date] " & getSQL_WhereBetweenMonth(iMonth,iYear)
addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="fees"

SQL_SELECT  =   " select ID id2edit,ID  ptx, Date , Comment , Amount, Guest , StaffTransfer "
 

SQL_SELECT4ADD= " select -1 ID, '"& Admin_ID &"' P_ayerHidden ,'select' EnteredBy, getDate() as AsOfEntryTime_Ext,0 Amount, '' Comment , 'select' Guest, '' StaffTransfer "
SQL_SELECT4EDIT=" select ID, Payer P_ayerHidden, EnteredBy EnteredBy, Date AsOfEntryTime_Ext ,Amount,Comment , Guest,  StaffTransfer "
editSQL=SQL_SELECT4EDIT & " FROM fees where ID="

'SQL_SearchFor = " where Payer = '" & Admin_ID & "'"
SQL_SearchFor = " where EnteredBy = '" & Admin_ID & "'"
If NOT (SearchFor = "") Then
     SQL_SearchFor = SQL_SearchFor & " AND (" &_
  " [Date] LIKE '%" & SearchFor & "%' or " &_
  " [Guest] LIKE '%" & SearchFor & "%' or " &_
  " [Comment] LIKE '%" & SearchFor & "%' or " &_
  " [Amount] LIKE '%" & SearchFor & "%' or " &_
  " ID LIKE '%" & SearchFor & "%'  " &_
  ")"

     SQL_Where = SQL_SearchFor & SQL_WhereBetween
End If

SQL_Where = SQL_SearchFor

SQL = SQL_SELECT & " from dbo.fees  " &  SQL_Where  & " order by [date] desc , Updated desc"
mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "

if isDebug then
   Response.Write "<br>" & SQL & "<br>"
end if

SQL_TOT = "select isNull( sum(isNull(amount,0)),0) as tot from dbo.fees  " &  SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_TOT)
tot = RS_TOT("tot")
tot = FormatNumber(tot, 2)
Response.Write "<br> <b>Account: " & Admin_ID & " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Total &pound; " & tot  & "</b><br><br>"

%>



<Table>
<TR>
<TD>

<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="Fees" />
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden"      name="bttns"  value="OperatorAccount.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TR>
</Table>


<form  Method="GET">
   <br>
     <input type="hidden"   name="tableName"   value="fees" />
     <input type="hidden"   name="bttns"  value="OperatorAccount.Buttons" />
     <!--#include file="searchFormX.asp"-->
</form>

