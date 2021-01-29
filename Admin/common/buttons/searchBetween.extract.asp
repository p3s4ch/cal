



<%

FromDay = request("FromDay")
FromMonth = request("FromMonth")
FromYr  = request("FromYr")

ToDay = request("ToDay")
ToMonth = request("ToMonth")
ToYr  = request("ToYr")

periodID= request("periodID")
if periodID = "" and FromDay ="" then
  Set RS1 = SQLCN.Execute("exec dbo.GetPreferencesByUID " & uid )
  periodID = RS1("periodID")
end if


if periodID <> "" then

 Set RSP = SQLCN.Execute("select * from vPeriods where ID=" & periodID)
 betweenFrom=RSP("PeriodStart")
 betweenTo=RSP("PeriodEnd")
 FromDay= Day(betweenFrom)
 FromMonth= Month(betweenFrom)
 FromYr= Year(betweenFrom)
 ToDay= Day(betweenTo)
 ToMonth= Month(betweenTo)
 ToYr= Year(betweenTo)


end if






if FromMonth = "" then
   d = Date()
   FromDay = Day (d)
   FromMonth = Month(d)
   FromYr =Year (d)
end if

betweenFrom  =   FromDay & " " & MonthName(FromMonth) & " " & FromYr

if Not IsDate(betweenFrom) then
  Response.Write betweenFrom & " is Not a date"
  Response.End
end if

if ToMonth = "" then
   ToDay = getDaysInMonth(FromMonth,FromYr)
   ToMonth = FromMonth
   ToYr = FromYr
end if

betweenTo  =   ToDay & " " & MonthName(ToMonth) & " " & ToYr
if Not IsDate(betweenTo) then
  Response.Write betweenTo & " is Not a date"
  Response.End
end if

if thedatefield = "" then
  Response.Write " thedatefield must be set"
  Response.End
end if

sqlWhereBetween = thedatefield & " between '" & betweenFrom & "' AND '" & betweenTo & "'"



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








