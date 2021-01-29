

<%
isHeading=false
isStartTime=false
isCombinedTot=false
isAnID=false
isAnAddID=false
isMonth=false
isDt=false
isSlipNo =false
isTXID =false
isDetails =false
isCostCode=false
isBookingRes=false
isHidden=false
isId2print=false
isId2edit=false
isId2new = false
isId2email=false
isReservationPaymentStatus =false
isCustomerID_Ext=false
isOverride=false
isComment=false
isEntryDate=false
isOverride=false
isLoginAsThem = false
isEventFeedback = false
isInvoiceStatus = false
isInvoice2pay = false

if InStr(x.Name,"Invoice2pay") > 0 then isInvoice2pay =true else isInvoice2pay=false end if
if InStr(x.Name,"Invoice2pay") > 0 then isOverride =true end if


if InStr(x.Name,"InvStatus") > 0 then isInvoiceStatus =true else isInvoiceStatus=false end if
if InStr(x.Name,"_Ext") > 0 then isOverride =true else isOverride=false end if
if InStr(x.Name,"LoginAsThem") > 0 then isOverride =true end if
if InStr(x.Name,"EventFeedback") > 0 then isOverride =true end if
if InStr(x.Name,"EventFeedback") > 0 then isEventFeedback  =true else isEventFeedback=false end if

if InStr(x.Name,"id2email") > 0 then isId2email =true else isId2email=false end if
if InStr(x.Name,"id2print") > 0 then isId2print =true else isId2print=false end if
if InStr(x.Name,"id2edit") > 0 then isId2edit =true else   isId2edit=false end if
if InStr(x.Name,"id2New")  > 0 then isId2new =true else    isId2new=false end if


if InStr(x.Name,"Booking") > 0 then isBookingRes =true else isBookingRes=false end if
if InStr(x.Name,"hidden") > 0 then isHidden =true else isHidden=false end if
if InStr(x.Name,"StartTime") > 0 or InStr(x.Name,"Arrival") > 0 or InStr(x.Name,"Departure") then isStartTime =true else isStartTime=false end if
if InStr(x.Name,"Heading") > 0 then isHeading =true else isHeading=false end if
if InStr(x.Name,"SlipNo") > 0 then isSlipNo =true else isSlipNo=false end if
if InStr(x.Name,"No") > 0 or (InStr(x.Name,"ID")  > 0 AND Not InStr(x.Name,"Admin_ID") > 0 )  then isAnID =true else isAnID=false end if


if InStr(x.Name,"AddID" ) > 0 then
            isAnAddID =true
			isAnID=false
	else 	isAnAddID=false
	end if

if InStr(x.Name,"TXID") > 0   then
    isAnID =false
    isTXID = true
end if

if InStr(x.Name,"total") > 0 then isTot =true else isTot=false end if
if InStr(x.Name,"Combined Total") > 0 then isCombinedTot =true else isCombinedTot=false end if
if InStr(x.Name,"Month") > 0 then isMonth =true else isMonth=false end if
if InStr(x.Name,"Date") > 0 then isDt =true else isDt=false end if
if InStr(x.Name,"Details") > 0 then isDetails =true else isDetails=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if
if InStr(x.Name,"LoginAsThem") > 0 then isLoginAsThem =true else isLoginAsThem = false  end if


%>

<!-- not include file="columnFormatterOverrides.asp"-->




<%


if isInvoice2pay then


 %>
   <td bgcolor="<%=color1%>"> <a href="<%=payViewPgLink%>?Admin_ID=<%=Admin_ID%>&uid=<%=uid%>&ID=<%=x.value%>" >
             <font face="Verdana, arial" size="1" color=red>View / Pay</font></a></td>
 <%
end if




if isLoginAsThem then
 %>
   <td bgcolor="<%=color1%>"> <a href=main.asp?uid=<%= x.value %> >
   <font face="Verdana, arial" size="1" color=red> <%= x.value %> </font> </a> </td>
 <%
end if




if isDetails then
 %>
   <td bgcolor="<%=color1%>">
   <font face="Verdana, arial" size="1" >  <%= Left(RS("Details"),50) %> </font> </td>
 <%
 end if


if isDt OR isStartTime then
 %>
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" > <%= MonthName(Month(x.value),true)%>&nbsp; <%= Day(x.value)%> &nbsp;,<%= Year(x.value) %> </font></b></td>
 <%
 end if

if isMonth then
 %>
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" ><%= MonthName(x.value) %></font></b></td>
 <%
 end if




 if isCombinedTot then
 %>
   <td bgcolor="<%=color1%>">
   <a href="?uid=<%=uid%>&doGroupByCCIsSet=yes&FromDay=<%=Day(betweenFrom)%>&FromMonth=<%=Month(betweenFrom)%>&FromYr=<%=Year(betweenFrom)%>&ToDay=<%=Day(betweenTo)%>&ToMonth=<%=Month(betweenTo)%>&ToYr=<%=Year(betweenTo)%>&SearchForCC=<%=RS("CostCode")%>">
     <font face="Verdana, arial" size="1" color=red><%= x.value %></font></a></td>
 <%
 end if




