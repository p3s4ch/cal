<!--#include file="common/SQL_Cn.asp"-->

<table border="0" cellpadding="3" cellspacing="0" align="center">

<%
Set RS = SQLCN.Execute("exec pCosts '1 jan 2008', '30 apr 2008'")
'Set RS = SQLCN.Execute("SELECT * FROM payment")

WHILE     Not RS.EOF
                    Response.Write  "<tr>  <td> " & RS("FINES") & "</td> </tr>"
                    RS.MoveNext
WEND 
%>

</table>
