<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%

myheader = request("myheader")
actionPage = request("actionPage")
sql = request("mysql")
AddID = request("ID")
tableName = request("tableName")
procName=request("procName")
paramX=request("paramX")

If (actionPage = "") Then
             actionPage ="GSAdd5.update.asp"
end if

Response.Write actionPage
Response.Write "sql["& sql &"]"

%>

<br><br>&nbsp; &nbsp;&nbsp;&nbsp; <b> <%=myheader%>  </b>





<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
