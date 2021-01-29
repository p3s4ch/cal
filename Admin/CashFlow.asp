<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<h2 ALIGN=CENTER>Cash Flow Summary Year Ending 30 April 2010</h2>

<!--#include file="common\ExtractDates.asp"-->
<%
SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_WhereBetween2 = " where [DateReceived] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_WhereBetween3 = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "


Response.Write "<br><b>Opening Balance on 1 may 2009  (carried from 30/4/2009) &nbsp;&pound; 1661.65 <b><br>"
Response.Write "<b>Closing Balance 30 Apr 2010    (opening for  1/5/2010) &nbsp;&pound;   431.79 <b><br>"


SQL_tot  =  "select IsNull(sum(IsNull(Amount,0)),0)  as tot from dbo.HSBC_BIB " &  SQL_WhereBetween3
Set RS_TOT = SQLCN.Execute(SQL_tot)
tot1 = FormatNumber(RS_TOT("tot"), 2)
Response.Write "<br>[1]<b>Net movement on bank &nbsp;&pound; " & tot1 & "<b><br>"

SQL_tot  =  "select IsNull(sum(IsNull(TotalInclVAT,0)),0)  as tot from dbo.vInvoicesMartin " &  SQL_WhereBetween
Set RS_TOT = SQLCN.Execute(SQL_tot)
tot = FormatNumber(RS_TOT("tot"), 2)
Response.Write "<br><b>[Total Invoices Incl VAT For This Period &nbsp;&pound;" & tot & "]<b><br>"


SQL_tot  =  "select IsNull(sum(IsNull(Amount,0)),0)  as tot from dbo.Revenue " &  SQL_WhereBetween2
Set RS_TOT = SQLCN.Execute(SQL_tot)
tot2 = FormatNumber(RS_TOT("tot"), 2)
Response.Write "<br><b>[2] Total Sales Received Incl VAT For This Period &nbsp;&pound;" & tot2 & "<b><br>"

SQL_tot  =  "select IsNull(sum(IsNull(Total,0)),0)  as tot from Costs " &  SQL_WhereBetween3 & " AND CostCode <> 'DIRECTOR' AND CostCode NOT LIKE '%~%' "
Set RS_TOT = SQLCN.Execute(SQL_tot)
tot3 = FormatNumber(RS_TOT("tot"), 2)
Response.Write "<br><b>[3]**Total Net Payments made for this Period including ALL Debt Repayments and TAX &nbsp;&pound;" & tot3 & "<b><br>"

Response.Write "<br> ** This amount excludes CASH WITHDRAW, DIRECTOR DEPOSITS and BUSINESS CREDIT CARD payments <br>"


Response.Write "<br> [1]+[3]-[2] Director Net investment into Business   &nbsp;&pound; " &  FormatNumber( -1229.86 + tot3 - tot2  , 2)  & " plus Rental of Business Premises <br>"
'Response.Write "<br> [1]+[3]-[2] Director Net investment into Business   &nbsp;&pound; " &  FormatNumber( x + y  , 2)  & " plus Rental of Business Premises<br>"

%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>
<td width="100%"><font face="Verdana" size="1"><br>



</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
