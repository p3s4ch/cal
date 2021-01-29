
<%
Response.Write "<BR> Edit Extra Rooms "
AddId = request("AddId")
Booking = request("Reservation")
noOfRooms = request("noOfRooms")

if noOfRooms = "" then
   Response.Write "<font color=red>No of Rooms cannot be empty </font>"
   Response.End
End If

if noOfRooms > 0 then RoomType1 = request("RoomType1") end if
if noOfRooms > 1 then RoomType2 = request("RoomType2") end if
if noOfRooms > 2 then RoomType3 = request("RoomType3") end if
if noOfRooms > 3 then RoomType4 = request("RoomType4") end if
if noOfRooms > 4 then RoomType5 = request("RoomType5") end if
if noOfRooms > 5 then RoomType6 = request("RoomType6") end if
if noOfRooms > 6 then RoomType7 = request("RoomType7") end if
if noOfRooms > 7 then RoomType8 = request("RoomType8") end if
if noOfRooms > 8 then RoomType9 = request("RoomType9") end if
if noOfRooms > 9 then RoomType10 = request("RoomType10") end if
if noOfRooms > 10 then RoomType11 = request("RoomType11") end if
if noOfRooms > 11 then RoomType12 = request("RoomType12") end if

RoomNum1  = request("RoomNum1")
RoomNum2  = request("RoomNum2")
RoomNum3  = request("RoomNum3")
RoomNum4  = request("RoomNum4")
RoomNum5  = request("RoomNum5")
RoomNum6  = request("RoomNum6")
RoomNum7  = request("RoomNum7")
RoomNum8  = request("RoomNum8")
RoomNum9  = request("RoomNum9")
RoomNum10  = request("RoomNum10")
RoomNum11  = request("RoomNum11")
RoomNum12  = request("RoomNum12")
Response.Write "<BR> noOfRooms   = " &  noOfRooms
%>

<Table border=1 >
<TR>  <TD> <%=RoomType1%></TD>             <TD><%=RoomNum1%></TD> </TR>
<TR>  <TD> <%=RoomType2%></TD>             <TD><%=RoomNum2%></TD> </TR>
<TR>  <TD> <%=RoomType3%></TD>             <TD><%=RoomNum3%></TD> </TR>
<TR>  <TD> <%=RoomType4%></TD>             <TD><%=RoomNum4%></TD> </TR>
<TR>  <TD> <%=RoomType5%></TD>             <TD><%=RoomNum5%></TD> </TR>
<TR>  <TD> <%=RoomType6%></TD>             <TD><%=RoomNum6%></TD> </TR>
<TR>  <TD> <%=RoomType7%></TD>             <TD><%=RoomNum7%></TD> </TR>
<TR>  <TD> <%=RoomType8%></TD>             <TD><%=RoomNum8%></TD> </TR>
<TR>  <TD> <%=RoomType9%></TD>             <TD><%=RoomNum9%></TD> </TR>
<TR>  <TD> <%=RoomType10%></TD>             <TD><%=RoomNum10%></TD> </TR>
<TR>  <TD> <%=RoomType11%></TD>             <TD><%=RoomNum11%></TD> </TR>
<TR>  <TD> <%=RoomType12%></TD>             <TD><%=RoomNum12%></TD> </TR>
</Table>


<%
sql_extras = "exec  dbo.add_ReservationExtraRooms -1, '" & Booking & "'," & noOfRooms &  ",'" &_
                                        RoomType1 & "','" &_
                                         RoomType2 & "','" &_
                                          RoomType3 & "','" &_
                                           RoomType4 & "','" &_
                                            RoomType5 & "','" &_
                                             RoomType6 & "','" &_
                                              RoomType7 & "','" &_
                                               RoomType8 & "','" &_
                                                RoomType9 & "','" &_
                                                 RoomType10 & "','" &_
                                                  RoomType11 & "','" &_
                                                   RoomType12 & "'"

sql_set_roomNums = "exec  dbo.add_ReservationRoomsWithNums -1, '" & Booking & "'," & noOfRooms &  ",'" &_
				RoomType1 & "','" &_
				 RoomType2 & "','" &_
				  RoomType3 & "','" &_
				   RoomType4 & "','" &_
					RoomType5 & "','" &_
					 RoomType6 & "','" &_
					  RoomType7 & "','" &_
					   RoomType8 & "','" &_
						RoomType9 & "','" &_
						 RoomType10 & "','" &_
						  RoomType11 & "','" &_
						   RoomType12 & "','" &_
                                        RoomNum1 & "','" &_
                                         RoomNum2 & "','" &_
                                          RoomNum3 & "','" &_
                                           RoomNum4 & "','" &_
                                            RoomNum5 & "','" &_
                                             RoomNum6 & "','" &_
                                              RoomNum7 & "','" &_
                                               RoomNum8 & "','" &_
                                                RoomNum9 & "','" &_
                                                 RoomNum10 & "','" &_
                                                  RoomNum11 & "','" &_
                                                   RoomNum12 & "'"

        if isDebug then
           Response.Write "<BR> debug 1 = " & sql_extras
           Response.Write "<BR> debug 2 = " & sql_set_roomNums
       End If

        if RoomNum1 = "" then
           Response.Write "<BR> Good, no Room <i>Number </i> prefernces found these will be auto allocated on Arrival day"
           SQLCN.execute(sql_extras)
        Else
           Response.Write "<BR> Room Number preferences found. These will now be set "
           SQLCN.execute(sql_set_roomNums)
        End if




        Response.Write "<HR>"

%>

