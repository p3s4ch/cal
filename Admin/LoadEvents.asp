<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="util.asp"-->

<html>
<head>
<title>LoadEvents.asp</title>
</head>
<body>

<%
'Global Variables
Dim cEventsMap(31)
Dim cDayArray
Dim cDayArrayStr
Dim Rs

isDebug = Session("isDebug")

'x = Date()

'arr = LoadEventsDay ("'27 Apr 2007'")
'LoadEventsWeek 15,4,2007
'LoadEventsDay ("'15,4,2007'")


%>

</body>
</html>
<%

function LoadEventsDay (asofdate)
	'Response.Write "<br>LoadEventsDay:= " & asofdate
	Set Rs = SQLCN.Execute("Get1DayEvents "& asofdate)
	'Set Rs = SQLCN.Execute("Get1DayEvents '27 Apr 2007'")
	eventNum = 0
	if Rs.EOF then
	  cDayArrayStr = "-1"
	  else
	  cDayArrayStr = ""
	end if
	WHILE Not Rs.EOF
		dbcols=  ResultSet13cols(Rs)
		eventStr= dbcols & "^~"& dayCounter & "^~"& sMonth & "^~"& iYear
		cDayArrayStr=cDayArrayStr & eventStr &";"
		Rs.MoveNext
	wend 'end of day
	'Response.Write "cDayArrayStr= " & cDayArrayStr
	cDayArray=Split(cDayArrayStr,";")
	LoadEventsDay = cDayArray
end function





function test

	arr = GetSiteCustBySiteId (1)
	Response.Write "arr(0) ="& arr(0)
	Response.Write "arr(1) ="& arr(1)

	Response.Write "arr(2) ="& arr(2)
	Response.Write "arr(3) ="& arr(3)
	Response.Write "arr(4) ="& arr(4)

	Response.Write "arr(5) ="& arr(5)
	Response.Write "arr(6) ="& arr(6)
	Response.Write "arr(7) ="& arr(7)
	Response.Write "arr(8) ="& arr(8)
	Response.Write "arr(9) ="& arr(9)

	Response.Write "arr(10) ="& arr(10)
	Response.Write "<br> arr(11) ="& arr(11)
	Response.Write "arr(12) ="& arr(12)

end function
%>


<%
function LoadEventsMonth(iMonth,iYear)
	sMonth = MonthName(iMonth)
	iDaysInMonth = getDaysInMonth(iMonth,iYear) 'may be quicker that DataAdd
	iStartDay = 1
	while iStartDay < iDaysInMonth+1
		    asofdate = "'" & iStartDay &" "& sMonth &" "& iYear & "'"
		    arr = LoadEventsDay (asofdate)
		    cEventsMap(iStartDay)= LoadEventsDay (asofdate)
			iStartDay = iStartDay +1
	wend
end function

function GetEventById (id)
	Set Rs = SQLCN.Execute("GetEventById "& id)
	dbcols=  ResultSet13cols(Rs)
	GetEventById = Split(dbcols,"^~")
end function


function GetEventRsById (id)
	Set Rs = SQLCN.Execute("GetEventById "& id)
	GetEventById = Rs
end function

function GetSiteCustBySiteId (id)
	Set Rs = SQLCN.Execute("GetSiteCustBySiteId "& id)
	IF isDebug then Response.Write "<br> exec GetSiteCustBySiteId " &id &" </br>"
	if Rs.EOF then
	    Response.Write "<br> SiteId " &id &" has been deleted</br>"
        Response.End
    else
	dbcols=  ResultSet17cols(Rs)
	GetSiteCustBySiteId = Split(dbcols,"^~")
	end if
end function
%>


<%
function LoadEventsWeek(iStartDay,iMonth,iYear)
 	x= iStartDay &","& iMonth &","& iYear
 	'x= "1,4,2007"
 	'x ="27,4,2007"
 	'Response.Write "<br>x =" & x
 	startDt =  CDate(x)
	'Response.Write "<br>cdate  =" & startDt
	iEndDt = DateAdd("d",6,startDt)
	while startDt <= iEndDt
		y ="'"& Day(startDt) &" "& MonthName(Month(startDt)) &" " & Year(startDt) & "'"
		cEventsMap(Day(startDt)) = LoadEventsDay (y)
		startDt = DateAdd("d",1,startDt)
	wend
	LoadEventsWeek = cEventsMap
end function



%>

<%
function GetEventsByDate(ViewDt)
iDay = Day(ViewDt)
htmEvents=""
Dim anEvent

viewDay = Day(ViewDt)
viewMonth=Month(ViewDt)
viewYear=Year(ViewDt)

sViewDt = ViewDt & ""
sViewDay = viewDay & ""
sViewMonth = viewMonth & " "
sViewYear = viewYear & " "

