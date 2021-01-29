


 <select name="EndHour" class="inputbox">

 <%
 hourCounter = 1
 Do WHILE hourCounter <= 6

   strTime = hourCounter &":00AM"
   strTimeDisplay = hourCounter &":00 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <%strTime = hourCounter &":30AM"
   strTimeDisplay = hourCounter &":30 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

 <% hourCounter = hourCounter + 1
    Loop
   '-------------------------------------------------------------------------
   hourCounter = 7
   Do WHILE hourCounter < 12

   strTime = hourCounter &":00AM"
   strTimeDisplay = hourCounter &":00 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <%strTime = hourCounter &":15AM"
   strTimeDisplay = hourCounter &":15 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <% strTime = hourCounter &":30AM"
   strTimeDisplay = hourCounter &":30 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <% strTime = hourCounter &":45AM"
   strTimeDisplay = hourCounter &":45 AM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

 <% hourCounter = hourCounter + 1
 Loop
 hourCounter = 0
 Do WHILE hourCounter <12

   if hourCounter = 0  then
   hr = 12
   else
   hr = hourCounter
   end if




   strTime = hr &":00PM"
   strTimeDisplay = hr &":00 PM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <%strTime = hr &":15PM"
   strTimeDisplay = hr &":15 PM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <%strTime = hr &":30PM"
   strTimeDisplay = hr &":30 PM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

   <%strTime = hr &":45PM"
   strTimeDisplay = hr &":45 PM"
   if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
   <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

 <% hourCounter = hourCounter + 1
 Loop
 %>
 </select>
