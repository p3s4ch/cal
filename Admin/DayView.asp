<!--#include file="util.asp"-->
<!--#include file="Loggedin.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->


in Admin

<%
iDay=request("iDay")
iMonth= request("iMonth")
iYear = request("iYear")

dim d
d = Date()
dim iMonth

if iYear = "" then iYear = Year(d) end if
if iMonth= "" then iMonth = Month(d) end if
if iDay= "" then iDay = Day(d) end if
if isun = ""then iSun = Month(d) end if



x= iDay &","& iMonth &","& iYear
todayDt=  CDate(x)

yesterday= DateAdd("d",-1,todayDt)
lstWeek = DateAdd("d",-7,todayDt)
lstMonth = DateAdd("m",-1,todayDt)
lstYr = DateAdd("y",-365,todayDt)
tomorrow= DateAdd("d",+1,todayDt)
nxtWeek = DateAdd("d",+7,todayDt)
nxtMonth= DateAdd("m",+1,todayDt)
nxtYear= DateAdd("d",+365,todayDt)

StartDay = Day(todayDt)
StartMonth = Month(todayDt)
StartYear = Year(todayDt)

StartMonthName = MonthName(StartMonth)


WeekDayStr = WeekDayName(Weekday(todayDt,Monday),false,Monday)



EndDay = Day(endDt)
EndMonth = Month(endDt)
EndYear = Year(endDt)

if iMonth = 1 then
	iLastMonth = 12
	iPrevYear = iPrevYear -1
end if
if iMonth = 12 then
	iNextMonth = 1
	iNextYear = iYear+1
end if


iPrevYear = iYear 'prev year may not be last year its only used if you click prev <
iLastYear = iYear-1 'always last year
iNextYear = iYear 'next year may not be future year its only used if you click next >
iFutureYear = iYear+1 'always a future year

iLastMonth = iMonth-1
iNextMonth = iMonth+1
if iMonth = 1 then
iLastMonth = 12
iPrevYear = iPrevYear -1
end if
if iMonth = 12 then
iNextMonth = 1
iNextYear = iYear+1
end if

sMonth = MonthName(iMonth)
tmpStMnth ="" 'used once in title may wish to be empty
if StartMonth <> sMonth then tmpStMnth = MonthName(EndMonth)


firstOfTheMonth =  "1 " & sMonth &" "& iYear
'iWeekDayOfTheFirstOfTheMonth = weekday(firstOfTheMonth)
firstOfMonth =  "1 " & sMonth &" "& iYear
endOfMonth =    "30 " & sMonth &" "& iYear 'To do
%>

<html>
<head>
<title>DayView</title>
<script language="Javascript">

	function viewEvent (sID,sDay,sMonth,sYear)
	{
	addEventWindow = window.open('EventView.asp?AddID='+sID+'&sDay='+sDay+'&sMonth='+sMonth+'&sYear='+sYear,'EventView','width=350, height=500, menubar=yes, toolbar=yes ,scrollbars=1, resizable=yes')

	}
    function viewEvent2 (sID,sDay,sMonth,sYear,sTime,sTitle,sDetail){
       addEventWindow = window.open('EventView.asp?AddID='+sID +'&sDay='+sDay +'&sMonth='+sMonth+'&sYear='+sYear+'&sTime='+sTime+'&sTitle='+sTitle+'&sDetail='+sDetail,'EventView','width=350, height=500, menubar=yes, toolbar=yes ,scrollbars=1, resizable=yes')
   }
</script>
</head>
<body bgColor=Oldlace>
<table border="0" cellpadding="0" cellspacing="0" align="center" width="750">
<tr>
<td width="25%">


<A class=c_moveSelected href="DayView.asp"> Day</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="WeekView.asp" > Week</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="MonthView.asp"> Month</a>&nbsp;&nbsp;&nbsp;&nbsp;
</td>
</tr>

<tr>
<td width="25%">&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp;</td>

</tr>

<tr>

<td width="25%">

<A class=c_move href="DayView.asp?iDay=<%=Day(yesterday)%>&iMonth=<%=Month(yesterday)%>&iYear=<%=Year(yesterday)%>" >&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(lstWeek)%>&iMonth=<%=Month(lstWeek)%>&iYear=<%=Year(lstWeek)%>" >&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(lstMonth)%>&iMonth=<%=Month(lstMonth)%>&iYear=<%=Year(lstMonth)%>" >&lt;&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(lstYr)%>&iMonth=<%=Month(lstYr)%>&iYear=<%=Year(lstYr)%>" >&lt;&lt;&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td width="50%" class="c_title" align="middle"><%=StartDay%>&nbsp;<%=StartMonthName%> &nbsp;&nbsp;<%=iYear%>
</td>

<td width="25%" align="right">

<A class=c_move href="DayView.asp?iDay=<%=Day(nxtYear)%>&iMonth=<%=Month(nxtYear)%>&iYear=<%=Year(nxtYear)%>" >&gt;&gt;&gt;&gt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(nxtMonth)%>&iMonth=<%=Month(nxtMonth)%>&iYear=<%=Year(nxtMonth)%>" >&gt;&gt;&gt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(nxtWeek)%>&iMonth=<%=Month(nxtWeek)%>&iYear=<%=Year(nxtWeek)%>" >&gt;&gt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="DayView.asp?iDay=<%=Day(tomorrow)%>&iMonth=<%=Month(tomorrow)%>&iYear=<%=Year(tomorrow)%>" >&gt;</a>&nbsp;&nbsp;&nbsp;&nbsp;

</td>

</tr>

<tr>
<td height="100%" colspan="3">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
<tr>
<td bgcolor="#c0c0c0">
<table border="2" cellpadding="0" cellspacing="1" width="100%" height="100%">

<tr>
<td height="1%" class="c_dayofweek"><%=WeekDayStr%></td>
</tr>

<%

dayPlan = "<table>"

Set RS = SQLCN.Execute("select Customers.Surname,cEvents.ID, DATEPART(hh,StartTime) as StartHr,DATEPART(minute,StartTime) as StartMin,DATEPART(mi,StartTime) as StartAm, Operator,Category, SitePostCode from cEvents left join Customers on cEvents.CustomerID = Customers.ID")

WHILE     Not RS.EOF





          dayPlan = dayPlan & "  <tr >  " &_
        "<td> <a href=eventView.asp?AddID="&RS("ID")&"&sDay=" & StartDay & "&sMonth="& StartMonthName &"&sYear="& iYear &">"  &_
                            RS("StartHr")  &  ":" & RS("StartMin")    &  " &nbsp; "   &  RS("Operator")   &  " &nbsp; "  &  RS("Category")  &  "&nbsp; -> "   &_
                             RS("Surname")  &      " &nbsp;  "  &   RS("SitePostCode")  & _
                           " </a></td> </tr>"

          RS.MoveNext
WEND
dayPlan = dayPlan & "</table>"




Response.Write "<TR>"
Response.Write "<td class='c_weekend'>  <div class=daynumber>"& iDay &" </div> "
Response.Write  (dayPlan & "</td>")
Response.Write "</TR>"
%>



</table>
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td valign="top"><br></td>
<td align="middle" class="footer"></td>
<td align="right" valign="top"><A href="Admin/main.asp"> Admin</a></td>
</tr>

</table>

</body>
</html>



