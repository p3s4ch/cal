<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<%
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open dsn
SQL = "DELETE FROM Events WHERE ID LIKE ('%" & request.querystring("ID") & "%')"
Set RS = Conn.Execute(SQL)
%>
<br>
The Item has been removed.
</tr></table>
<!--#include file="common\copyright.asp"-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->

