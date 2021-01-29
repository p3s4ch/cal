<%
'Response.Write  "AddID="& AddID

orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")

if Submit ="Delete" then
	DeleteID = AddID
	AddID =""
end if


If (DeleteID <> "") Then
  SQL = "DELETE FROM cEvents WHERE ID = " & DeleteID
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted ID = " & DeleteID
End If



If (AddID <> "") Then
	    'Response.Write "Edit ID " & AddID


		StartDate = request("StartDate")
		StartHour = request("StartHour")
		EndDate = request("EndDate")
		EndHour = request("EndHour")
		Title = request("Title")
		Details = request("Details")
		Assigned = request("Assigned")
		Category = request("Category")
        Operator = request("Operator")
		AllDay =request("AllDayEvent")
		'CatA = request("CatA")
		CatB = request("CatB")
		CustomerID = request("CustomerID")
		Office = request("Office")
		Email    = request("Email")
		SiteAddress   = request("Address")
		SitePostCode  = request("PostCode")
		SameAsBill  = request("SameAsBill")
		Phone    = request("Phone")
		BillTotal = request("BillTotal")
		if BillTotal = "" then BillTotal=0 end if

		if CustomerID      = "" then CustomerID =0 end if

		if SameAsBill      = "" then
                          SameAsBill =0
			   ELSE
					  Response.Write "<br> SameAsBill "

					 sql_2 = "select * from Customers where ID = " &   CustomerID
					 Set RSCustomer = SQLCN.Execute(sql_2 )

					 'Response.Write "<br>  sql_2" & sql_2
					 SiteAddress = RSCustomer("Address")
					 SitePostCode =RSCustomer("PostCode")
					 'Response.Write "<br> SameAsBill done "& SiteAddress
			   end if



	x= StartDate & " " & StartHour
	z= EndDate & " " & EndHour
	cDtStart =  CDate(x)
	cDtEnd   =  CDate(z)
	StartTime =Month(cDtStart) & "/" & Day(cDtStart)& "/" &Year(cDtStart)& " " & StartHour
	Endtime   =Month(cDtEnd) & "/" & Day(cDtEnd)& "/" &Year(cDtEnd)& " " & EndHour

	StartTime  	="'" & StartTime 	&"'"
	EndTime    	="'" & EndTime		&"'"
	Title  		="'" & Title  		&"'"
	Details 		="'" & Details		&"'"
	Category      ="'" & Category 	&"'"
	Office        ="'" & Office    	&"'"
	SiteAddress   ="'" & SiteAddress 	&"'"
	SitePostCode 	="'" & SitePostCode &"'"
	Color 		="'" & Color  		&"'"
	Operator 		="'" & Operator		&"'"

    if AllDay = "" then AllDay =0 end if
    if CatB = "" then CatB =0 end if
    if CustomerID = "" then CustomerID =0 end if
    if BillTotal = "" then BillTotal =0 end if
    if SameAsBill = "" then SameAsBill =0 end if
    if siteID = "" then siteID =0 end if
    if GroupID = "" then GroupID =0 end if


	sql="exec addEvent " & AddID & "," & StartTime    & "," & EndTime    & "," & Title  & "," & Details &_
	  				       "," & Category    & "," & AllDay     & "," & CatB   & "," & CustomerID &_
	  				       "," & Office      & "," & BillTotal  & "," & SiteAddress  & "," & SitePostCode &_
	  				       "," & SameAsBill  & "," & siteID     & "," & GroupID 	 & "," & Color & "," & Operator

    'Response.Write "<br>"
    'Response.Write sql
    'Response.Write "<br>"

     Set RS = SQLCN.Execute(sql)
     Set RS2 = SQLCN.Execute("select  * from ProcResult")
	 WHILE  Not RS2.EOF
             color = "green"
             id = RS2("ID")
             if id = -1 then color = "red" end if

             Response.Write  "<h3><br> <font color="&color& "><b>"

             Response.Write  "Please check Booking Details: <br>"
             Response.Write   "From:" & WeekdayName(Weekday(cDtStart))&" " & Day(cDtStart)&  "/"& Month(cDtStart) & "/" & Year(cDtStart)& " at " & StartHour    & "<br> "
             Response.Write   Operator & "  " & Category & "<br>"
             Response.Write   "£" & BillTotal & "</font><br>"
             Response.Write  "Please make a note of your booking number # "& id &"<br>"& Operator &" "& RS2("comment") & "</h3></b></font>"
             Response.Write  "<a href=events_add.asp?AddID=" &id &"><font color=red>click here to make correction</font></a>"
             RS2.MoveNext
     WEND

    iDay=Day(cDtStart)
    iMonth=Month(cDtStart)
    iYear=Year(cDtStart)

Else

	iDay=request("iDay")
	iMonth= request("iMonth")
	iYear = request("iYear")

End If

%>
