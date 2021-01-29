

<%

bttns = request("bttns")
drill_sql = request("drill_sql")

Response.Write drill_sql
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

SQL_SELECT="SELECT id2email , id2print,id2edit , Invoice , Num InvRefNo,   Description , Surname Client , Email , DateOfInvoice ,  Status , InvStatus S_STATUS_hidden "
SQL_SELECT        = "select ID id2edit , Date , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "

SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by DateOfInvoice desc "
SQL_SELECT4EDIT=" select ID, '"& Admin_ID & "' UpdatedBy_hidden , PUN , "
SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden  , '' Payer_Ext , getDate() as AsOfEntryTime_Ext,0 Amount, '' Comment , 'select' Guest "

SQL = "select 'select a report' Eros"
myheader="Invoices"
editPgLink="invoices_add.asp"
addEditPgLink="invoices_add.asp"
tableName="Invoices"
printPgLink="invoice_print.asp"
emailPgLink="pickleChaseByEmail.asp"
emailChaseTable="Invoices"
editSQL=" select * from dbo.vInvoiceInfo where ID="

SQL_SearchFor = " and Description <> 'AnnualInvoiceBucket'  "
If NOT (SearchFor = "") Then
     myheaderExt = "  like : " & SearchFor
     SQL_SearchFor = SQL_SearchFor & " AND (" &_
	" [Invoice] LIKE '%" & SearchFor & "%' or " &_
	" [PUN] LIKE '%" & SearchFor & "%' or " &_
	" [Customer] LIKE '%" & SearchFor & "%' or " &_
	" [DateOfInvoice] LIKE '%" & SearchFor & "%' or " &_
	" [Invoice] LIKE '%" & SearchFor & "%' or " &_
	" [Cats] LIKE '%" & SearchFor & "%' or " &_
	" [Status] LIKE '%" & SearchFor & "%' or " &_
	" [Total+VAT] LIKE '%" & SearchFor & "%'  " &_

	")"
End If


IF filter_on="ChaseALL" THEN
   myheader="Invoices To Chase"
   SQL = " select TOP 8 *  from dbo.vInvoices where not [Status] in ('Paid','Cancelled','Blank') " & SQL_SearchFor &"  order by DateOfInvoice desc"

End IF


IF filter_on="latest_invoices" THEN
   myheader="The 20 Latest Invoices"
   SQL = "select  ID id2email , ID id2print, ID id2edit ,  Description  from dbo.Invoices where not [Status] in ('Cancelled','Blank') and Description <> 'AnnualInvoiceBucket' order by DateOfInvoice desc"
End IF

IF filter_on="search_invoices" THEN
   myheader="Invoices Found" & myheaderExt
     SQL = " select * from dbo.vInvoices where not [Status] in ('Blank') and Description <> 'AnnualInvoiceBucket' "& SQL_SearchFor &" order by DateOfInvoice desc"
End IF


IF filter_on="search_customers" THEN
   myheader="rather use All.Buttons filter_on=search_customers"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="Customers"

   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden , PUN [Pickle Unique Name], CATS [Category Of Service - CATS], Title, FirstName, Surname,  Address ,Postcode, Email, Phone, Mobile, ReqInv, HeardAboutUs, Comment OfficeUseOnly   FROM Customers where ID="
   SQL = "select ID id2edit, ID Num, PUN, CATS,  FirstName, Surname, Postcode, Email, Phone, Mobile from Customers where Surname like '%" & SearchFor &"%' OR FirstName like '%" & SearchFor &"%' order by Surname"
End IF

IF filter_on="DRILL" THEN
   myheader="Customers Found"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="Customers"


   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden , PUN [Pickle Unique Name], CATS [Category Of Service - CATS], Title, FirstName, Surname,  Address ,Postcode, Email, Phone, Mobile, ReqInv, HeardAboutUs, Comment OfficeUseOnly   FROM Customers where ID="

   drill_sql = request("drill_sql")
   c1 = request("c1")
   c1_val=request("c1_val")
   if drill_sql ="" then
        SQL = "select * from dbo.vDrillInvoices"
  else
       SQL ="select * from " & drill_sql & " where "& c1 &"='"& c1_val &"'"

   End IF
End IF


