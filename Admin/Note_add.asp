<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->
<!--#include file="common/GilonHiddenURLSession.asp"-->

<%
Dim CustomersMap(300)
AddID = request("AddID")
Operator = Trim(request("Operator"))
iMonth = Trim(request("iMonth"))
iYear = Trim(request("iYear"))


GroupID=0
 If (AddID <> "") Then
	  SQL = "select * from cEvents WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  StartTime=RS("StartTime")
	  EndTime=RS("EndTime")
	  EventName=RS("Title")
	  GroupID=RS("GroupID")
	  sDetails=Rs("Details")
	  Category=Rs("Category")
	  'eCategory=Category
	  CatB=Rs("CatB")
	  EventCustomerID=Rs("CustomerID")

	  sOffice=Rs("Office")
	  BillTotal=Rs("BillTotal")
	  SiteAddress=Rs("SiteAddress")
	  SitePostCode=Rs("SitePostCode")
	  Operator=Trim(Rs("Operator"))
	  SameAsBill=Rs("SameAsBill")
      duration=Rs("duration")

	  if (SameAsBill=1) then
	   isCHECKED="CHECKED"
	  else
	   isCHECKED="UNCHECKED"
	  end if


	  'Response.Write "EventCustomerID = " & EventCustomerID

	  if  Category = "available" then Category = "NotYetSelected" end if
  Else
	 AddID = -1
	 EventCustomerID =-1
     dim d
     iDay=request("iDay")
     iMonth= request("iMonth")
     iYear = request("iYear")

     if iDay <> "" and iMonth <> "" and iYear <> "" then
        tryDt = iDay &" "& MonthName(iMonth) &" "& iYear
        d = CDate(tryDt)
       else
         d = Date()
     end if



    Response.Write "d=" & d
    StartTime = d
 End If


%>


<!--#include file="common\banner.asp"-->

<body>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr><td width="100%"><font face="Verdana" size="1"><br>

<!-- table border="0" cellpadding="2" cellspacing="0" width="517">
<tr><td width="100%"><font face="Verdana" size="1"><br -->

<!-------------------------------------------------Form------------------------------------------------------->
<form action="NoteBooked.asp?Operator=<%=Operator%>&uid=<%=uid%>&iMonth=<%=iMonth%>&iYear=<%=iYear%>" name="frmUser" Method="POST" >

<table border="0" cellpadding="3" cellspacing="0" align="center">



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Calendar</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"> <%=Operator%><input type="hidden" name="Operator" value= "<%=Operator%> " > &nbsp;&nbsp;&nbsp;&nbsp;
</td></tr>


<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">

<a href="DayRange.asp?uid=<%=uid%>&Operator=<%=Operator%>&GroupID=<%=GroupID%>"><font face="Verdana" size="1" color=green>
<b>Recurrence</b></font></a>
</td>

</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Start Time</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>

<%
cDtStart =  CDate(StartTime)
%>

<%=WeekdayName(WeekDay(cDtStart))%> &nbsp;
<%=Day(cDtStart)%>	&nbsp; <%=MonthName(Month(cDtStart))%> &nbsp;<%=Year(cDtStart)%>

<input type="text" name="StartDate" id="StartDate" value=<%=StartTime%> />


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
<select name="Category" class="inputBox">

<option value="Holiday" SELECTED>Holiday</option>
<option value="Reminder" >Reminder</option>
<option value="Task" >Task</option>

</select> &nbsp

<font face="Verdana" size="1" color="48576C"><b>Colour</b></font>

<select name="Color" class="inputBox">

<option value="87CEEB" SELECTED>blue</option>
<option value="F0E68C"> yellow</option>
<option value="90EE90"> green</option>
<option value="FFA500"> orange</option>
</select>






</td>
</tr>
</tr>



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Details</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><textarea name="Details" class="inputbox" cols="60" rows="5" > <%=sDetails%> </textarea>
</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
</tr>


<tr>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0">

<tr>
<td align="right" valign="bottom"> &nbsp; </td>
<td>&nbsp;</td>

<td valign="bottom">


                   <input type="hidden"  name="Operator" value="<%=Operator%>" >
                   <input type="hidden"  name="AddID" value="<%=AddID%>" >
                   <input type="hidden"  name="AllDay" value="1" >
				   <input type="hidden"  name="StartTime" value="<%=StartTime%>" >
				   <input type="hidden"  name="EndTime" value="<%=EndTime%>" >
                   <input type="hidden"  name="uid" value="<%=uid%>" >


                   <input type="submit" name="Submit" value="Add" class="inputSubmit">
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="submit" name="Submit" value="Delete" class="inputSubmit">



                   </font></td>
</tr>


</table>
</form>

<!--/td></tr></table-->
<!--/td></tr></table-->
</tr>

</table>
</td></tr>
<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
