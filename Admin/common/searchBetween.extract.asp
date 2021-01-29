



<%




iDay = request("iDay")
iMonth = request("iMonth")
iYear  = request("iYear")


if iMonth = "" then
   dim d
   d = Date()
   iDay = Day (d)
   iMonth = Month(d)
   iYear =Year (d)
end if

FromDay = iDay
FromMonth = iMonth
FromYr = iYear

betweenFrom  =   iDay & " " & MonthName(iMonth) & " " & iYear


if Not IsDate(betweenFrom) then
  Response.Write betweenFrom & " is Not a date"
  Response.End
end if


daysInMonth = getDaysInMonth(iMonth,iYear)
betweenTo  =   daysInMonth & " " & MonthName(iMonth) & " " & iYear

ToDay = daysInMonth
ToMonth = iMonth
ToYr = iYear + 1


function getDaysInMonth(strMonth,strYear)
dim strDays
    Select Case cint(strMonth)
        Case 1,3,5,7,8,10,12:
			strDays = 31
        Case 4,6,9,11:
		strDays = 30
        Case 2:
		if  ((cint(strYear) mod 4 = 0  and  _
                 cint(strYear) mod 100 <> 0)  _
                 or ( cint(strYear) mod 400 = 0) ) then
		  strDays = 29
		else
		  strDays = 28
		end if
    End Select
    getDaysInMonth = strDays
end function



%>








