<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%

    Response.Write " UpdateCostCodes <br>"
    sql = "exec [dbo].[UpdateCostCodes]"
    Response.Write sql & "<br>"
    set RS = SQLCN.Execute(sql)


    Response.Write " FindMyInvoices and update Costs table with sale Invoice <br>"
	sql = "exec [dbo].[FindMyInvoices]"
    Response.Write sql & "<br>"
    set RS = SQLCN.Execute(sql)




    Response.Write " ImportCosts2Sales i.e. Revenue<br>"
	sql = "exec [dbo].[ImportCosts2Sales]"
    Response.Write sql & "<br>"
    set RS = SQLCN.Execute(sql)



    Response.Write " dbo.CreateInvoices i.e. those from bank without invoices <br>"
	sql = "exec dbo.CreateInvoices"
	Response.Write sql & "<br>"
	set RS = SQLCN.Execute(sql)





%>





</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
