

<%
function GetMiniMonth(iMth,iYr,op)
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
  htm="<br> <table class=class2 border=1 width=100% height=100% ><tr><td > "&_
  " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=MonthView.asp?uid="&uid&"&operator="&op&"&iMonth="& m &"&iYear="& y &">" &_
   sMonthTmp & " "& y & "<a></td></tr> <tr><td> "

 innerTable="<table class=class3 border=2 cellpadding=0 cellspacing=1 width=100% > "&_
     "<tr bgcolor=#c1c2bb > <td>S</td><td>M</td><td>T</td><td>W</td><td>T</td>" &_
     "<td>F</td> <td>S</td></tr>"
  DayOfMonth = 1
  totDays = getDaysInMonth(m,y)
  iWkday = iWkdayOfTheFirstOfTheMonth

  htm4="<TR>"
  if iWkday = 2 then htm4 = htm4 & "<td></td>" end if
  if iWkday = 3 then htm4 = htm4 &  "<td></td><td></td>" end if
  if iWkday = 4 then htm4 = htm4 &  "<td></td><td></td><td></td>" end if
  if iWkday = 5 then htm4 = htm4 &  "<td></td><td></td><td></td><td></td>" end if
  if iWkday = 6 then htm4 = htm4 &  "<td></td><td></td><td></td><td></td><td></td>" end if
  if iWkday = 7 then htm4 = htm4 &  "<td></td><td></td><td></td><td></td><td></td><td></td>" end if

  htm5 = ""
  today = Date()


  WHILE DayOfMonth <= totDays
        anc="<a href=WeekView.asp?uid="&uid&"&operator="&op&"&iDay="& DayOfMonth & "&iMonth="& m & "&iYear="& y &">"

        dtStr  = DayOfMonth & " " & sMonthTmp & " " & y
        ViewDt = CDate(dtStr)

    	cc="c_weekday1"
    	if today=ViewDt then cc="c_weekday1" end if
  		if iWkday < 8 then
  		    htm5= htm5 & "<td class="& cc & ">  "& anc & DayOfMonth & "</a> "& cats &"</td>"
  		end if
  		if iWkday = 8 then
  			iWkday = 1 'today is sunday good voch
  			htm5= htm5 & "</TR><TR><td class="& cc & "> "& anc  & DayOfMonth & "</a>"& cats &"</td>"
  		end if
  		iWkday = iWkday +1 'Day of week



  		DayOfMonth =DayOfMonth+1
	wend


  innerTable  = innerTable & htm4 & htm5 & "</TR></TABLE>"
  GetMiniMonth = htm & innerTable & "</td></tr></table>"
end function

%>
