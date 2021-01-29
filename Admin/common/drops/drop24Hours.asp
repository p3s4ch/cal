



<%

if myDatetime = "" then
     d = Date()
End If

myCDate = CDate(myDatetime)
min = Minute(myCDate)
hr24 = Hour(myDatetime)

if min < 15 then sMin = "00" end if
if min >= 15 AND min < 30 then sMin = "15" end if
if min >= 30 AND min < 45 then sMin = "30" end if
if min >= 45              then sMin = "45" end if

timeStr = hr24 & ":" & sMin

valTime = timeStr
'Response.Write valTime
%>

 <select name="<%=fieldName%>" class="inputbox">
 <%

 hourCounter = 0
 Do WHILE hourCounter < 24
       minCounter = 0
	   Do WHILE minCounter < 10
		   strTime = hourCounter & ":0"  & minCounter
		   if valTime=strTime then selected ="SELECTED" else  selected ="" end if
		   %>
			   <option value="<%=strTime%>"  <%=selected%> >  <%=strTime%>  </option>
		   <%
		   minCounter = minCounter + 1
	   Loop

	   Do WHILE minCounter < 60
			  strTime = hourCounter & ":"  & minCounter
			  if valTime=strTime then selected ="SELECTED" else  selected ="" end if
			  %>
				 <option value="<%=strTime%>"  <%=selected%> >  <%=strTime%>  </option>
			  <%
			  minCounter = minCounter + 1
	   Loop
  hourCounter = hourCounter + 1
 Loop


%>
</select>
