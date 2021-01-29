



<%

bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

if CustomerID > 0 then
	   SQL_whereCus= " AND CustomerID =" & CustomerID
	   isCustomer = 1
	else
	   isCustomer = 0
	end if


Response.Write "CustomerID="&CustomerID
thedatefield = "dateOfInvoice"
%>

<!--#include file="searchBetween.extract.asp"-->

<%


addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="Invoices"

SQL_SELECT ="select Invoice2pay_Ext, Invoice, replace(Description,'MYUID', '" & uid & "') Jobs, dateOfInvoice Date, [Total+VAT] [Total+VAT &pound;] , [Status]"
SQL_SELECT4ADD= " NA "
SQL_SELECT4EDIT=" NA "
editSQL=SQL_SELECT4EDIT & " Customer Cannot Edit"

payViewPgLink = "invoice_print.asp"
SQL_WhereBetween = " AND [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_SearchFor = " "
If NOT (SearchFor = "") Then
     SQL_SearchFor = SQL_SearchFor & " AND (" &_
	" [Invoice] LIKE '%" & SearchFor & "%' or " &_
	" [Description] LIKE '%" & SearchFor & "%' or " &_
	" [Total+VAT] LIKE '%" & SearchFor & "%' or " &_
	" [Status] LIKE '%" & SearchFor & "%' " &_

	")"
End If


SQL_Excludes = " InvStatus not in ('Cancelled','Blank') "
SQL_Where = " WHERE " & SQL_Excludes & SQL_SearchFor & SQL_WhereBetween & SQL_whereCus

SqlorderBy="  order by dateOfInvoice desc "

SQL= SQL_SELECT & " From dbo.vInvoices4Customer" & SQL_Where & SqlorderBy
mysql = SQL
spacing = "&nbsp; &nbsp; &nbsp; "
payViewPgLink = "invoice_print.asp"

%>


<form action="?" Method="GET">
   <br>
     <input type="hidden"   name="tableName"   value="vInvoices" />
     <!--#include file="searchGSBetweenDates5.asp"-->
</form>