cDayArray=cEventsMap(iDay)
'Response.Write "<br> Day "& iDay &" has " & UBound(cDayArray) & " events <br>"
evNum = 0
while  evNum <> UBound(cDayArray)
	   eventStr = cDayArray(evNum)


	   'Response.Write eventStr
	   anEvent = Split(eventStr,"^~")

	   'Response.Write "<br>Event     ID:" & anEvent(0)
       'Response.Write "<br>Event Starts:" & anEvent(1)
       'Response.Write "<br>Time        :" & anEvent(2)
       'Response.Write "<br>     EndTime:" & anEvent(3)
       'Response.Write "<br>Event Title:" & anEvent(4)
       'Response.Write "<br>Details     :" & anEvent(5)
	   'Response.Write "<br>color       :" & anEvent(6)
       'Response.Write "<br>AssShort    :" & anEvent(7)
       'Response.Write "<br>FontSize    :" & anEvent(8)
       'Response.Write "<br>Category    :" & anEvent(9)
       'Response.Write "<br>CatA        :" & anEvent(10)
       'Response.Write "<br>CatB        :" & anEvent(11)
       'Response.Write "<br>Time        :" & anEvent(12)

       sID = anEvent(0)
       sStart =anEvent(1)
       sTime = anEvent(2)
       sEnd = anEvent(3)
       sTitle = anEvent(4)
       sDetails= anEvent(5)
       sColor = anEvent(6)
       sAssShort = anEvent(7)
       sFontZ =anEvent(8)
       sCategory=anEvent(9)
       sCatA=anEvent(10)
       sCatB=anEvent(11)
	   siteID	= anEvent(12)
	   sDay=anEvent(13)
	   sMonth=anEvent(14)
       sYear=anEvent(15)

       spTitle = Replace(sTitle," ","$")
       spDetail = Replace(sDetails," ","$")
       'Response.Write ("spTitle =" & spTitle)
       'Response.Write "<br> these are the events of the  viewDay" & viewDay

       if (sTime = "mult") then 'multi day events are running events
       		'htmEvent="<div class='recur4' onMouseover=this.className='recurOver4' onMouseout=this.className='recur4' onClick=viewEvent(sID,sDay,sMonth,sYear,sTime,sTitle,sDetails) >" +sTitle + "</div>"
       		htmEvent="<div class='recur4' onMouseover=this.className='recurOver4' onMouseout=this.className='recur4' " &_
       		"onClick=viewEvent('"+sID+"','"+sDay+"','"+sMonth+"','"+sYear+"')>" +sTitle + "</div>"
       		'" onClick=viewEvent("+sID+","+ViewDt+",4)> " +sTitle + "</div>"
       		' "onClick=viewEvent("+sID+","+sDay+",'"+sMonth+"',"+sYear+",'"+sTime +"','"+spTitle+"','"+spDetail+"')> " +sTitle + "</div>"
       else 'one day
			htmEvent="<div class='EventTask' onMouseover=this.className='recurOver4' onMouseout=this.className='recur4' " &_
       		"onClick=viewEvent('"+sID+"','"+sDay+"','"+sMonth+"','"+sYear+"')>" +sTitle + "</div>"

       		'htmEvent="<div class='assedJob1' onMouseover=this.className='recurOver4' onMouseout=this.className='assedJob1' onClick=viewEvent() >" + sTime +" "+sTitle + "</div>"
       		'htmEvent="<div class='assedJob1' onMouseover=this.className='recurOver4' onMouseout=this.className='assedJob1' onClick=viewEvent(0,1,2,3)> " + sTime +" "+sTitle + "</div>"

       end if
     htmEvents=htmEvents+ htmEvent
     evNum=evNum+1
wend
GetEventsByDate=htmEvents
end function
%>





<%
function ResultSet13cols(Rs)
		'Response.Write "<br>Found Event " & Rs(0) & " for = "& asofdate
				  'ID        StartTime	      tm		   EndTime,	   Title,		Details,	  color,	    AssShort   fontSize   Category,	   CatA,	  CatB		SiteID
		dbcols=  Rs(0)& "^~"& Rs() & "^~"& Rs(2)& "^~"& Rs(3)& "^~"& Rs(4)& "^~" & Rs(5)& "^~"& Rs(6)& "^~"& Rs(7)&"^~"&Rs(8)&"^~"&Rs(9) &"^~"&Rs(10) &"^~"&Rs(11)&"^~"&Rs(12)
		ResultSet13cols = dbcols
end function

function ResultSet17cols(Rs)
		 dbcols=  Rs(0)& "^~"& Rs(1) & "^~"& Rs(2)& "^~"& Rs(3)& "^~"& Rs(4)& "^~" & Rs(5)& "^~"& Rs(6)& "^~"&_
		 Rs(7)&"^~"&Rs(8)&"^~"&Rs(9) &"^~"&Rs(10) &"^~"&Rs(11)&"^~"&Rs(12)&"^~"&Rs(13)&"^~"&Rs(14)&"^~"&Rs(15)
		 ResultSet17cols = dbcols
end function
%>





