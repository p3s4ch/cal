

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


IF filter_on="Test1 Button" THEN

   myheader="Test1.Buttons filter_on  " & filter_on
   SQL = "select 'This is a testing page' "


End IF

spacing = "&nbsp; &nbsp; &nbsp; "

%>

