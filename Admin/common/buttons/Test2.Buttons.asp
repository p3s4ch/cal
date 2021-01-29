<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


IF filter_on="Test2Button" THEN

   myheader="Test2.Buttons filter_on  " & filter_on
   SQL = "select 'Steve page for button 2' "


End IF

spacing = "&nbsp; &nbsp; &nbsp; "
IF filter_on="sExample1" THEN

   myheader="Test2.Buttons filter_on  " & filter_on
   SQL = "select 'Hi Steve example 2' "


End IF
spacing = "&nbsp; &nbsp; &nbsp; "
%>