IF filter_on="Action_Required_RaiseInvoice" THEN

   editPgLink="feedback.asp"

   ShowAll = request("ShowAll")
   checkedNo =""
   checkedYes =""
   IF ShowAll = "NO" THEN
      checkedNo="checked"
      sqlWhere2 = " Where Surname not like '%Test%' "
      ELSE
       checkedYes ="checked"
   END IF
   myheader="The following Events or Jobs Require an Invoice !"

   SQL = "select * from dbo.prep2InvoiceEvents" & sqlWhere2
   Response.Write SQL
End IF


IF filter_on="InvoicesEvents" THEN
   InvoiceID = request("InvoiceID")
   myheader="The following Jobs relate to Invoice #"  & InvoiceID
   addEditPgLink="events_add.asp"
   editPgLink="events_add.asp"
   SQL = "select * from  dbo.vInvoiceEvents where Invoice =  "  & InvoiceID
End IF



IF filter_on="search_events" THEN
   searchFor = request("searchFor")
   myheader="The following Jobs relate to  #"  & searchFor
   addEditPgLink="events_add.asp"
   editPgLink="events_add.asp"

   SQL = "select StartTime ,  Details ,Category, CatB, CustomerID Cus , Client_PUN [PUN],  BillTotal  [InclVAT]  from  dbo.cEvents where CustomerID =  "  & searchFor
End IF

IF filter_on="search_eventsStrings" THEN
   searchFor = request("searchFor")
   myheader="The following Jobs relate to  #"  & searchFor
   addEditPgLink="events_add.asp"
   editPgLink="Feedback.asp"

   SQL = "select ID id2edit, StartTime ,  Details ,Category, CatB, CustomerID Cus , Client_PUN [PUN],  BillTotal  [InclVAT]  from  dbo.cEvents where  Confirmed='" & searchFor & "'" & " order by StartTime desc"
End IF



IF filter_on="FindInvoiceByCustomer" THEN
   CustomerID = request("CustomerID")
   myheader="All Invoices for Customer " &  CustomerID
   addEditPgLink="Invoices_add.asp"
   printPgLink="invoice_print.asp"
   editPgLink="Invoices_add.asp"
   emailPgLink="pickleChaseByEmail.asp"
   SQL = "select * from  dbo.vInvoices where Customer =  "  & CustomerID & " order by DateOfInvoice desc"
End IF


IF filter_on="FindInvoiceByEvent" THEN
   EventID = request("EventID")
   myheader="The Event ID is included in the following Invoices"
   addEditPgLink="events_add.asp"
   editPgLink="events_add.asp"
   SQL = "select * from  dbo.vInvoiceEvents where Job =  "  & EventID
End IF




IF filter_on="ALL" THEN
   SQL_WHERE2 = " AND InvStatus not in ('Cancelled') AND Description not like '%InvoiceBucket%' "
   SQL = "select * from vInvoices " & SQL_WhereBetween & SQL_WHERE2 & SQL_ORDERBY
End IF



spacing = "&nbsp; &nbsp; &nbsp; "

%>
<h1> Eros - The Invoice Tool.. </h1>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="filter_on" value="ChaseALL" /> <%=spacing%>
<input type="submit" name="Submit" value="Chase All Payments " class="inputSubmit">
</form>

</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="filter_on" value="latest_invoices" /> <%=spacing%>
<input type="submit" name="Submit" value="Latest Invoices " class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="filter_on" value="DRILL" /> <%=spacing%>
<input type="submit" name="Submit" value="Unpaid Customers " class="inputSubmit">
</form>
</TD>
</TR>
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="search_invoices" /> <%=spacing%>
Invoice(s) like
<input type="text"   name="searchFor" value="" />
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="All.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="search_customers" /> <%=spacing%>
...  or Customer(s) like
<input type="text"   name="searchFor" value="" />
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>

</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="search_events" /> <%=spacing%>
...  All Events / Jobs  By Number
<input type="text"   name="searchFor" value="" />
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="search_eventsStrings" /> <%=spacing%>
...  All Events / Jobs  like
<input type="text"   name="searchFor" value="" />
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>

</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="search_eventsStrings" /> <%=spacing%>
...  All Events / Jobs  that Require Feedback
<input type="hidden"   name="searchFor" value="RequiresFeedback" />
<input type="submit" name="Submit" value="Show" class="inputSubmit">
</form>
</TD>
</TR>



