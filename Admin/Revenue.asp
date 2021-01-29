<!-- REMOVED loggedin.asp -->
<!--#include file="dsn.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<h2 ALIGN=CENTER>Receipts Not Normally Viewed on their own</h2>


<%
tableName = "Revenue"
uid=request("uid")
InvoiceID=request("InvoiceID")
%>

<!--#include file="common\generic_delete.asp"-->
<!--#include file="common\update_revenue.asp"-->

<%

     Response.Redirect "invoices_add.asp?uid="&uid&"&ID="&InvoiceID

%>
