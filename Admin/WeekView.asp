<!--#include file="common/util.asp"-->
<!--#include file="common/fn_NextWeek.asp"-->
<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/checkTZ.asp" -->
<!--#include file="func_MiniMonth.asp"-->

<LINK href="mystyle.css" rel="stylesheet" type="text/css">

<!--#include file="add_edit_event.asp" -->


<%



if isDebug then Response.Write " <br><font color=red>Debug is ON </font>" end if
operator = request("operator")
'Response.Write "<br><font size=6 color = black>" & operator &"</font>"

if isAdmin then Response.Write "<div class=lightPrint>Admin<br><br></div>" end if

'Response.Write "isGuest="& isGuest


dim d
d = Date()

if iYear = "" then  iYear = Year(d) end if
if iMonth= "" then iMonth = Month(d) end if
if iDay= "" then iDay = Day(d) end if
if isun = "" then iSun = Month(d) end if


lx = LastWeek(iDay,iMonth,iYear)
nx = NextWeek(iDay,iMonth,iYear)
sn = GetPrevSunday(iDay,iMonth,iYear)
nextSun = DateAdd("d",7,sn)

if isDebug then
		Response.Write "Request is: <br>"
		Response.Write " iDay="& iDay
		Response.Write " iMonth="& iMonth
		Response.Write " iYear="& iYear
		Response.Write "<br>thus the sunday sn =" & sn & " = " & day(sn) & " " & Monthname(month(sn)) & " " & year(sn)
		Response.Write "<br>last week  = "  & day(lx) & " " & Monthname(month(lx)) & " " & year(lx)
end if


endDt =  DateAdd("d",-1,nextSun)
endDt = DateAdd("d",-1,nextSun)

StartDay = Day(sn)
StartMonth = Month(sn)
StartYear = Year(sn)

StartMonthName = MonthName(StartMonth)
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
<title>WeekView</title>

</head>
<body bgColor=Oldlace>



<!--#include file="FiveMonthPreview.asp"-->




<table border="0" cellpadding="0" cellspacing="0" align="center" width="90%">
<tr>
<td width="25%">
<A class=c_moveSelected href="WeekView.asp?uid=<%=uid%>&operator=<%=operator%>" >Week</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_move href="MonthView.asp?uid=<%=uid%>&operator=<%=operator%>&iMonth=<%=iMonth%>&iYear=<%=iYear%>" >Month</a>&nbsp;&nbsp;&nbsp;&nbsp;
</td>
</tr>

<tr>
<td width="25%">&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp;</td>

<tr>
<td width="25%">
<A class=c_move href="WeekView.asp?uid=<%=uid%>&operator=<%=operator%>&iDay=<%=Day(lx)%>&iMonth=<%=Month(lx)%>&iYear=<%=Year(lx)%>" >&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;

</td>
<td width="50%" class="c_title" align="middle"><%=StartDay%>&nbsp;<%=StartMonthName%>-&nbsp;<%=EndDay%>&nbsp;&nbsp;<%=tmpStMnth%> &nbsp;&nbsp;<%=iYear%></td>
<td width="25%" align="right">

<A class=c_move href="WeekView.asp?uid=<%=uid%>&operator=<%=operator%>&iDay=<%=Day(nextSun)%>&iMonth=<%=Month(nextSun)%>&iYear=<%=Year(nextSun)%>" >&gt;</a>&nbsp;&nbsp;&nbsp;&nbsp;

</tr>
<tr>
<td height="100%" colspan="3">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%"><tr>
<td bgcolor="#c0c0c0">

<table border="2" cellpadding="0" cellspacing="1" width="100%" height="100%">
<tr>
<td height="1%" class="c_dayofweek">Sunday</td>
<td class="c_dayofweek">Monday</td>
<td class="c_dayofweek">Tuesday</td>
<td class="c_dayofweek">Wednesday</td>
<td class="c_dayofweek">Thursday</td>
<td class="c_dayofweek">Friday</td>
<td class="c_dayofweek">Saturday</td>
</tr>

<%
Response.Write "<TR>"

