

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

if filter_on = "" OR filter_on="INITIAL" then



   myheader="<h2> AccessControl determines which Roles can use which tools </h2> "
   tableName="AccessControl"


   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit6.asp"

   actionPage="GSAdd5.update.asp"
   procName ="add_AccessControl"

   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"

   SQL = "select * from dbo.vAccessControl"
   SQL_SELECT4ADD="select -1 ID, ' "& Admin_ID &"' enteredBy_hidden ,'' UserRole, '' ControlledResource, '.Buttons' ButtonsPage,   'INITIAL' filter_on"
   SQL_SELECT4EDIT=" select ID, '"& Admin_ID & "' UpdatedBy_hidden , UserRole, ControlledResource, ButtonsPage, filter_on  "
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL=SQL_SELECT4EDIT & " FROM dbo.AccessControl where ID="
End If
spacing = "&nbsp; &nbsp; &nbsp; "

%>


<table>
<tr>
<TD>


<form action="GSAdd5.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value=<%=tableName%> />
<input type="hidden" name="procName"   value=<%=procName%> />
<input type="hidden" name="paramX"   value="123"/>
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden"      name="bttns"  value="SearchBetween.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd6_wo_UID.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="INITIAL" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>
</TD>
<tr>
</table>

