
<%


SearchForNot = request("SearchForNot")
Response.Write "SearchForNot=" & SearchForNot & "<br><br>"


Set RS2 = SQLCN.Execute("select distinct CostCode from Costs where CostCode like '%"& SearchForNot &"%'")

WHILE     Not RS2.EOF
                    Response.Write   RS2("CostCode") & "<br>"
                    RS2.MoveNext
WEND
%>


