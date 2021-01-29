

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


IF filter_on="marytest2" THEN

   myheader="mary2.Buttons filter_on  " & filter_on
   SQL = "select 'This is a mary2.Buttons testing page' "


End IF

spacing = "&nbsp; &nbsp; &nbsp; "

%>

