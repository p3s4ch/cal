



<%

bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

thedatefield = "Arrival"
if filter_on="deposits" then thedatefield= "date" end if


if isDebug then
     Response.Write "  developed by steve  <br>"
     Response.Write "<br>including Main.Buttoms.asp <br>"
End If





%>

<h1>The Lunar (White) Telescope </h1>
<h2>Agent's and Operator's Cash Account - Management Tool </h2> <br>


<!--#include file="func_SQL_WhereBetweenMonth.asp"-->
<!--#include file="searchBetween.extract.asp"-->
<%

SQL_WhereBetween = " where [Date] " & getSQL_WhereBetweenMonth(iMonth,iYear)
addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="fees"

SQL_SELECT  =   " select 'OperatorAccountAdmin' "


SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden         , '' AgentAccNoOther_Ext , getDate() as AsOfEntryTime_Ext,0 Amount, '' Comment , 'select' Guest "
SQL_SELECT4EDIT=" select ID, EnteredBy enteredBy_hidden, Payer cash_account,    Date AsOfEntryTime_Ext ,Amount,Comment , Guest,  StaffTransfer "

SQL_SELECT_OPS_4ADD  =" select -1 ID, ' "& Admin_ID &"' enteredBy_hidden , '' Operator_Ext , getDate() as AsOfEntryTime_Ext,0 Amount, '' Comment , '' PUN_Ext "
SQL_SELECT_OPS_4EDIT =" select ID, EnteredBy enteredBy_hidden , Operator Operator_Ext , JobDate AsOfEntryTime_Ext, OperatorFee, Comment , Client_PUN  PUN_Ext "
'SQL_SELECT_OPS_4EDIT =" select ID, EnteredBy enteredBy_hidden , Operator Operator_Ext , JobDate AsOfEntryTime_Ext,  Comment , Client_PUN  PUN_Ext "


editSQL=SQL_SELECT4EDIT & " FROM fees where ID="

'Response.Write "<br/>We are editing some data  <br>"
'Response.End

SQL_dropDown_agents="select distinct  Admin_ID cash_account from dbo.UserRoles where [Role] = 'hasCashAccount' order by 1"
SQL_dropDown_ops=" select r.Admin_ID cash_account from (select distinct Admin_ID   from dbo.UserRoles  where Role = 'hasCashAccount' ) as t1 , dbo.UserRoles r " &_
	 " where t1.Admin_ID = r.Admin_ID and r.Role ='isContractor' "

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

if filter_on="Show_vCashAccounts" then
   myheader="All Cash Accounts - Admin "
   next_bttns="OperatorAccount.Buttons"
   SQL = "select * from dbo.vCashAccounts "

End If

if filter_on="AgentsAccount" then
   pm2 = request("pm2")
   myheader="Agents Account : " & pm2

   next_bttns="OperatorAccountAdmin.Buttons"
   SQL = "select  ID id2edit ,ID Ptx, Date , Comment , Amount from fees where payer= '"& pm2 &"' order by Date desc"

   SQL_TOT = "select isNull( sum(isNull(Amount,0)),0) as tot from dbo.fees where Payer= '"& pm2 & "'"
      Set RS_TOT = SQLCN.Execute(SQL_TOT)
      tot = RS_TOT("tot")
      tot = FormatNumber(tot, 2)
   myheader = myheader & " &nbsp; &nbsp; &pound " & tot
End If


if filter_on="OperatorsAccount" then
   pm2 = request("pm2")
   myheader="Operators Account : " & pm2
   editSQL=SQL_SELECT_OPS_4EDIT & " FROM dbo.OperatorAccount where ID="
   tableName="OperatorAccount"

   next_bttns="OperatorAccountAdmin.Buttons"
   SQL = "select  ID ptx , Operator , JobDate , OperatorFee , Comment, Client_PUN PUN, EnteredBy from dbo.OperatorAccount where Operator= '"& pm2 &"' order by JobDate desc"

   SQL_TOT = "select isNull( sum(isNull(OperatorFee,0)),0) as tot from dbo.OperatorAccount where Operator= '"& pm2 & "'"
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
   tot = FormatNumber(tot, 2)
   myheader = myheader & " &nbsp; &nbsp; &pound " & tot
End If


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
<input type="hidden" name="procName"   value="add_fees" />
<input type="hidden" name="myheader"   value="Add New Transaction" />
<input type="hidden"      name="bttns"  value="OperatorAccountAdmin.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage"  value="GSAdd5.update.asp"  /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add Agent Payment" class="inputSubmit">
</form>

</TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="CashAccounts.Buttons" />
<input type="hidden" name="filter_on" value="Show_vCashAccounts" /> <%=spacing%>
<input type="submit" name="Submit" value="Show All Agents Balances" class="inputSubmit">
</form>

</TD>


<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorAccountAdmin.Buttons" />
<%
fieldName="pm2"
SQL_dropDownParam = SQL_dropDown_agents
%>
Agent Account: <!--#include file="dropDownGS5_SQL_dropDown.asp"-->
<input type="hidden" name="filter_on" value="AgentsAccount" /> <%=spacing%>
<input type="submit" name="Submit" value="Go" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="OperatorAccount" />
<input type="hidden" name="procName"   value="add_OperatorAccount" />
<input type="hidden" name="myheader"   value="Add New Transaction" />
<input type="hidden"      name="bttns"  value="OperatorAccountAdmin.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT_OPS_4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd6_wo_UID.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add Operator Fee or Pay-Out" class="inputSubmit">
</form>
</TD>

<TD>
&nbsp;
</TD>

<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="OperatorAccountAdmin.Buttons" />
<%
SQL_dropDownParam = SQL_dropDown_ops
%>
Operator Account: <!--#include file="dropDownGS5_SQL_dropDown.asp"-->
<input type="hidden" name="filter_on" value="OperatorsAccount" /> <%=spacing%>
<input type="submit" name="Submit" value="Go" class="inputSubmit">
</form>
</TD>

</TR>
</Table>
