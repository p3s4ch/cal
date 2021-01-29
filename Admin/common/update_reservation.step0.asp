
<%


ID = "-1"
Booking = trim(request("Booking"))

Source = request("Source")
SourceOther = request("SourceOther")
if SourceOther <> "" then Source=SourceOther end if

sql_precheck =   "SELECT TOP 1 * FROM (select ID MyID, Status  from reservations where BookingID ='"& Booking & "' " &_
                 "UNION select -1 MyID, 'NONE' Status  ) TMP  ORDER BY 1 desc "
				 Response.Write sql_precheck
                 RSRESULT =  SQLCN.execute(sql_precheck)
                 MyID = RSRESULT("MyID")
                 Status = RSRESULT("Status")


if Status = "NONE" then
            Response.Write "<br>Now Creating New Reservation "
			SQL2 ="exec [dbo].[add_ReservationIfNew] '" & Booking & "'"

            Response.Write SQL2
			set RSUPDATE = SQLCN.execute(SQL2)
			'MyID = RSUPDATE("MyID")

else
           Response.Write "<br> <font color=RED >   <b> Warning ! This Reservation Already Exists  </b> </font>  "
           Response.Write "<br> <font color=RED >   Please check if payment has already been made and other details below </font>  "
end if


        Response.Write "<br>"
        'Response.Write SQL2


        AddId = MyID

        Response.Write "<BR> Booking  : <b> " &  Booking   & " </b> &nbsp; <i>from </i>"     & Source
		Response.Write "<BR> Name     : " &  FirstName &  "   "              &  Surname
		Response.Write "<BR> Mobile   : " &  Mobile    &  "   Email : "      &  Email
        Response.Write "<HR>"


        Response.Write "<HR>"

%>

