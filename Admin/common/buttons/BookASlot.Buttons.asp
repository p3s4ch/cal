

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


thedatefield = "Arrival"

if filter_on="deposits" then thedatefield= "date" end if

%>
<!--#include file="searchBetween.extract.asp"-->
<%

myheader="Main Menu"

addEditPgLink=""
printPgLink=""
editPgLink=""
editSQL=""
tableName=""


if filter_on = "" OR filter_on="INITIAL" then
    myheader="To book your slot please view one of the diaries below"
    SQL = "select * from dbo.getAllDiaries_GS5Tv2  ('" & uid & "' , '"& Admin_ID & "' , 'ALL')"
End If

if  filter_on="HourlyRooms" then
    myheader="To book your slot please view one of the diaries below"
    SQL = "select * from dbo.getAllDiariesROOM  ('" & uid & "' , '"& Admin_ID & "' , 'ALL')"
End If

if  filter_on="GST5Table" then
    myheader="Book a job in one of these diaries: "
    SQL = "select * from dbo.getAllDiaries_GS5T  ('" & uid & "' , '"& Admin_ID & "' , 'isJupiter')"
	
	SQL_SELECT4ADD= "select -1  ID, 'diary' TableN_hidden, '' c1 ,  'DiaryName' c2 , '' c3"
	button_sql =SQL_SELECT4ADD
    act= "GSAdd5.asp"

    
    addEditPgLink="GSEdit5.asp"
    printPgLink="GSEdit5.asp"
    editPgLink="GSEdit6.asp"
    actionPage="GSAdd5.update.asp"
    procName ="procGSc6d2"
    button_sql =SQL_SELECT4ADD
    act= "GSAdd5.asp"
  
   editSQL=        "select ID,t1,c1,c2,c3,'c4_0' c4_hidden, 'c5_0' c5_hidden, 'c6_0' c6_hidden " &_
                   ",d1 Departs_GS6datetime_Ext , d2 Arrives_GS6datetime_Ext ,'0' i1_hidden ,'0.0' f1_hidden FROM dbo.GS5Table where ID="

   
	
	
End If



spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>



<form action="<%=action%>"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"  value="<%=tableName%>" />
<input type="hidden" name="procName"   value="<%=procName%>" />
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden" name="hasDates"   value="NO" />
<input type="hidden" name="bttns"      value="<%=bttns%>" />
<input type="hidden" name="mysql"      value="<%=button_sql %>"          />
<input type="hidden" name="actionPage" value="<%=actionPage%>" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="ADD NEW" class="inputSubmit">
</form>

</TD>

</TR>


</Table>


