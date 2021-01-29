<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")
spacing = "&nbsp; &nbsp; &nbsp; "

if filter_on="UNSET" then
   myheader="<h2> Laws for working your in your roles - if anything is not  clear , please ask in the right group chats <h2> "
   tableName="LAWS"
   SQL = "select distinct l.ID id2edit , a.Audience , l.title  from Laws l, dbo.LawsAudience a , UserRoles ur " &_
   "where l.Audience COLLATE DATABASE_DEFAULT = a.Audience COLLATE DATABASE_DEFAULT " &_
   "      and a.[ForRoles] COLLATE DATABASE_DEFAULT in  " &_
   " (Select distinct [Role] from UserRoles where Admin_ID  = '" & Admin_ID &"') "

  SQL_SELECT4EDIT="select ID, Audience,Title,Law,EnteredBy,Comment Details"

  addEditPgLink="GSEdit5.asp"
  editPgLink="GSEdit5.asp"
  tableName="Laws"
  editSQL= SQL_SELECT4EDIT & " FROM dbo.Laws where ID="

   SQL_SELECT4ADD="select -1 ID, ' "& Admin_ID &"' enteredBy_hidden "
End If
%>

