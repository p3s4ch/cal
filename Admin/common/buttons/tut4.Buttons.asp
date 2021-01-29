
<%
uid =request("uid")
bttns = request("bttns")
filter_on = request("filter_on")

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Tutorial 2"
   SQL = "select ''"
 End If


if filter_on = "x" then
   myheader="filter_on=x"
   mysql = "select top 3 ID id2edit , Operator  from Customers "
 End If


if filter_on = "HOW_2_EDIT" then
   myheader="using     id2edit"
   editPgLink="GSEdit5.asp"
   tableName="Customers"

   SQL             = "select top 3 ID id2edit , FirstName  from Customers "

   Response.Write  "A Buttons - filter results in ONE target visible SQL , tv sql, that is displayed at the bottom of the report"
   Response.Write  "e.g. " &  SQL

   Response.Write  "To make the records Editable , just inlcude 3 things the ID column renamed as id2edit , an  editPgLink  and tableName"

   'part one of editSQL
   SQL_SELECT_4EDIT=" select ID id2edit , FirstName "
   'final editSQL
   editSQL=SQL_SELECT_4EDIT & " FROM dbo.Customers where ID="
 End If

%>

<p>
<h2>Tutorial 4: </h2><br>







