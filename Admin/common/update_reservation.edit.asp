
<%


AddId = request("AddId")
Booking = request("Booking")
if Booking="" then
    Booking=request("Reservation")
End If

Source = request("Source")
SourceOther = request("SourceOther")
if SourceOther <> "" then Source=SourceOther end if
FirstName =    trim(request("FirstName"))
Surname =    trim(request("Surname"))
Email =    trim(request("Email"))
Mobile =    trim(request("Mobile"))
'Arrival = request("Arrival")
'Departure = request("Departure")

Arrival_iD = request("Arrival_iD")
Arrival_iM = request("Arrival_iM")
Arrival_iY = request("Arrival_iY")

Departure_iD = request("Departure_iD")
Departure_iM = request("Departure_iM")
Departure_iY = request("Departure_iY")

if Arrival_iD="" then Arrival_iD="1" end if
if Arrival_iM="" then Arrival_iM="1" end if
if Arrival_iY="" then Arrival_iY="1970" end if
if Departure_iD="" then Departure_iD="1" end if
if Departure_iM="" then Departure_iM="1" end if
if Departure_iY="" then Departure_iY="2015" end if


Nights = request("Nights")
BillTotal = request("GBP")
Refundable = request("Cancellation Policy NR = non refundable or CN=Cancellable")
NoOfRooms = request("NoOfRooms")
'RoomNum = request("RoomNum")
Status = request("Status")
Comment = request("Comment")
GuestRequests = request("GuestRequests")


if AddId="" then
   AddId="-1"
End If

if Surname="" then
   Surname="."
End If

if Mobile="" then
   Mobile="."
End If


	Response.Write "<BR> Booking  : <b> " &  Booking   & " </b> &nbsp; <i>from </i>"     & Source
	Response.Write "<BR> " &  Arrival    &  " - " & Departure & " total " &  Nights & " nights"
    Response.Write "<BR> Amount To Charge   : " &  BillTotal
    Response.Write "<BR> Refund Policy   : " &  Refundable
    Response.Write "<HR>"

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
   								 BillTotal  & "','" &_

   								 Arrival_iD    & "','" &_
   								 Arrival_iM    & "','" &_
   								 Arrival_iY    & "','" &_
   								 Departure_iD  & "','" &_
   								 Departure_iM  & "','" &_
   								 Departure_iY  & "','" &_
   								 Nights        & "','" &_
   								 Refundable    & "','" &_
   								 Status        & "','" &_
   								 Comment       & "','" &_
   								 GuestRequests & "'," &_
   								  "'Dorm'"

    Response.Write "<HR> SQL2 " & SQL2

    if       Surname="" then
	                Response.Write "<BR> <h3> <font color=red>Error Missing Info: </h3>"
	                Response.Write "<BR> Surname    =" &  Surname
	                Response.Write "<br> Add Edit Failed </font>"
	     else
	   		        set RSUPDATE = SQLCN.execute(SQL2)
                    ' Response.Write "<BR> update done !=" & SQL2
         end if




         Response.Write "<HR>"

%>

