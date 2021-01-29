
<%
sMonth = MonthName(iMonth)
DayOfMonth = 1
DaysInMonth = getDaysInMonth(iMonth,iYear)
firstOfTheMonth =  "1 " & sMonth &" "& iYear
iWeekDayOfTheFirstOfTheMonth = weekday(firstOfTheMonth,1)
firstOfMonth =  "1 " & sMonth &" "& iYear
endOfMonth =    "30 " & sMonth &" "& iYear 'To do
iWeekday = iWeekDayOfTheFirstOfTheMonth
Response.Write "<b>" & sMonth &"</b>"


%>
<table border="1" cellpadding="0" cellspacing="0" width="100%" height="100%">
<tr>
<td bgcolor="#c0c0c0">
<table border="1" cellpadding="0" cellspacing="1" width="100%" height="100%">
<tr>
<td height="1%" class="c_dayofweek"> Sunday </td>
<td class="c_dayofweek"> Monday </td>
<td class="c_dayofweek"> Tuesday </td>
<td class="c_dayofweek"> Wednesday  </td>
<td class="c_dayofweek"> Thursday  </td>
<td class="c_dayofweek"> Friday  </td>
<td class="c_dayofweek"> Saturday </td>
</tr>

<%
Response.Write "<TR>"
if iWeekday = 2 then Response.Write "<td></td>" end if
if iWeekday = 3 then Response.Write "<td></td><td></td>" end if
if iWeekday = 4 then Response.Write "<td></td><td></td><td></td>" end if
if iWeekday = 5 then Response.Write "<td></td><td></td><td></td><td></td>" end if
if iWeekday = 6 then Response.Write "<td></td><td></td><td></td><td></td><td></td>" end if
if iWeekday = 7 then Response.Write "<td></td><td></td><td></td><td></td><td></td><td></td>" end if

y = Date()
z =  Day(y) & "," & Month(y) & "," & Year(y)
today = CDate(z)

WHILE DayOfMonth <= DaysInMonth
        x =  DayOfMonth & "," &iMonth & "," & iYear
        iDay = DayOfMonth
		ViewDt = CDate(x)

		morning =  DayOfMonth & " "&  MonthName(iMonth) & " "&  iYear


		dayPlan = "<table WIDTH=96% >"
		sql_step1 = "Load_EventSummaryTmp '" & morning  &"','" & operator &"','" & category  & "'," & excl_category & "," & uid
        SQLCN.Execute(sql_step1)

       Set RS = SQLCN.Execute("Get_EventSummaryTmp")
	   canAlsoDeleteAllLink = ""

	   WHILE    Not RS.EOF
	             det  = Trim(RS("Details"))
                 op  = Trim(RS("Operator"))
             	 cat = RS("Category")
                 id  = RS("ID")

             	 color="blue"
                 bgcolor = "00ffff"

                 if   cat  = "unavailable" then
                  color="black"
                  bgcolor = ""
                 end if

                 canAlsoDeleteLink = ""

                 if   cat  = "available" AND  isGuest <> 1 AND  isCustomer <> 1 then
                      canAlsoDeleteAllLink= "<br><br><a href=?uid="& uid &"&deleteAllID="& RS("ID")& "&iDay=" & iDay & "&iMonth="& iMonth & "&iYear="& iYear & "&Operator=" & RS("Operator")  & " ><font color=red><b> X all </b></a>"
                 end if

                 if   cat  ="available" or cat="unavailable" then
                 	  linkTo ="WeekView.asp"
                      op = ""
                      id = ""
             	  else
                      linkTo ="EventView.asp"
                      color="black"
             	      bgcolor = "yellow"

             	 end if

             	 if   cat  ="Reminder" or cat="Task" or cat="Holiday" or cat="Note" then
                 	  linkTo ="Note_add.asp"
                 end if

	            tms = RS("tm")  & "&nbsp;-&nbsp;" & RS("tm2")

                linktoPage = "<a href=" & linkto &"?uid="&uid&"&AddID="& id & "&operator="& Trim(RS("Operator")) &"&iDay="& DayOfMonth & "&iMonth="& iMonth &"&iYear="& iYear &">"  &_
	            "<font color="&color&">" & tms & " &nbsp; " & op & " &nbsp; " & cat & " </font></a>"

				if (cat <> "available") AND (isGuest OR (isCustomer = 1  AND CustomerID <> RS("CustomerID")))  then
			      linktoPage = "Taken"
                  bgcolor = "pink"
                end if

				if (cat = "Reminder") or (cat = "Task") or (cat = "Holiday")   then
				    bgcolor = RS("color")
				    linktoPage = "<a href=" & linkto &"?uid="&uid&"&AddID="& id & "&operator="& Trim(RS("Operator")) &"&iDay="& DayOfMonth & "&iMonth="& iMonth &"&iYear="& iYear &">"  &_
					"<font color="&color&"> &nbsp; " & det & " &nbsp; </font></a>"
				end if

                if (cat = "parsha")  then
				        linktoPage = "<i><font color="&color&"> &nbsp;  &nbsp; " & det & " </font></i>"
				        bgcolor = "white"
				end if

                if (cat = "cal")  then
					linktoPage = "<font color="&color&">   &nbsp;  &nbsp; " & det & " </font>"
					bgcolor = "#87CEFA"
				end if



                dayPlan = dayPlan & " <tr >  " &_
		        "<td BGCOLOR="& bgcolor &">" & linktoPage & canAlsoDeleteLink   & canAlsoDeleteAllLink & " </td> </tr>"




		        RS.MoveNext
		WEND
		dayPlan = dayPlan & "</table>"


        if isAdmin or isStaff then
				dayLink="<div class='daynumber'><a href=events_add.asp?uid="&uid&"&operator="&operator&"&iDay="& DayOfMonth &"&iMonth="&iMonth&"&iYear="&iYear& "><font color=grey>Job</font></a> "&_
				        "&nbsp;&nbsp;&nbsp;	<a href=Note_add.asp?uid="&uid&"&operator="&operator&"&iDay="& DayOfMonth &"&iMonth="&iMonth&"&iYear="&iYear& "><font color=grey>Note</font></a> &nbsp;&nbsp;&nbsp; "& DayOfMonth &"</div>"
		else
		        dayLink="<div class='daynumber'> &nbsp;&nbsp;&nbsp;"& DayOfMonth & "</div>"
		end if




		if iWeekday = 8 then
			iWeekday = 1 'today is sunday good voch
			Response.Write "</TR><TR>"
		end if

		if today = ViewDt then

        	Response.Write "<td class='c_today' > " & dayLink &" <br> &nbsp; &nbsp; &nbsp; &nbsp; today " &  dayPlan & "</td>"
        else

			Response.Write "<td class='c_weekend'>" & dayLink &" <br> " &  dayPlan & "</td>"
        end if

		iWeekday = iWeekday +1
		DayOfMonth =DayOfMonth+1
	wend
Response.Write "</TR>"
%>

</table></td></tr></table>