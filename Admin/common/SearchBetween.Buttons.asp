
<h2 ALIGN=CENTER>Search Between in GS5Table </h2>


<%

bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

thedatefield = "d1"
if filter_on="deposits" then thedatefield= "date" end if
%>

<!--#include file="func_SQL_WhereBetweenMonth.asp"-->
<!--#include file="searchBetween.extract.asp"-->
<%

SQL_WhereBetween = " where  " & sqlWhereBetween

addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="PriceAlert"

SQL_SELECT  =   " select ID id2edit, Updated, UpdateBy [By], Hostel  ,Arrival , [To] Departure, RoomType ,NewPrice ,Moved   "
SQL_SELECT4ADD= " select -1 ID , '"& Admin_ID &"' P_ayerHidden, '' Hostel  ,''  ArrivalEntryTime_Ext , '' Departure_GS5date_Ext,  '' RoomType ,0 NewPrice ,'' Moved  ,'' Reason "
SQL_SELECT4EDIT=" select ID , '"& Admin_ID &"' P_ayerHidden, Hostel  ,  Arrival ArrivalEntryTime_Ext , [To] Departure_GS5date_Ext, RoomType , NewPrice , Moved  , [Details] Reason"

editSQL=SQL_SELECT4EDIT & " FROM PriceAlert where ID="
mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "


IF filter_on="flights" THEN
   SQL_Where = SQL_WhereBetween

   If NOT (SearchFor = "") Then
        SQL_SearchFor = " and (" &_
   		" FromAirport LIKE '%" & SearchFor & "%' or " &_
   		" ToAirport LIKE '%" & SearchFor & "%'  " &_
   		")"
        SQL_Where = SQL_Where  & SQL_SearchFor
    End If

   myheader="Flights Travel Hotels"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="dbo.flights"
   actionPage="GSAdd5.update.asp"

   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, 'NEW' [Pickle Name], '' [Category Of Service - Cats_Ext], '' Title , '' Contact ,'' [Surname or Organization] , ''Address , '' Postcode,  '' Email ,  '' Phone  , '' Mobile , 1 ReqInv,  '' [Heard About] ,'' OfficeUse"
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"

   editSQL= "select 2 ID"

   SQL = "select ID id2edit, c1 Ref, d1 Departure  ,c2 FromAirport ,c3 ToAirport, d2 Arrival  from dbo.GS5Table "& SQL_Where &" order by d1 desc"

End IF

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
<input type="hidden"      name="bttns"  value="SearchBetween.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="flights" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TR>
</Table>


<form  Method="GET">
   <br>
     <input type="hidden"   name="tableName"   value="PriceAlert" />
     <input type="hidden"   name="bttns"  value="SearchBetween.Buttons" />
     <input type="hidden" name="filter_on" value="flights" /> <%=spacing%>

     <!--#include file="searchFormX.asp"-->
</form>

