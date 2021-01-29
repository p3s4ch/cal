


<b>Booking History:</b> <br>

<%
viewUid= request("viewUid")


IF isCustomer THEN

    'Response.Write "jobs below exclude VAT <br>"
    sqlTop="exec MostRecentEvents2do '"& uid

    ELSE

       IF  isGuest THEN
             Response.Write " g. <br>"
	        sqlTop="exec MostRecentEvents2do '"& uid
       ELSE
            'staff
            sqlTop="exec MostRecentEvents2do '"& uid
       END IF
END IF

%>

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF">&nbsp; </td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Actions:&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Booking&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Date&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Time&nbsp;</b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Details&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Post Code&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Status&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Category&nbsp;</b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>&nbsp;&pound;&nbsp;</b></font></td>

</tr>


<%

'Response.Write sqlTop
Set RS = SQLCN.Execute(sqlTop)

'Warning Dim colorchanger is already set on this page
colorchanger = 0
color1 = "#C5D3E7"
color2 = "#B0C4DE"

dim d
d = Date()
x= Day(d) &","& Month(d) &","& Year(d)
todayDt=   Date()


WHILE     Not RS.EOF

		  status = RS("Confirmed")
		  'view only for some
          if status = "Not Paid" and isContractor then status="Paid" End If

          clr = "black"
          if status = "Paid" then clr="blue" End IF
          if status = "Unpaid" or status = "Not Paid" then clr="red" End IF
          if status = "Unconfirmed" then
                   clr="red"
                   if isCustomer then
                       clr="green"
                       status = "Booked"
                  end if
          End IF
          if status = "Confirmed"  then clr="green" End IF


    	  start = RS("StartTime")
		  ViewDt = CDate(FormatDateTime(RS("StartTime"), vbShortDate))




		  link = "../EventView.asp?uid="& uid &"&AddID="& RS("EventID") & "&iDay=" &Day(ViewDt)& "&iMonth=" &Month(ViewDt)& "&iYear=" &Year(ViewDt)
		  link2edit="<a href="& link &" > <font face='Verdana, arial' size=1 color=blue> Edit / Change  &nbsp; </font> </a>"

		  'You cannot cancel online on the day itself of the job. Please call to cancel
		  If  DateDiff("h", todayDt, ViewDt) > 1  Then

		      link2cancel= "<a href=ConfirmCancel.asp?uid="& uid &"&DeleteID=" & RS("EventID") &" > <font face='Verdana, arial' color=black size=1> Cancel </font>  &nbsp; </a>"
		      'can only rebook if its a future event...

		      IF status = "Cancelled"  then
			           		clr="black"
			                link2cancel= "<a href=Rebook.asp?uid="& uid &"&RebookID=" & RS("EventID") &" > <font face='Verdana, arial' color=black size=1> Rebook </font>  &nbsp; </a>"
			  End IF

		  ELSE


              link2cancel= "<a href=Feedback.asp?uid="& uid &"&AddID=" & RS("EventID") & "&iDay="& Day(ViewDt) &"&iMonth=" &Month(ViewDt)& "&iYear=" & Year(ViewDt) & "> <font face='Verdana, arial' color=black size=1> Add Feedback </font>  &nbsp; </a>"
              link2edit = " - "
		  End If






          Response.Write  "<tr>"

          Response.Write  "<td> &nbsp; </td>"
          Response.Write  "<td bgcolor="& color2 &">" & link2cancel & " " & link2edit & "</td>"
          Response.Write  "<td bgcolor="& color1 &"> <font face='Verdana, arial' size=1> " & RS("Operator") & "</font></td>"
          Response.Write  "<td bgcolor="& color1 &"> <font face='Verdana, arial' size=1> " & WeekdayName(Weekday(start,Monday),true,Monday) & ",&nbsp;" & Day(start) & "&nbsp;" & MonthName(Month(start),true) & "</font></td>"

          Response.Write  "<td bgcolor="& color1 &"> <font face='Verdana, arial' size=1> " & FormatDateTime(start, vbShortTime) &"&nbsp;" & Right(FormatDateTime(start, vbLongTime),2) & "</font></td>"

          Response.Write  "<td bgcolor="& color2 &"> <font face='Verdana, arial' size=1> " & Left(RS("Details"),50) & "</font></td>"
          Response.Write  "<td bgcolor="& color2 &"> <font face='Verdana, arial' size=1> " & RS("SitePostCode") & "</font></td>"
          Response.Write  "<td bgcolor="& color2 &"><b> <font face='Verdana, arial' size=1 color="&clr&"> " & status & "</font></b></td>"


          Response.Write  "<td bgcolor="& color2 &"> <font face='Verdana, arial' size=1> " & RS("Category") & "</font></td>"
		  Response.Write  "<td bgcolor="& color2 &"> <font face='Verdana, arial' size=1> &nbsp;<b>" & RS("BillTotal") & "</b></font></td>"

          Response.Write  "</tr>"
          RS.MoveNext
          If colorchanger = 1 Then
	        colorchanger = 0
	        color1 = "#C5D3E7"
	        color2 = "#B0C4DE"
        Else
	        colorchanger = 1
	        color1 = "#DAE3F0"
	        color2 = "#C5D3E7"
        End If

WEND
%>

</table>
<br>