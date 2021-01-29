

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


IF filter_on="instructions2" THEN

   myheader="instructions2.Buttons filter_on  " & filter_on
   SQL = "select 'welcome1' "


End IF

spacing = "&nbsp; &nbsp; &nbsp; "

IF filter_on="instructions3" THEN

   myheader="instructions2.Buttons filter_on  " & filter_on
   SQL = "select 'welcom2' "


End IF
spacing = "&nbsp; &nbsp; &nbsp; "


%>

