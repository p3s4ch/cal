
<%


AddId = request("AddId")
Booking = request("Booking")


noOfRooms = request("noOfRooms")

Response.Write "<br> noOfRooms["& noOfRooms  &"] <hr>"


if noOfRooms > 0 then RoomType1 = request("RoomType") end if
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

'Response.Write "<BR> noOfRooms   = " &  noOfRooms
'Response.Write "<BR> RoomType1   = " &  RoomType1
'Response.Write "<BR> RoomType2   = " &  RoomType2
'Response.Write "<BR> RoomType3   = " &  RoomType3
'Response.Write "<BR> RoomType4   = " &  RoomType4
'Response.Write "<BR> RoomType5   = " &  RoomType5
'Response.Write "<BR> RoomType6   = " &  RoomType6
'Response.Write "<BR> RoomType7   = " &  RoomType7
'Response.Write "<BR> RoomType8   = " &  RoomType8
'Response.Write "<BR> RoomType9   = " &  RoomType9
'Response.Write "<BR> RoomType10   = " &  RoomType10
'Response.Write "<BR> RoomType11   = " &  RoomType11
'Response.Write "<BR> RoomType12   = " &  RoomType12

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



        if isDebug then
         Response.Write "<BR> debug = " & sql_extras
        End If



        set RSUPDATE = SQLCN.execute(sql_extras)
        Response.Write "<HR>"

%>

