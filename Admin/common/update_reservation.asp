
<%

AddID = trim(request("AddID"))
ID = request("ID")
Booking = request("Booking")
Source = request("Source")
SourceOther = request("SourceOther")
if SourceOther <> "" then Source=SourceOther end if


FirstName =    trim(request("FirstName"))
Surname =    trim(request("Surname"))
Address =    trim(request("Address"))
PostCode =    trim(request("PostCode"))
Email =    trim(request("Email"))
Phone =    trim(request("Phone"))
Mobile =    trim(request("Mobile"))
'Amount = request("Amount")

Arrival = request("Arrival")
Departure = request("Departure")
Nights = request("Nights")
BillTotal = request("Amount To Establishment")
Refundable = request("Cancellation Policy NR = non refundable or CN=Cancellable")

RoomType = request("RoomType")
RoomNum = request("RoomNum")
Status = request("Status")
Comment = request("Comment")


submit = request("submit")
If (submit = "FinalSave" ) Then
       sql_final_save = "update Reservations set Status='"& Status &"' , Comment = '" & Comment & "' where bookingID ='" & booking & "'"
       'Response.Write sql_final_save
       set RSUPDATE2 = SQLCN.execute(sql_final_save)
ELSE
		If (AddID <> "" ) Then
				SQL2 ="exec  dbo.add_Reservation " &_
										 addID & ",'" &_
										 Booking & "','" &_
										 Source & "','" &_
										 FirstName & "','" &_
										 Surname & "','" &_
										 Address & "','" &_
										 PostCode & "','" &_
										 Email & "','" &_
										 Phone & "','" &_
										 Mobile & "','" &_
										 Arrival & "','" &_
										 Departure & "'," &_
										 Nights     & "," &_
										 BillTotal  & ",'" &_
										 Refundable & "','" &_
										 RoomType & "','" &_
										 RoomNum  & "','" &_
										 Status   & "','" &_
										 Comment  & "'"

				Response.Write "<br>"
				'Response.Write SQL2

			   if Surname="" or Arrival="" or Departure="" or Nights="" then
							Response.Write "<BR> <h3> <font color=red>Error Missing Info: </h3>"
							Response.Write "<BR> Surname    =" &  Surname
							Response.Write "<BR> Arrival    =" &  Arrival
							Response.Write "<BR> Departure  =" &  Departure
							Response.Write "<BR> Nights     =" &  Nights
							Response.Write "<br> Add Edit Failed </font>"

				 else
							set RSUPDATE = SQLCN.execute(SQL2)
							'cannot get the MyID i think because this hits many updates
							 Response.Write "<br> Update Successful!. i think please check"
				 end if
				Response.Write "<HR>"

         End If
End If
%>