today = Date()

WHILE sn <= endDt


		dayPlan = "<table>"
		morning =   Day(sn) & " "&  MonthName(Month(sn)) & " "&  Year(sn)

		ViewDt = CDate(sn)

		DayOfMonth =Day(sn)
		iDay=Day(sn)
		iMonth=Month(sn)
		iYear=Year(sn)

        sql = "Get1DayEvents '" & morning &"','" & operator &"'"

        'if isDebug then Response.Write " <br><font color=red> " & sql &" </font>" end if

 		Set RS = SQLCN.Execute(sql)

        linktoPage = "eventView"

		WHILE     Not RS.EOF
             op  = RS("Operator")
             cat = RS("Category")
             color="blue"

             bgcolor = "00ffff"

			  if   cat  = "unavailable" then
				   color="black"
				   bgcolor = ""
              end if


             linktoPage = "events_add"

            canAlsoDeleteLink = ""
            if   cat  = "available" AND  isGuest <> 1 AND  isCustomer <> 1 then
                  'Response.Write "found del<br>"
                  canAlsoDeleteLink = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=?uid="&uid&"&deleteID="& RS("ID")& "&iDay=" & iDay & "&iMonth="& Month(sn) & "&iYear="& iYear & "&Operator=" & RS("Operator")  & " ><font color=red><b> X </b></a>"
            end if


             if   cat  <> "available" then
              	 linktoPage = "eventView"
             	 color="black"
             	 bgcolor = "yellow"
             end if




             linktoPage ="<a href="& linktoPage &".asp?uid="&uid&"&AddID="&RS("ID")&"&iDay=" & iDay & "&iMonth="& Month(sn) & "&iYear="& iYear &">" &_
	         "<font color="&color&">" & RS("tm") & "&nbsp;"&  RS("Operator")  & "&nbsp;"  &  cat  & "&nbsp;"&  RS("Surname")  & " </font></a>"


            'Response.Write 	"isCustomer" & isCustomer
			'Response.Write 	"this CustomerID" & CustomerID
			'Response.Write 	"event CustomerID" & RS("CustomerID")


				if (cat <> "available") AND (isGuest OR (isCustomer = 1  AND CustomerID <> RS("CustomerID")))  then
				  linktoPage = "Taken"
				  bgcolor = "pink"
				end if





             TDevent = "<td BGCOLOR="& bgcolor &">" & linktoPage & canAlsoDeleteLink  & "</td>"

             RS.MoveNext

	         dayPlan = dayPlan & "<tr>" & TDevent & "</tr>"

		WEND
		dayPlan = dayPlan & "</table>"

       operator=Trim(operator)

		if isAdmin or isStaff then
						dayLink="<div class='daynumber'><a href=events_add.asp?uid="&uid&"&operator="&operator&"&iDay="& DayOfMonth &"&iMonth="&iMonth&"&iYear="&iYear& "><font color=black>+ Add</font></a> &nbsp;&nbsp;&nbsp; "& DayOfMonth &"</div>"
				else
				        dayLink="<div class='daynumber'> &nbsp;&nbsp;&nbsp;"& DayOfMonth & "</div>"
		end if


		'iDay = Day(sn)

		if today = ViewDt then
		        	Response.Write "<td class='c_today' > " & dayLink &" <br> &nbsp; &nbsp; &nbsp; &nbsp; today " &  dayPlan & "</td>"
		        else
					Response.Write "<td class='c_weekend'>" & dayLink &" <br> " &  dayPlan & "</td>"
        end if



		'Response.Write "<td class='c_weekend'> " & dayLink &" <br> " & dayPlan & "</td>"
		sn = DateAdd("d",1,sn)
wend
Response.Write "</TR>"
%>
</table></td></tr>


</table></td></tr>

<tr><td valign="top" class="c_title" ><br>

If you cannot find a suitable time or there are no available slots showing please email us your requests.

</td>
<td align="middle" class="footer">
</td>
<td align="right" valign="top">
<!--#include file="common/homeLink.asp" -->
</td></tr>

</table>
</body>
</html>



