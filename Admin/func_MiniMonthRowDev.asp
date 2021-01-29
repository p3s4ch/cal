

<%
function GetMiniMonthAsRow(iMth,iYr,op)


  iMonth = iMth
  iYear =iYr

  if  iYear ="" then
       iYear="2014"
  end if


  m=iMth
  y=iYr
   if m > 12 then
   m = m - 12
   y = y + 1
   end if
  if m < 1 then
   m = M + 12
   y = y - 1
   end if

  uid=request("uid")

  'sMonth is a global variable which does get changed !!!!!
  sMonthTmp = MonthName(m)

  firstOfTheMonth =  "1 " & sMonthTmp &" "& y
  endOfMonth =    "30 " & sMonthTmp &" "& y 'To do

  iWkdayOfTheFirstOfTheMonth = weekday(firstOfTheMonth)

  htm="<br> <table class=class2 border=1 width=100% height=100% ><tr><td > &nbsp; </td></tr>    <tr>  <td>  <b>" & sMonthTmp & "</b>"

  innerTable="<table class=class7 border=1 cellpadding=1 cellspacing=1 width=100% >  <tr><td> "
  DayOfMonth = 1
  totDays = getDaysInMonth(m,y)
  iWkday = iWkdayOfTheFirstOfTheMonth

  htmTopRow = "<TR>"
  htmMidRow = "<TR>"
  htmRow3 = "<TR>"

  htm5 = "<TR><td>"
  today = Date()


  WHILE DayOfMonth <= totDays

        iDay = DayOfMonth
		ViewDt = CDate(x)

        htmTopRow = htmTopRow & "<td>" & iDay & "</td>"

		morning =  DayOfMonth & " " &  MonthName(iMonth) & " "&  iYear
        dayPlan = "<br>"

        sql_step1 = "select top 1 * from cEvents where '"& morning &"' between dbo.truncDate(StartTime) and DateAdd(d,-1,EndTime) and Operator = '" & op & "'"



        Set RS = Server.CreateObject("ADODB.Recordset")
		RS.Open sql_step1, SQLCN, 1, 3
        If RS.RecordCount > 0 Then
            dayPlan = RS("Office")
        end if




        anc="<a href=WeekView.asp?uid="&uid&"&operator="&op&"&iDay="& DayOfMonth & "&iMonth="& m & "&iYear="& y &">"

        htmRow3 = htmRow3 & "<td>" & anc & "<b>" & dayPlan & "</b></a></td>"

        dtStr  = DayOfMonth & " " & sMonthTmp & " " & y
        ViewDt = CDate(dtStr)

    	cc="c_weekday1"
    	if today=ViewDt then cc="c_weekday1" end if



            if iWkday = 1 then
	     		        htmMidRow = htmMidRow & "<td>S</td>"
	   		end if
	     	if iWkday = 2 then
	     		        htmMidRow = htmMidRow & "<td>M</td>"
	   		end if
	   		if iWkday = 3 then
	   		            htmMidRow = htmMidRow & "<td>T</td>"
	   		end if
	   		if iWkday = 4 then
	   		            htmMidRow = htmMidRow & "<td>W</td>"
	   		end if
	   		if iWkday = 5 then
	   		            htmMidRow = htmMidRow & "<td>Th</td>"
	   		end if
	        if iWkday = 6 then
	                     htmMidRow = htmMidRow & "<td>F</td>"
	   		end if
	   		if iWkday = 7 then
	   		            htmMidRow = htmMidRow & "<td>S</td>"
	   		end if
	   		if iWkday = 8 then
	     			iWkday = 1
	     			htmMidRow = htmMidRow & "<td>S</td>"
	        end if





  		iWkday = iWkday +1

  		DayOfMonth =DayOfMonth+1
	wend

  htmTopRow = htmTopRow & "</TR>"
  htmMidRow = htmMidRow & "</TR>"
  htmRow3 = htmRow3 & "</TR>"

  innerTable  = innerTable & htmTopRow & htmMidRow & htmRow3 &  "  </td></tr></TABLE>"

  'innerTable  = innerTable & "<TR>"  & htm5 & "</TR></TABLE>"

  'Response.Write htmTopRow
  'Response.Write "<br>"
  'Response.Write htmMidRow

  GetMiniMonthAsRow = htm & innerTable & "</td></tr></table>"
end function

%>
