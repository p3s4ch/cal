



<!--#include file="util.asp"-->



<%

iDay=5
iMonth=1
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"


iDay=6
iMonth=1
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"

iDay=7
iMonth=1
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"

iDay=8
iMonth=1
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"


iDay=5
iMonth=3
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"

iDay=6
iMonth=3
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"


iDay=7
iMonth=3
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"


iDay=8
iMonth=3
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"


iDay=6
iMonth=4
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"

iDay=7
iMonth=4
iYear=2013

lx = LastWeek(iDay,iMonth,iYear)
Response.Write "LastWeek for " & iDay &  "  " & MonthName(iMonth) & " " & iYear & "is = " & lx & "<br>"

%>