
<%

'Response.Write "util"
'dim d
'd = Date()
'tom = DateAdd ("d",1,d)
'Response.Write "today is "& d
'Response.Write "tommorrow is " & tom



%>


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


function LastWeek(iDay,iMonth,iYear)
	i7PreDay = iDay - 7
	i7PreMonth = iMonth
	i7PreYear = iYear
	if i7PreDay < 1 then
		i7PreMonth = i7PreMonth -1
		i7PreDay = 28 ' i may need to be more accurate
	    if i7PreMonth = 0 then
	    i7PreMonth = 12
	    i7PreYear = i7PreYear -1
	    end if
	end if
	Dim d
	'x =  i7PreDay & "," & i7PreMonth & "," & i7PreYear
	x =  i7PreDay & "," & MonthName(i7PreMonth) & "," & i7PreYear



	if IsDate(x) then
	d = CDate(x)
	LastWeek = d
	end if
end function

function LastWeekDebug(iDay,iMonth,iYear)
	i7PreDay = iDay - 7
	i7PreMonth = iMonth
	i7PreYear = iYear

	Response.Write "i7PreDay="& i7PreDay

	if i7PreDay < 1 then
		i7PreMonth = i7PreMonth -1
		i7PreDay = 28 ' i may need to be more accurate
	    if i7PreMonth = 0 then
	    i7PreMonth = 12
	    i7PreYear = i7PreYear -1
	    end if
	end if
	Dim d
	'x =  i7PreDay & "," & i7PreMonth & "," & i7PreYear
	x =  i7PreDay & "," & MonthName(i7PreMonth) & "," & i7PreYear



	if IsDate(x) then
	d = CDate(x)
	LastWeek = d
	end if
end function




function GetMySunday(dt )
     GetMySunday = DateSerial(Year(dt),Month(dt),day(dt) - DatePart("w",dt) +1)
End function


function GetPrevSunday(iDay,iMonth,iYear)


	dim d
	x =  iDay & "," &MonthName(iMonth) & "," & iYear

	if IsDate(x) then
		d = CDate(x)
	else
	   d = Date()
	end if


    dp = DatePart("w",d)

    dt = day(d)

	if day(d) < dp  then


	    lastMonthDays = getDaysInMonth(Month(d)-1,Year(d))

        xxx = DateSerial(Year(d),Month(d)-1, lastMonthDays + day(d) - dp +1 )


    else
        xxx= GetMySunday(d)

    end if
    GetPrevSunday = xxx
end function


function GetPrevDay(iDay,iMonth,iYear)
	dim d
	iDay = iDay -1
	if iDay < 1 then
		iMonth = iMonth -1
		if iMonth = 0 then
			iMonth = 12
			iYear = iYear -1
		end if
		iDay = getDaysInMonth(iMonth,iYear)
	end if

	x =  iDay & ","  &MonthName(iMonth) & "," & iYear
	d = CDate(x)
	GetPrevDay = d
end function
%>