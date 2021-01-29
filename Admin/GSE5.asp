<!--not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<%
    sql = request("mysql")
    NoOfPMs = request("NoOfPMs")
    Response.Write  "GSE5.asp version 1.1 <br>"

	'sql = "exec dbo.allocateRoomsOffice 000 "


    pm0= request("pm0")

    Response.Write  "pm0 = " & pm0  & "<br>"
    Response.Write  "sql = " & sql  & "<br>"


    if NoOfPMs > 1 then
	   pm1=      ",'" & replace(trim(request("pm1")),"'","")       & "'"
	End IF

    IF NoOfPMs > 2 then
        pm2=     ",'" & replace(trim(request("pm2")),"'","")  & "'"
    End IF

    IF NoOfPMs > 3 then
	     pm3=  ",'" & replace(trim(request("pm3")),"'","")    & "'"
    End IF

    IF NoOfPMs > 4 then
	        pm4= ",'" & replace(trim(request("pm4")),"'","")   & "'"
    End IF

    if NoOfPMs > 5 then
		   pm5= ",'" & replace(trim(request("pm5")),"'","")   & "'"
    End IF



    sql = sql & pm0 & pm1 & pm2 & pm3 & pm4 & pm5 & pm6


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
