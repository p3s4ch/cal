
<%

AddID = request("AddID")


If (AddID <> "" ) Then
    period=request("period")
    dueDate=request("dueDate")
    due =request("vatDue_box1")
    Reclaimed_bx4  =request("vatReclaimed_box4")
    salesExcl_box6 =request("salesExcl_box6")
    purchasesExcl_box7  =request("purchasesExcl_box7")
    Comment   =request("Comment")

    dummy =0


	cDt =  CDate(dueDate)
	sqlDate  ="'" & Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt) &"'"

    Response.Write "periodID =" &  periodID &"<br>"
    Response.Write "due =" &  due &"<br>"
    Response.Write "Reclaimed_bx4 =" &  Reclaimed_bx4 &"<br>"
    Response.Write "salesExcl_box6 =" &  salesExcl_box6 &"<br>"
    Response.Write "purchasesExcl_box7 =" &  purchasesExcl_box7 &"<br>"

    Response.Write "sqlDate =" &  sqlDate &"<br>"
    Response.Write "Comment =" &  Comment &"<br>"

    sql ="exec  [dbo].[add_dbo.VAT] "   & AddID & "," &_
  								 period & "," &_

  								 due & "," &_
  								 Reclaimed_bx4 & "," &_

  								 salesExcl_box6 & "," &_
  								 purchasesExcl_box7 & "," &_
  								 "'" & comment & "'"

        Response.Write sql
        set RS = SQLCN.execute(sql)
        Response.Write "<br> ID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
