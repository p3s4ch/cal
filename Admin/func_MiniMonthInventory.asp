

<%
function GetMiniMonthInventory(iMth,iYr,op)

  iMonth = iMth
  iYear =iYr
  if  iYear ="" then
       iYear="2014"
  end if

  m=iMth
  y=iYr


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



  htmHeaderRow = "<TR><td colspan=" & totDays + 1 &"> <font color=Green > <b>" & op & " </b> </font> </td> "
  htmTopRow =    "<TR bgcolor=#0099CC ><Th>&nbsp</Th>"
  htmMidRow =    "<TR><TD>&nbsp</TD>"
  htmRow2 =      "<TR><TD>Total</TD>"
  htmRow3 =      "<TR><TD>Sold </TD>"
  htmRow4 =      "<TR><TD>Avail::... </TD>"
  htm5 =         "<TR><td>"
  today = Date()

  mycolor = "green"


  WHILE DayOfMonth <= totDays
       anc="<a href=ReservationsRooms.asp?uid="& uid &"&filter=f_RoomsSoldBreakdown&FromDay="& DayOfMonth &"&FromMonth="& iMth &"&FromYr="& iYr &"&roomType="& op &"&myheader=Sales+by+Room+Type >"

        iDay = DayOfMonth
		ViewDt = CDate(x)

        htmTopRow = htmTopRow & "<th>" & iDay & "</th>"

		 morning =  DayOfMonth & " " &  MonthName(iMonth) & " "&  iYear
         sql_step1 = " select [dbo].f_RoomsSold ('" & morning &"', '"& op & "', 0 ) sold , [dbo].[f_RoomsTotal] ('" & morning &"', '"& op & "', 0 ) total "
         Set RS = SQLCN.Execute(sql_step1)
		 total = RS("total")
		 sold = RS("Sold")
		 avail = total-sold



         if avail = 0 then mybgcolor = "#82FA58" else mybgcolor = "white" end if
         if avail < 0 then mycolor = "red" else mycolor = "green" end if
         if sold = 0 then  mybgcolor = "#D8D8D8" end if

		 htmRow2 = htmRow2 & "<td><font color=green ><i>" & total & "</i></font></td>"
         htmRow3 = htmRow3 & "<td><font color=green ><b>" & sold & "</b></font></td>"
         htmRow4 = htmRow4 & "<td bgcolor=" & mybgcolor & ">" & anc &" <font color= "& mycolor &" ><b>" & avail & "</b></font> </a>   </td>"

        dayPlan = DayOfMonth

        dtStr  = DayOfMonth & " " & sMonthTmp & " " & y
        ViewDt = CDate(dtStr)

    	cc="c_weekday1"
    	if today=ViewDt then cc="c_weekday1" end if
            if iWkday = 1 then htmMidRow = htmMidRow & "<td>Sun</td>"  end if
	     	if iWkday = 2 then htmMidRow = htmMidRow & "<td>Mon</td>"  end if
	   		if iWkday = 3 then htmMidRow = htmMidRow & "<td>Tue</td>"  end if
	   		if iWkday = 4 then htmMidRow = htmMidRow & "<td>Wed</td>"  end if
	   		if iWkday = 5 then htmMidRow = htmMidRow & "<td>Thu</td>"  end if
	        if iWkday = 6 then htmMidRow = htmMidRow & "<td>Fri</td>"  end if
	   		if iWkday = 7 then htmMidRow = htmMidRow & "<td>Sat</td>"  end if
	   		if iWkday = 8 then
	     			iWkday = 1
	     			htmMidRow = htmMidRow & "<td>Sun</td>"
	        end if
  		iWkday = iWkday +1
  		DayOfMonth =DayOfMonth+1
	wend


  htmHeaderRow = htmHeaderRow & "</TR>"
  htmTopRow = htmTopRow & "</TR>"
  htmMidRow = htmMidRow & "</TR>"
  htmRow3 = htmRow3 & "</TR>"

  innerTable  = innerTable  & htmHeaderRow &  htmTopRow & htmMidRow & htmRow2 & htmRow3 & htmRow4 & "  </td></tr></TABLE>"


  GetMiniMonthInventory = innerTable
end function








%>
