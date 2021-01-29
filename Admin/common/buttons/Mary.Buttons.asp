

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


IF filter_on="example3" THEN

   myheader="Mary.Buttons filter_on  " & filter_on
   SQL = "select 'Hi Mary example Three' "


End IF

spacing = "&nbsp; &nbsp; &nbsp; "

IF filter_on="example4" THEN

   myheader="Mary.Buttons filter_on  " & filter_on
   SQL = "select 'Hi Mary example Four' "


End IF
spacing = "&nbsp; &nbsp; &nbsp; "

IF filter_on="example5" THEN

   myheader="Mary.Buttons filter_on  " & filter_on
   SQL = "select 'Hi Mary example Five' "


End IF
spacing = "&nbsp; &nbsp; &nbsp; "
%>

