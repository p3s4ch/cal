



<%
'EndTime = request("EndTime")
'BeginTime = request("BeginTime")
'StartTime = betweenFrom & " " & BeginTime
'EndTime    = betweenFrom & " " & EndTime

'Response.Write "<br>StartTime = " & StartTime
'Response.Write "<br>EndTime = "   & EndTime

AddID = request("AddID")
If (AddID <> "" ) Then
		EndTime = request("EndTime")
		BeginTime = request("BeginTime")
		StartTime = betweenFrom & " " & BeginTime
		EndTime    = betweenFrom & " " & EndTime

		Details = trim(request("Details"))

		groupID = request("groupID")
		DeleteID = request("DeleteID")

		Operator = request("Operator")
		Category = trim(request("Category"))
		Color = trim(request("Color"))

		if groupID ="" then groupID     = 0 end if
		if AddID ="" then AddID     = -1 end if
		if Category0 ="" then Category0="Note" end if
		if Color0 ="" then Color0     ="yellow" end if


		   duration = trim(request("Duration Hours"))
		   TaskDetails = trim(request("Task Details"))
	   	   Category = trim(request("Category_hidden"))
	   	   AllDay = trim(request("AllDay_hidden"))
	   	   CatB= trim(request("CatB_hidden"))
	   	   CustomerID = trim(request("CustomerID_hidden"))
	   	   Office = trim(request("Office_hidden"))
	   	   BillTotal = trim(request("BillTotal"))
	   	   SiteAddress = trim(request("SiteAddress_hidden"))
	   	   SitePostCode = trim(request("SitePostCode_hidden"))
	   	   SameAsBill = trim(request("SameAsBill_hidden"))
	   	   Color = trim(request("Color_hidden"))
	   	   Operator = trim(request("Operator_hidden"))
	       status = trim(request("status_hidden"))
           duration = trim(request("Duration Hours"))

        sql_update="exec [dbo].[addEventTimesheet] "& addID & ",'" &_
  								   StartTime & "','" &_
                                   EndTime & "','" &_
                                   Details & "','" &_
                                   Category & "'," &_
								   AllDay & "," &_
                                   CatB & "," &_
								   CustomerID& ",'" &_
                                   Office & "'," &_
								   BillTotal & ",'" &_
								   SiteAddress & "','" &_
								   SitePostCode & "'," &_
								   SameAsBill & ",'" &_
								   Color & "','" &_
								   Operator & "','" &_
								   status & "'," &_
			                       duration

        'Response.Write sql_update

		set RS = SQLCN.execute(sql_update)
        MyID=RS("MyID")
		Response.Write "<HR> updated ID="& MyID
End If
%>








