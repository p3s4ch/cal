
<%

'AddID = request("AddID")
    
If (AddID <> "" ) Then
    addID = request("addID")
    TaxYear    = request("TaxYear")
    description = request("description")
    formula    = request("formula")
    Total    = request("Total")
    
	if RecordedAmount ="" then RecordedAmount=0 end if 
     
    sql ="exec  [dbo].[addDirectorsAcc2] "   & addID & "," &_
  								         "'" & TaxYear & "'," &_
                                         "'" & description & "'," &_
                                          "'" & formula & "'," &_
                                          Total 							
       
        set RS = SQLCN.execute(sql)
        Response.Write sql
        'Response.End
        Response.Write "<br> ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
