
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
		Arrival = request("Arrival")
		Departure = request("Departure")
		Nights = request("Nights")
		BillTotal = request("Amount To Establishment")
		Refundable = request("Cancellation Policy NR = non refundable or CN=Cancellable")



		Status = request("Status")
		Comment = request("Comment")
		GuestRequests = request("GuestRequests")


        noOfRooms = trim(request("Number of Rooms"))
        if noOfRooms="" then
			noOfRooms = trim(request("noOfRooms"))
		End If
        if noOfRooms="" then
					Response.Write "<BR> Error : noOfRooms cannot be empty"
					Response.End
		End If

	   if Surname="" then
		   Surname="."
		End If

		if Mobile="" then
		   Mobile="."
		End If

                if AddId ="" then
			   AddId ="-1"
		End If



       Response.Write "<BR> Booking  : <b> " &  Booking   & " </b> &nbsp; <i>from </i>"     & Source
       Response.Write "<BR> " &  Arrival    &  " - " & Departure & " total " &  Nights & " nights"
       Response.Write "<BR> Amount To Charge   : " &  BillTotal
       Response.Write "<BR> Policy   : " &  Policy
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
						 Mobile & "','" &_
						 Arrival & "','" &_
						 Departure & "'," &_
						 Nights     & "," &_
						 BillTotal  & ",'" &_
						 Refundable & "'," &_
						 noOfRooms & ",'" &_
						 Status   & "','" &_
						 Comment  & "','" &_
   						 GuestRequests & "'"



       Response.Write "<HR>" & SQL2

       if Surname="" or Arrival="" or Departure="" or Nights="" then
	                Response.Write "<BR> <h3> <font color=red>Error Missing Info: </h3>"
	                Response.Write "<BR> Surname    =" &  Surname
	                Response.Write "<BR> Arrival    =" &  Arrival
	                Response.Write "<BR> Departure  =" &  Departure
	                Response.Write "<BR> Nights     =" &  Nights
	                Response.Write "<br> Add Edit Failed </font>"

	     else
	   		        set RSUPDATE = SQLCN.execute(SQL2)
                    'Response.Write "<BR> update done !=" & SQL2
         end if



%>

