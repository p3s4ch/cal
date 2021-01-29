

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")
AddID        = request("ID")

inc_status = request("ck1")

thedatefield = "Arrival"
if filter_on="deposits" then thedatefield= "date" end if

%>
<!--#include file="searchBetween.extract.asp"-->
<%

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

If NOT (inc_status = "") Then
    SQL_incl =" AND Status= '" & inc_status & "'"
End If

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" ID LIKE ('%" & SearchFor & "%') or " &_
	" Agency LIKE ('%" & SearchFor & "%') or " &_
	" Telephone LIKE ('%" & SearchFor & "%') or " &_
	" Contact LIKE ('%" & SearchFor & "%') or " &_
	" Mobile LIKE ('%" & SearchFor & "%') or " &_
	" email LIKE ('%" & SearchFor & "%') or " &_
	" Title LIKE ('%" & SearchFor & "%') or " &_
	" Client LIKE ('%" & SearchFor & "%') or " &_
	" Status LIKE ('%" & SearchFor & "%') )"

End If

SQL_Where = SQL_WhereBetween & SQL_Excl_cat & SQL_SearchFor & SQL_incl


SQL_SELECT        =" select * from dbo.Recruiters " & SQL_Where

SQL_SELECT_COLS   = " select '' [ID] ,	'' Agency, '' Telephone , '' Contact, '' Mobile, '' [email] ,'' Job_Tile ,'' [Client] ,	'' [Status] ,'' [FlexCommnt_Ext] , '' AppliedOn_GS5date_Ext ,'09:09' time24_hidden, '' URL_Ext , '"& Admin_ID &"' EntBy_hidden , '' JobBoard_Ext "
SQL_FROM          = " from dbo.vRvRecruiters "

SQL_SELECT4ADD    =  SQL_SELECT_COLS

SQL_SELECT_ALL =  "select top 40 ID id2New_Ext , ID id2edit_Ext, ID [#],  Board, Agency, Telephone , Contact, Mobile, Title , Status , Date from dbo.vRvRecruiters " & SQL_Where
SQL_SELECT4EDIT   =  " select Agency, Telephone , Contact, Mobile, email,Title,Client,Status,Comment FlexCommnt_Ext, Date AppliedOn_GS5date_Ext, Details URL_Ext , " &_
                     ", '" & Admin_ID & "' UpdatedBy_hidden, Board JobBoard_Ext, DATACONTROLID cntrlID_hidden From Recruiters " & " where ID = "

SQL_SELECT4EDIT   =  "select  Agency, Telephone , Contact, Mobile ,  email,Title,Client,Status,Comment FlexCommnt_Ext, Date AppliedOn_GS5date_Ext " &_
                     ",'" & Admin_ID & "' UpdatedBy_hidden, Details URL_Ext, Board, DATACONTROLID cntrlID_hidden "

SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

addEditPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
editSQL=SQL_SELECT4EDIT & " FROM Recruiters where ID= "
myheader="Jobs"

editSQL2saveAsNew =SQL_SELECT4EDIT
tableName="Recruiters_v4"
procName="add_Recruiters_v4"

if filter_on="ALL" OR filter_on="INITIAL"  or filter_on = "" then
   orderby = "ID_Desc"
   myheader="<i>ALL JOBS </i>"
   SQL = SQL_SELECT_ALL
End If

if filter_on="My_Work"  then
   orderby = "ID_Desc"
   myheader="<i>My Work - Successfully Identified Suitable Roles </i>"
   SQL = "select ID id2New_Ext , ID id2edit_Ext, ID [#],  Agency, Mobile, Title , Client , Status , Date, EnteredBy from Recruiters where " &_
   " EnteredBy='" & Admin_ID &"'"

End If

spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Recruiters.Buttons" />
<input type="hidden" name="filter_on" value="ALL" /> <%=spacing%>
<input type="submit" name="Submit" value="ALL" class="inputSubmit">
</form>

</TD>

<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="Recruiters" />
<input type="hidden" name="procName"   value="add_Recruiters_v3" />
<input type="hidden"      name="bttns"  value="Recruiters.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd6.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>
</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns"  value="Recruiters.Buttons" />
<input type="hidden" name="filter_on" value="My_Work" /> <%=spacing%>
<input type="submit" name="Submit" value="My Work" class="inputSubmit">
</form>
</TD>


</TR>


</Table>


<DIV ALIGN=center>
<form action="?" name="frmUser" Method="GET">
	<input type="hidden" name="filter_on" value="ALL" />

	Status:   <input type="checkbox" name="ck1" value="Applied" <%=incl_blank_isCked%>             />  Applied
			  <input type="checkbox" name="ck1" value="Emailed" <%=incl_cancelled_isCked%> />  Emailed
		      <input type="checkbox" name="incl_paid" value="incl_paid" <%=incl_paid_isCked%>           />  Phoned
	          <input type="checkbox" name="incl_unpaid" value="incl_unpaid" <%=incl_unpaid_isCked%>     />  Expired

    <input type="hidden"   name="tableName"   value="Payments" />

    <input type="hidden"   name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>

	<!--#include file="searchGSBetweenDates_NoForm.asp"-->
	<div align=center>
	   <font face="Verdana, arial" size="1"  color="48576C"><b>Search for</b></font>
	   <input type="text" size="80" name="SearchFor" class="inputBox" value="<%=SearchFor%>" >
    </div>

	<input type="submit" value="Show" class="inputSubmit">
</form>
</DIV>