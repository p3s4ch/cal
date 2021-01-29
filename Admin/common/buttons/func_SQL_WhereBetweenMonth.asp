<%
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


function getSQL_WhereBetweenMonth(iMonth,iYear)
    dim d
    d = Date()
    if iMonth = "" then iMonth=Month(d)  End If
    if iYear  = "" then iYear=Year(d) End If

    DaysInMonth = getDaysInMonth(iMonth,iYear)
    sMonth = MonthName(iMonth)

    betweenFrom= "1 " & sMonth & " " & iYear
    betweenTo  = DaysInMonth& " " & sMonth & " "& iYear

    if betweenFrom="" then betweenFrom="1 Jan 2006" end if
    if betweenTo="" then   betweenTo="31 Dec 2009" end if

    if Not IsDate(betweenFrom) then
    Response.Write betweenFrom & " is Not a date"
    Response.End
    end if
    if Not IsDate(betweenTo) then
    Response.Write betweenTo & " is Not a date"
    Response.End
    end if

    SQL_WhereBetween = " BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    'return
    getSQL_WhereBetweenMonth = SQL_WhereBetween
end function

function getSQL_WhereBetweenMonth2(iMonth,iYear)
    dim d
    d = Date()
    if iMonth = "" then iMonth=Month(d)  End If
    if iYear  = "" then iYear=Year(d) End If

    DaysInMonth = getDaysInMonth(iMonth,iYear)
    sMonth = MonthName(iMonth)

    betweenFrom= "1 " & sMonth & " " & iYear
    betweenTo  = DaysInMonth& " " & sMonth & " "& iYear

    if betweenFrom="" then betweenFrom="1 Jan 2006" end if
    if betweenTo="" then   betweenTo="31 Dec 2009" end if

    if Not IsDate(betweenFrom) then
    Response.Write betweenFrom & " is Not a date"
    Response.End
    end if
    if Not IsDate(betweenTo) then
    Response.Write betweenTo & " is Not a date"
    Response.End
    end if

    SQL_WhereBetween2 = " BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    'return
    getSQL_WhereBetweenMonth2 = SQL_WhereBetween2
end function







function getSQL_WhereBeforeMonth(iMonth,iYear)
    dim d
    d = Date()
    if iMonth = "" then iMonth=Month(d)  End If
    if iYear  = "" then iYear=Year(d) End If

    DaysInMonth = getDaysInMonth(iMonth,iYear)
    sMonth = MonthName(iMonth)

    betweenFrom= "1 " & sMonth & " " & iYear
    betweenTo  = DaysInMonth& " " & sMonth & " "& iYear

    if betweenFrom="" then betweenFrom="1 Jan 2006" end if
    if betweenTo="" then   betweenTo="31 Dec 2009" end if

    if Not IsDate(betweenTo) then
    Response.Write betweenTo & " is Not a date"
    Response.End
    end if

    SQL_WhereBefore = " <  '" & betweenTo & "' "
    'return
    getSQL_WhereBeforeMonth = SQL_WhereBefore
end function

%>