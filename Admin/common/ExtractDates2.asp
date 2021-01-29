
<%
FromDay= request("FromDay")
FromMonth= request("FromMonth")
FromYr= request("FromYr")
ToDay= request("ToDay")
ToMonth= request("ToMonth")
ToYr= request("ToYr")
SearchFor = request("SearchFor")


iMonth= request("Month")
iYear= request("Year")

periodID= request("periodID")


If NOT (SearchFor = "") Then
   periodID=76
End If




if OverridePeriodIDPreference <> "" then
  periodID=OverridePeriodIDPreference
end if


if iMonth = "" then
   dim d
   d = Date()
   iMonth = Month(d)
   iYear =Year (d)
end if



if FromDay <> "" then
    periodID=""
    betweenFrom = FromDay & " " & MonthName(FromMonth) & " " & FromYr
end if

if ToDay <> "" then
    periodID=""
    betweenTo   = ToDay   & " " & MonthName(ToMonth)   & " " & ToYr
end if



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

if Not IsDate(betweenFrom) then
Response.Write betweenFrom & " is Not a date"
Response.End
end if

if ToDay <> "" And Not IsDate(betweenTo) then
Response.Write betweenTo & " is Not a date"
Response.End
end if

fromMonthNme = MonthName(FromMonth)

%>