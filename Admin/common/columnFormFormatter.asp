

<%

isOverride=false
isHidden=false


isReservationPaymentStatus =false
isADateType =false
isAnID=false
isCostCode=false
isPayment=false

isSource=false
isLodger=false
isPayerHidden=false
isProjectDetails=false
isRoomType=false
isComment=false
isEntryDate=false
isAGuest=false
isStaffTransfer=false
isFlexCommentA=false
isPUN=false
isOperator=false
isAgentAccNoOther=false
isCats=false
isJobBoard=false

make_readonly =""

if InStr(x.Name,"_READ_ONLY") > 0 then
          make_readonly ="readonly"
          else isOverride=false end if

if InStr(x.Name,"_Ext") > 0 then isOverride =true else isOverride=false end if
if InStr(x.Name,"_hidden") > 0 then isHidden =true else isHidden=false end if
if InStr(x.Name,"FlexCommnt") > 0 then isFlexCommentA =true else isFlexCommentA=false end if


if InStr(x.Name,"Operator") > 0 then isOperator =true else isOperator=false end if
if InStr(x.Name,"Cats") > 0 then isCats =true else isCats=false end if
if InStr(x.Name,"PUN") > 0 then isPUN =true else isPUN=false end if
if InStr(x.Name,"LoginAsThem") > 0 then isOverride =true end if
if InStr(x.Name,"StaffTransfer") > 0 then isStaffTransfer =true else isStaffTransfer=false end if
if InStr(x.Name,"JobBoard") > 0 then isJobBoard =true else isJobBoard=false end if

if (InStr(x.Name,"Guest")> 0 ) AND Not (InStr(x.Name,"GuestRequest") > 0)  then isAGuest =true else isAGuest=false end if
if InStr(x.Name,"EntryDate") > 0 then isEntryDate =true else isEntryDate=false end if
if InStr(x.Name,"Comment") > 0 then isComment =true else isComment=false end if
if InStr(x.Name,"PaymentStatus") > 0 then isReservationPaymentStatus =true else isReservationPaymentStatus=false end if
if InStr(x.Name,"RoomType") > 0 then isRoomType =true else isRoomType=false end if
if InStr(x.Name,"ProjectDetails") > 0 then isProjectDetails =true else isProjectDetails=false end if
if InStr(x.Name,"P_ayerHidden")  > 0 then isPayerHidden =true else isPayerHidden=false end if
if InStr(x.Name,"Source")  > 0 then isSource =true else isSource=false end if

if InStr(x.Name,"AgentAccNoOther")  > 0 then isAgentAccNoOther =true else isAgentAccNoOther=false end if

if (InStr(x.Name,"Lodger") > 0)  then isLodger =true else isLodger=false end if
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if

if (InStr(x.Name,"ID") > 0) AND Not (InStr(x.Name,"Admin_ID") > 0 )  then isAnID =true else isAnID=false end if
if (InStr(x.Name,"ChequeNo") > 0)  then isAnID =false end if

'if (InStr(x.Name,"Payment") > 0)  then isPayment =true else isPayment=false end if
%>


<!--#include file="ColumnFormFormatterOverrides.asp"-->

<%
if isComment then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="text"  name="<%=x.Name%>" value="<%=x.Value%>" class="inputbox" size="100" maxlength="555"> </td>
  </td>
</tr>
<%
end if

if isFlexCommentA then
%>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> Comment </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" ><textarea name="Comment" class="inputbox" cols="80" rows="40" ><%=x.Value%> </textarea></td>
</tr>
<%
end if



if isAnID AND Not isHidden AND Not isOverride then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="text" name="<%=x.Name%>" value="<%=AddID%>" size="8" maxlength="255" readonly disabled >
  </td>
</tr>
<%
end if

if isADateType then
   d= x.Value
   'Response.Write "d= "& d
   if trim(d) = "1/1/2005" then   d = Date() end if
 %>
<tr>
<td bgcolor="<%=clr%>" ><font face="Verdana" size="1" color="48576C"><b>Date </b></font></td>
<td bgcolor="<%=clr%>" ></td>
<td bgcolor="<%=clr%>" >

	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="asofdate" id="Text1" maxlength="10" size="8" value=<%=d%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=asofdate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>
</tr>

<%
end if

if isSource then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Source</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="Source" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Source from reservations order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Source") = RS_CC("Source") then
	                        %>
		                        <option value="<%=RS_CC("Source")%>" selected><%=RS_CC("Source")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Source")%>"><%=RS_CC("Source")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="SourceOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<%
end if


if isRoomType then
val = RS(x.Name)
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%></b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="<%=x.Name%>" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct RoomType from dbo.Rooms order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS(x.Name) = RS_CC("RoomType") then
	                        %>
		                        <option value="<%=RS_CC("RoomType")%>" selected><%=RS_CC("RoomType")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("RoomType")%>"><%=RS_CC("RoomType")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
  </td>
</tr>
<%
end if


if isAGuest then
  SQL_DropDown="select distinct Booking dropDown from vReservations order by Booking"
  fieldThis="Guest"
  fieldOther="GuestOther"
  selectedValue = trim(RS("Guest"))
 %>

       <!--#include file="thisOrOther.asp"-->

 <%
  end if


if isJobBoard then
  SQL_DropDown="select distinct Board dropDown from dbo.Recruiters"
  fieldThis="Board"
  fieldOther="BoardOther"
  selectedValue = trim(RS("JobBoard_Ext"))
 %>

       <!--#include file="thisOrOther.asp"-->

 <%
  end if


if isReservationPaymentStatus then
   status=RS("PaymentStatus")
 %>
     <!--#include file="drops\dropDownPaymentStatus.asp"-->
 <%
 end if


if isStaffTransfer then
  SQL_DropDown="select distinct Admin_ID dropDown from UserRoles where [Role]='hasCashAccount'  "
  fieldThis="StaffTransfer"
  fieldOther="StaffTransferOther"
  selectedValue = trim(RS("StaffTransfer"))
 %>

       <!--#include file="thisNoOther.asp"-->

 <%
  end if


if isPUN then
  SQL_DropDown="select distinct PUN dropDown from dbo.Customers ORDER BY pun "
  fieldThis="pun"
  fieldOther="punOther"
  selectedValue = trim(RS("PUN_Ext"))
 %>

       <!--#include file="thisNoOther.asp"-->

 <%
end if

if isOperator then
 SQL_DropDown=" select r.Admin_ID dropDown from (select distinct Admin_ID   from dbo.UserRoles  where Role = 'hasCashAccount' ) as t1 , dbo.UserRoles r " &_
	             " where t1.Admin_ID = r.Admin_ID and r.Role ='isContractor' "



  fieldThis="cash_account"
  fieldOther="cash_accountOther"
  selectedValue = trim(RS("Operator_Ext"))
 %>

       <!--#include file="thisNoOther.asp"-->

 <%
end if


if Not isHidden AND Not isOverride AND Not isStaffTransfer AND Not isAGuest AND  Not isEntryDate AND  Not isComment AND Not isReservationPaymentStatus AND Not isRoomType AND Not isProjectDetails AND Not isPayerHidden AND Not isSource AND Not isLodger AND Not isADateType AND NOT isAnID and NOT isCostCode and NOT isPayment and NOT isPayer then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" ></td>
  <td bgcolor="<%=clr%>" ><input type="text" name="<%=x.Name%>" value="<%=x.Value%>" class="inputbox" size="35" maxlength="255"></td>
</tr>
<%
end if

   if clr="#DAE3F0" then clr="#C5D3E7" else clr="#DAE3F0" end if

 %>