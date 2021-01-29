

Comments about this job ::
<%
SQL_FEEDBACK = "select Admin_ID, feedback from dbo.feedback, users where users.id=uid and EventId="& AddID & " order by updated"
Set RS_Feedback = SQLCN.Execute(SQL_FEEDBACK)
WHILE     Not RS_Feedback.EOF
                    prevFeedback = prevFeedback & "<br>" & RS_Feedback("Admin_ID") & " : " & RS_Feedback("feedback")
                    RS_Feedback.MoveNext
WEND

Response.Write prevFeedback
%>

<%
   if prevFeedback <> "" then
%>
&nbsp; delete <br> <br> <br>
<%
   end if
%>

