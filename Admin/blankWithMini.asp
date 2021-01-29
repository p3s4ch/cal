<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\update_payment.asp"-->
<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->


THIS IS A CONTENT PLACEHOLDER with addEditPgLink="Feedback.asp"



<%
    SQL = "select ID id2edit, ID Job, StartTime Date , Details,Confirmed Status , Category   from dbo.[f_most_recent_events] ( 'ALL.NOT_ROOMS' , 2540) "
    addEditPgLink="Feedback.asp"

%>
      <!--#include file="GenericSQLViewerMini.asp"-->


</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