<TR><TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="InvoicesEvents" /> <%=spacing%>
<input type="text"   name="InvoiceID" value="" />
<input type="submit" name="Submit" value="Show Events for this Invoice" class="inputSubmit">
</form>
</TD></TR>

<TR><TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="FindInvoiceByEvent" /> <%=spacing%>
<input type="text"   name="EventID" value="" />
<input type="submit" name="Submit" value="Find Invoice(s) for this Event or Job" class="inputSubmit">
</form>
</TD></TR>

<TR><TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Invoice.Buttons" />
<input type="hidden" name="myheader" value="Invoices" />
<input type="hidden" name="filter_on" value="FindInvoiceByCustomer" /> <%=spacing%>
<input type="text"   name="CustomerID" value="" />
<input type="submit" name="Submit" value="All Invoices for this Customer" class="inputSubmit">
</form>
</TD></TR>



<TR><TD>
<form action="CreateInvoices.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="loopAll" value="no" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="CreateInvoicesFromEventsByCustomerID" class="inputSubmit">
<input type="text" name="CustomerID" class="inputbox" size="10" maxlength="255">
</form>
</TD></TR>

<TR><TD>
<form action="CreateInvoices.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="loopAll" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="[CreateInvoicesFromEventsByCustomerID_LoopAll]" class="inputSubmit">
</form>
</TD></TR>

<TR><TD>
<form action="CleanInvoice.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="[CleanInvoice]" class="inputSubmit">
<input type="text" name="InvoiceID" class="inputbox" size="10" maxlength="255">
</form>
</TD></TR>

<TR>
<td><form action="GSE5.asp"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="dbo.PayInvoice " >
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="hidden" name="NoOfPMs" value="1" > InvoiceID:
<input type="submit" name="Submit" value="Mark Invoice as PAID (Invoice ID):" class="inputSubmit">
<input type="text"   name="pm0"      class="inputbox" size="10" maxlength="255">
</form></td>
</TR>



<TR><TD>
<form action="invoices_add.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value="<%=uid%>" ><%=spacing%>
<input type="hidden" name="sv" value="HM"     ><%=spacing%>
<input type="submit" name="Submit" value="Add New - Handyman,HM" class="inputSubmit">

</form>
</TD></TR>

</Table>


<%
IF filter_on="ALL_INVOICES" THEN
   myheader="All Invoices !"
   incl_blank = request("incl_blank")
   incl_cancelled = request("incl_cancelled")
   incl_paid = request("incl_paid")
   incl_unpaid = request("incl_unpaid")


   sql_status_in = " AND InvStatus  in ( 'NONE'  "
   if incl_blank <> "" then
                sql_status_in = sql_status_in & " ,'Blank' "
                incl_blank_isCked = "checked"
   end if
   if incl_cancelled <> "" then
                 sql_status_in = sql_status_in & " ,'Cancelled' "
                 incl_cancelled_isCked = "checked"
   end if
   if incl_paid <> "" then
               sql_status_in = sql_status_in & " ,'Paid' "
               incl_paid_isCked = "checked"
   end if
   if incl_unpaid <> "" then
             sql_status_in = sql_status_in & " ,'Unpaid' "
             incl_unpaid_isCked = "checked"
   end if

   sql_status_in = sql_status_in &  ")"
   SQL = "select * from vInvoices " & SQL_WhereBetween & sql_status_in &  " order by dateOfInvoice "
End IF
%>

<DIV ALIGN=center>
<form action="?" name="frmUser" Method="GET">
	<input type="hidden" name="filter_on" value="ALL" />
	Include:  <input type="checkbox" name="incl_blank" value="Blank" <%=incl_blank_isCked%>             />  Blanks
			  <input type="checkbox" name="incl_cancelled" value="Cancelled" <%=incl_cancelled_isCked%> />  Cancelled
		      <input type="checkbox" name="incl_paid" value="incl_paid" <%=incl_paid_isCked%>           />    Paid
	          <input type="checkbox" name="incl_unpaid" value="incl_unpaid" <%=incl_unpaid_isCked%>     />    Unpaid

	<!--#include file="searchGSBetweenDates_NoForm.asp"-->
	<input type="submit" value="Show" class="inputSubmit">
</form>
</DIV>