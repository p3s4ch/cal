
<%


ID = "-1"
Booking = trim(request("Booking"))

Source = request("Source")
SourceOther = request("SourceOther")
if SourceOther <> "" then Source=SourceOther end if
FirstName =    trim(request("FirstName"))
Surname =    trim(request("Surname"))
Email =    trim(request("Email"))
Mobile =    trim(request("Mobile"))
noOfRooms = trim(request("Number of Rooms"))

if Surname="" then
   Surname="."
End If
if Mobile="" then
   Mobile="."
End If





sql_precheck =   "SELECT TOP 1 * FROM (select ID MyID, Status  from reservations where BookingID ='"& Booking & "' " &_
                 "UNION select -1 MyID, 'NONE' Status  ) TMP  ORDER BY 1 desc "
                 RSRESULT =  SQLCN.execute(sql_precheck)

                 'MyID = RSRESULT("MyID")
                 'Status = RSRESULT("Status")


            Response.Write "<br>Creating New Reservation "
			Arrival    = "1 aug 1970"
			Departure  = "2 aug 1970"
			Nights     = "1"
			BillTotal  = "0.0"
			Refundable = "CN"
			RoomType   = "single"
			RoomNum    = "999"
			Status     = "INPROGRESS"
			Comment    = "*"
            SQL2 ="exec  dbo.add_Reservation " &_
   								 -1 & ",'" &_
   								 Booking & "','" &_
   								 Source & "','" &_
   								 FirstName & "','" &_
   								 Surname & "','" &_
   								 Address & "','" &_
   								 PostCode & "','" &_
   								 Email & "','" &_
   								 Phone & "','" &_
   								 Mobile     & "','" &_
   								 noOfRooms  & "','" &_
   								 BillTotal  & "'," &_
   								             "'1' , '1' , '1970' , '2' , '2' , '1970' ,'" &_
   								 Nights     & "','" &_
   								 Refundable & "','" &_
   								 Status     & "','" &_
   								 Comment    & "','" &_
   								 GuestRequests & "'," &_
   								  "'Dorm'"



        if isDebug then
        	Response.Write SQL2
        End if

		set RSUPDATE = SQLCN.execute(SQL2)
			'MyID = RSUPDATE("MyID")




        Response.Write "<br>"
        'Response.Write SQL2


        AddId = MyID

        Response.Write "<BR> Booking  : <b> " &  Booking   & " </b> &nbsp; <i>from </i>"     & Source
		Response.Write "<BR> Name     : " &  FirstName &  "   "              &  Surname
		Response.Write "<BR> Mobile   : " &  Mobile    &  "   Email : "      &  Email
        Response.Write "<HR>"


        Response.Write "<HR>"

%>

