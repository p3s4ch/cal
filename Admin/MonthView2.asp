<!--#include file="util.asp"-->
<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/checkTZ.asp" -->
<!--#include file="func_MiniMonth.asp"-->

<LINK href="mystyle.css" rel="stylesheet" type="text/css">

<%

iMonth= request("iMonth")
iYear = request("iYear")
operator = trim(request("operator"))
category=""
excl_category = "'available'"

if category <> "" then
   category = "'"& category &"'"
else
   category= "null"
end if

dim d
d = Date()
dim iMonth
dim iWeekDayOfTheFirstOfTheMonth
if iYear = "" then
  iYear = Year(d)
end if
if iMonth= "" then iMonth = Month(d) end if
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
firstOfTheMonth =  "1 " & sMonth &" "& iYear
iWeekDayOfTheFirstOfTheMonth = weekday(firstOfTheMonth,1)
firstOfMonth =  "1 " & sMonth &" "& iYear
endOfMonth =    "30 " & sMonth &" "& iYear 'To do

%>

<html>
<head>
<title>MonthView</title>

<script language="Javascript">

 function viewEvent (sID,sDay,sMonth,sYear,sTime,sTitle,sDetail){
    addEventWindow = window.open('EventView.asp?AddID='+sID +'&sDay='+sDay +'&sMonth='+sMonth+'&sYear='+sYear+'&sTime='+sTime+'&sTitle='+sTitle+'&sDetail='+sDetail,'EventView','width=350, height=100, menubar=yes, toolbar=yes ,scrollbars=1, resizable=yes',true)
    }
</script>
</head>
<body bgColor=Oldlace>

<!--#include file="FiveMonthPreview.asp"-->
v2
<table border="0" cellpadding="0" cellspacing="0" align="center" width="90%">
<tr>

<td width="25%">
<A class=c_move href="WeekView.asp?uid=<%=uid%>&operator=<%=operator%>&iMonth=<%=iMonth%>&iYear=<%=iYear%>" >Week</a>&nbsp;&nbsp;&nbsp;&nbsp;
<A class=c_moveSelected href="MonthView.asp?uid=<%=uid%>&operator=<%=operator%>" >Month</a>&nbsp;&nbsp;&nbsp;&nbsp;
</td>

</tr>

<tr>


<tr>
<td width="25%">
<A class=c_move href="MonthView.asp?uid=<%=uid%>&operator=<%=operator%>&iMonth=<%=iLastMonth%>&iYear=<%=iPrevYear%>" >&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td width="50%" class="c_title" align="middle"> <%=sMonth%> &nbsp;&nbsp;<%=iYear%></td>
<td width="25%" align="right">
<A class=c_move href="MonthView.asp?uid=<%=uid%>&operator=<%=operator%>&iMonth=<%=iNextMonth%>&iYear=<%=iNextYear%>" >&gt;</a></td>
</tr>
<tr>
<td height="100%" colspan="3">


<!--#include file="GetMonth.asp"-->

</td>
</tr>


<tr>
<td valign="top"><br></td>
<td align="middle" class="footer"></td>
<td align="right" valign="top"><A href="main.asp?uid=<%=uid%>"> Admin</a></td>
</tr>

</table>

</body>
</html>



