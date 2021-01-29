



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
tableName="fees"

'SQL_SELECT  =   " select ID id2edit,ID ptx, Date , Comment , Amount, Guest , StaffTransfer "
SQL_SELECT  =   " select ID ptx, Date , Comment , Amount, Guest , StaffTransfer "
SQL_SELECT4ADD= " select -1 ID, '"& Admin_ID &"' P_ayerHidden, getDate() as AsOfEntryTime_Ext,0 Amount, '' Comment , 'select' Guest, '' StaffTransfer "
SQL_SELECT4EDIT=" select ID, Payer P_ayerHidden, Date AsOfEntryTime_Ext ,Amount,Comment , Guest,  StaffTransfer "
editSQL=SQL_SELECT4EDIT & " FROM fees where ID="

SQL_SearchFor = " where Payer = '" & Admin_ID & "'"
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


if filter_on = "OperatorAccount" then
    myheader="Operators Account : " &  Admin_ID
    SQL = "select ID ptx, JobDate , OperatorFee Fee, Comment, Client_PUN PUN  from  dbo.OperatorAccount  where Operator ='"&  Admin_ID & "' order by JobDate desc "
    SQL_TOT = "select isNull( sum(isNull(OperatorFee,0)),0) as tot from dbo.OperatorAccount where Operator= '"& Admin_ID & "'"
    Set RS_TOT = SQLCN.Execute(SQL_TOT)
    tot = RS_TOT("tot")
    tot = FormatNumber(tot, 2)
    myheader = myheader & " &nbsp; &nbsp; &pound " & tot
End If



if filter_on = "AgentAccount" then
    myheader="Agent Account : " &  Admin_ID
    SQL = "select Date , Amount , Comment  from  dbo.fees  where Payer ='"&  Admin_ID &"'"
    SQL_TOT = "select isNull( sum(isNull(Amount,0)),0) as tot from dbo.fees where Payer= '"& Admin_ID & "'"
    Set RS_TOT = SQLCN.Execute(SQL_TOT)
    tot = RS_TOT("tot")
    tot = FormatNumber(tot, 2)
    myheader = myheader & " &nbsp; &nbsp; &pound " & tot
End If

'SQL_Where = SQL_SearchFor
'SQL = SQL_SELECT & " from dbo.fees  " &  SQL_Where  & " order by [date] desc , Updated desc"


mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "



if isDebug then
   Response.Write "<br>" & SQL & "<br>"
end if

%>

