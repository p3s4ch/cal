
<h2 ALIGN=CENTER>Price Change Alerts </h2>


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
tableName="PriceAlert"

SQL_SELECT  =   " select ID id2edit, Updated, UpdateBy [By], Hostel  ,Arrival , [To] Departure, RoomType ,NewPrice ,Moved   "
SQL_SELECT4ADD= " select -1 ID , '"& Admin_ID &"' P_ayerHidden, '' Hostel  ,''  ArrivalEntryTime_Ext , '' Departure_GS5date_Ext,  '' RoomType ,0 NewPrice ,'' Moved  ,'' Reason "
SQL_SELECT4EDIT=" select ID , '"& Admin_ID &"' P_ayerHidden, Hostel  ,  Arrival ArrivalEntryTime_Ext , [To] Departure_GS5date_Ext, RoomType , NewPrice , Moved  , [Details] Reason"

editSQL=SQL_SELECT4EDIT & " FROM PriceAlert where ID="

If NOT (SearchFor = "") Then
     SQL_SearchFor = " where (" &_
	" [Moved] LIKE '%" & SearchFor & "%' or " &_
	" [Details] LIKE '%" & SearchFor & "%' or " &_
	" [NewPrice] LIKE '%" & SearchFor & "%' or " &_
	" ID LIKE '%" & SearchFor & "%'  " &_
	")"

     SQL_Where = SQL_SearchFor & SQL_WhereBetween
End If

SQL_Where = SQL_SearchFor

SQL = SQL_SELECT & " from dbo.PriceAlert  " &  SQL_Where  & " order by Arrival desc"
mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "

if isDebug then
   Response.Write "<br>" & SQL & "<br>"
end if

%>



<Table>
<TR>
<TD>

<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="PriceAlert" />
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden"      name="bttns"  value="PriceAlert.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TR>
</Table>


<form  Method="GET">
   <br>
     <input type="hidden"   name="tableName"   value="PriceAlert" />
     <input type="hidden"   name="bttns"  value="PriceAlert.Buttons" />
     <!--#include file="searchFormX.asp"-->
</form>

