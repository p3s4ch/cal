
<%

feedbackID = request("feedbackID")
AddID = request("AddID")
eventID = request("eventID")

If (feedbackID <> "" ) Then
      uid = request("uid")
	  EventID = request("EventID")
	  mat_lab = request("mat_lab")
	  CustomerAlreadyPaid = request("CustomerAlreadyPaid")
	  GenerateInvoicePrice = request("GenerateInvoicePrice")

	  if CustomerAlreadyPaid ="" then CustomerAlreadyPaid=0 end if
	  if GenerateInvoicePrice ="" then GenerateInvoicePrice=0 end if

	  sql = "exec [dbo].add_feedback "& uid & " , " & EventID & " ,  '" & mat_lab & "' ," & CustomerAlreadyPaid & " ," & GenerateInvoicePrice
	  Response.Write sql & "<br>"
      set RS = SQLCN.Execute(sql)

      Response.Write "<HR>"
End If
%>