if isAnID then
 %>
   <td bgcolor="<%=color1%>">
   <a href="<%=addEditPgLink%>?Admin_ID=<%=Admin_ID%>&uid=<%=uid%>&ID=<%=x.value%>" ><font face="Verdana, arial" size="1" color=red>Edit</font></a></td>
<%
end if


if isBookingRes then
 %>
   <td bgcolor="<%=color1%>">
   <a href="<%=addEditPgLink%>?Admin_ID=<%=Admin_ID%>&uid=<%=uid%>&BookingID=<%=x.value%>" ><font face="Verdana, arial" size="1" color=red>Edit</font></a></td>
<%
end if

if isAnAddID then
 %>
   <td bgcolor="#FFFFFF" > <a href="<%=addEditPgLink%>?uid=<%=uid%>&AddID=<%= x.value %>" >
         <font face="Verdana, arial" size="1" > Edit&nbsp;&nbsp;   </font>   </a></td>
<%
end if


if isCostCode then
%>
   <td bgcolor="<%=color1%>">
      <a href="?uid=<%=uid%>&filter_on=COSTS&bttns=Accounts.Buttons&doGroupByCCIsSet=yes&FromDay=<%=Day(betweenFrom)%>&FromMonth=<%=Month(betweenFrom)%>&FromYr=<%=Year(betweenFrom)%>&ToDay=<%=Day(betweenTo)%>&ToMonth=<%=Month(betweenTo)%>&ToYr=<%=Year(betweenTo)%>&CostCode=<%=RS("CostCode")%>&SearchForCC=<%=RS("CostCode")%>">
     <font face="Verdana, arial" size="1" color=red><%= x.value %></font></a></td>

<%
end if

if isTot then
%>

     <td bgcolor="<%=color1%>"><b><font face="Verdana, arial" size="1" color=green> <%= FormatNumber(x.value, 2)  %></font></b></td>

<%
end if


if isId2print then
 %>
   <td bgcolor="#FFFFFF" > <a href="<%=printPgLink%>?ID=<%=x.value %>&BookingID=<%= x.value %>&mysql=select * from fees" >
         <font face="Verdana, arial" size="1" color=blue>  Print&nbsp;&nbsp;   </font>   </a></td>
<%
end if


if isId2edit then
 %>
   <td bgcolor="#FFFFFF" > <a href="<%=editPgLink%>?uid=<%=uid%>&tableName=<%=tableName%>&editSQL=<%=editSQL%>&ID=<%=x.value%>&AddID=<%= x.value%>&BookingID=<%= x.value%>&iDay=1&iMonth=6&iYear=2014" >
         <font face="Verdana, arial" size="1" color=red > Edit&nbsp;&nbsp;   </font>   </a></td>
<%
end if

if isId2new then
 %>
   <td bgcolor="#FFFFFF" > <a href="<%=editPgLink%>?isId2new=true&uid=<%=uid%>&tableName=<%=tableName%>&editSQL=<%=editSQL%>&ID=<%=x.value%>&AddID=<%= x.value%>&BookingID=<%= x.value%>&iDay=1&iMonth=6&iYear=2014" >
         <font face="Verdana, arial" size="1" color=red > Copy &nbsp;&nbsp;   </font>   </a></td>
<%
end if


if isId2email then
 %>
   <td bgcolor="#FFFFFF" > <a href="<%=emailPgLink%>?uid=<%=uid%>&emailChaseTable=<%= emailChaseTable %>&origStatus=<%=trim(RS("S_STATUS_hidden"))%>&email=<%=trim(RS("Email"))%>&ID=<%=x.value%>&AddID=<%= x.value%>&BookingID=<%= x.value%>&iDay=1&iMonth=6&iYear=2014" >
         <font face="Verdana, arial" size="1" color=red > Chase&nbsp;&nbsp;   </font>   </a></td>
<%
end if


if isInvoiceStatus then
  if RS("InvStatus")="Paid" then
         fontcolor2="black"
         fontcolor="green"
         outstandingCk = "<img src=Tick_g.gif /> " & FormatNumber(RS("Outstanding"), 2)
         if FormatNumber(RS("Outstanding"), 2) <> 0 then
                 outstandingCk = "<font color=red size=2><b>!</b></font> " & FormatNumber(RS("Outstanding"), 2)
         End If
    else
        fontcolor = "red"
        fontcolor2 = "red"
        outstandingCk=" &nbsp;"& FormatNumber(RS("Outstanding"), 2)
  End if
  %>
     <td bgcolor="#FFFFFF" >
           <font face="Verdana, arial" size="1" color=<%=fontcolor %>  > <%=outstandingCk %>   </font>   </a></td>
  <%
end if




 if  Not isId2email and Not isInvoiceStatus and Not isOverride and Not isId2print and Not isId2edit and Not isHidden and Not isBookingRes and Not isTot and Not isStartTime and Not isCostCode and Not isDetails and Not isAnAddID and Not isAnID and Not isCombinedTot and Not isMonth and Not isDt then
 %>
   <td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%= x.value %></font></td>
 <%
  end if
 %>