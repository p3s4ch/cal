<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->





<%



    loopAll = request("loopAll")
    DeleteID = request("DeleteID")
    AddID = request("AddID")
    CustomerID = request("CustomerID")

    sql = ""
    if loopAll = "yes" then
      sql="exec dbo.CreateInvoicesFromEventsByCustomerID_LoopAll"
    else
      if CustomerID <> "" then
         sql="exec dbo.CreateInvoicesFromEventsByCustomerID "  & CustomerID
      End if
    End if


    Response.Write sql & "<br>"
    set RS = SQLCN.Execute(sql)


%>

<b>Done</b>



</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
