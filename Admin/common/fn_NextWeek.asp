


<%
function NextWeek(iDay,iMonth,iYear)
	i7NextDay = iDay + 7
	i7NextMonth = iMonth
	i7NextYear = iYear
	daysInMonth = getDaysInMonth(iMonth,iYear)
	if i7NextDay > daysInMonth then
			i7NextMonth = i7NextMonth + 1
			i7NextDay = i7NextDay - daysInMonth
	    if i7NextMonth = 13 then
			i7NextMonth = 1
			i7NextYear = i7NextYear +1
	    end if
	end if
	Dim d
	x =  i7NextDay & "," & MonthName(i7NextMonth) & "," & i7NextYear
	if IsDate(x) then
		d = CDate(x)
		NextWeek = d
	end if
end function
%>