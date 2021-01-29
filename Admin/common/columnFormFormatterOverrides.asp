

<%
isReservationPaymentStatus =false
isADateType =false
isGS5date =false
isAnID=false
isCostCode=false
isPayment=false
isPayer=false

isLodger=false
isPayerHidden=false
isProjectDetails=false
isRoomType=false
isComment=false
isEntryTime=false
isBeginTime=false
isEndTime=false
isDetails=false
isURL=false
isReadOnly=false

isDateTime24H=false
isGS6datetime =false

if InStr(x.Name,"URL") > 0 then isURL =true else isURL=false end if
if InStr(x.Name,"ReadOnly") > 0 then isReadOnly =true else isReadOnly=false end if

if InStr(x.Name,"CustomerID_Ext") > 0 then isCustomerID_Ext =true else isCustomerID_Ext=false end if
if InStr(x.Name,"_GS5date_Ext") > 0 then isGS5date =true else isGS5date=false end if
if InStr(x.Name,"_DT24H_Ext") > 0 then isDateTime24H =true else isDateTime24H=false end if
if InStr(x.Name,"Details") > 0 then isDetails =true else isDetails=false end if
if InStr(x.Name,"Begin Time") > 0 then isBeginTime =true else isBeginTime=false end if
if InStr(x.Name,"End Time") > 0 then isEndTime =true else isEndTime=false end if
if InStr(x.Name,"GS6datetime_Ext") > 0 then isGS6datetime =true else isGS6datetime=false end if


if InStr(x.Name,"EntryTime") > 0 then isEntryTime =true else isEntryTime=false end if
if InStr(x.Name,"Comment") > 0 then isComment =true else isComment=false end if
if InStr(x.Name,"PaymentStatus") > 0 then isReservationPaymentStatus =true else isReservationPaymentStatus=false end if
if InStr(x.Name,"RoomType") > 0 then isRoomType =true else isRoomType=false end if
if InStr(x.Name,"ProjectDetails") > 0 then isProjectDetails =true else isProjectDetails=false end if
if InStr(x.Name,"P_ayerHidden")  > 0 then isPayerHidden =true else isPayerHidden=false end if

if InStr(x.Name,"Payer")  > 0 then isPayer =true else isPayer=false end if
if (InStr(x.Name,"Lodger") > 0)  then isLodger =true else isLodger=false end if
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if
if (InStr(x.Name,"ID") > 0)  then isAnID =true else isAnID=false end if
if (InStr(x.Name,"ChequeNo") > 0)  then isAnID =false end if
'if (InStr(x.Name,"Payment") > 0)  then isPayment =true else isPayment=false end if

if isReadOnly then
	fieldName = Replace(x.Name,"_ExtReadOnly","")
%>
<tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=fieldName%> </b></font></td>
  <td bgcolor="<%=clr%>" ></td>
  <td bgcolor="<%=clr%>" ><input type="text" name="<%=fieldName%>" value="<%=x.Value%>" size="35" maxlength="255" readonly disabled ></td>
</tr>
<%
end if



if isDetails then
  fieldName = Replace(x.Name,"_Ext","")
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> <%=fieldName%> </b> </font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
       <textarea name="Details" class="inputbox" cols="85" rows="5" > <%=x.Value%> </textarea>

  </td>
</tr>
<%
end if


if isDateTime24H then
    myDatetime = x.Value
    fieldName = Replace(x.Name,"_DT24H_Ext","")
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>  <%= fieldName %>  </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
  <!--#include file="drops\drop24Hours.asp"-->

  </td>
  </td>
</tr>
<%
end if


if isGS6datetime then
    myDatetime = x.Value
    fieldName = Replace(x.Name,"_GS6datetime_Ext","")
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>  <%= fieldName %>  </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
   <!--#include file="buttons\searchAsof5.asp"-->
  <!--#include file="drops\drop24Hours.asp"-->

  </td>
  </td>
</tr>
<%
end if



if isBeginTime then
    myDatetime = x.Value
    fieldName = "BeginTime"
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>  <%= Replace(x.Name,"_Ext","") %>  </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
  <!--#include file="drops\dropHours.asp"-->

  </td>
  </td>
</tr>
<%
end if

if isEndTime then
   myDatetime = x.Value
   fieldName = "EndTime"

 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%= Replace(x.Name,"_Ext","") %> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
  <!--#include file="drops\dropHours.asp"-->

  </td>
  </td>
</tr>
<%
end if

if isPayerHidden then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  &nbsp; </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="hidden" name="Payer" value="<%=x.Value%>"  >
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

if isCostCode then
 SQL_DropDown="select distinct CostCode dropDown from Costs order by 1"
  fieldThis="CostCode"
  fieldOther="CostCodeOther"
  selectedValue = RS("CostCode")
 %>

 <!--#include file="thisOrOther.asp"-->

  <%
end if

if isPayer then
  SQL_DropDown="select distinct Payer dropDown from fees order by 1"
  fieldThis="Payer"
  fieldOther="PayerOther"
  selectedValue = RS("Payer_Ext")
 %>
    <!--#include file="thisOrOther.asp"-->
 <%
end if





if isAgentAccNoOther then

   SQL_DropDown=" select r.Admin_ID dropDown from (select distinct Admin_ID   from dbo.UserRoles  where Role = 'hasCashAccount' ) as t1 , dbo.UserRoles r " &_
	             " where t1.Admin_ID = r.Admin_ID and r.Role ='isAgent' "
  fieldThis="AgentAccount"
  fieldOther="PayerNoOther"
  selectedValue = RS("AgentAccNoOther_Ext")
 %>
    <!--#include file="thisNoOther.asp"-->
 <%
end if



if isProjectDetails then
  SQL_DropDown="select distinct Details dropDown from Costs where date > '1 jan 2013' and Details <>'' order by 1"
  fieldThis="ProjectDetails"
  fieldOther="ProjectDetailsOther"
  selectedValue = RS("ProjectDetails")
 %>
 <!--#include file="thisOrOther.asp"-->
 <%
end if

if isCATS then
  SQL_DropDown="select distinct Cats dropDown from Customers"
  fieldThis="Category Of Service - Cats_Ext"
  fieldOther="CatsOther"
  selectedValue = RS("Category Of Service - Cats_Ext")
 %>
 <!--#include file="thisOrOther.asp"-->
 <%
end if

if isEntryTime then
dt1 = x.Value

 %>

  <tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=Replace(x.Name,"EntryTime_Ext","") %> </b></font></td>
   <td bgcolor="<%=clr%>" > </td>
   <td bgcolor="<%=clr%>" >
     <!--#include file="buttons\searchAsof.asp"-->
   </td>
 </tr>

 <%
 end if

if isGS5date then
dt1 = x.Value
fieldName = Replace(x.Name,"_GS5date_Ext","")
 %>

  <tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%= fieldName %> </b></font></td>
   <td bgcolor="<%=clr%>" > </td>
   <td bgcolor="<%=clr%>" >
     <!--#include file="buttons\searchAsof5.asp"-->
   </td>
 </tr>

 <%
 end if


if isHidden then
 %>
   <input type="hidden" name="<%= Replace(x.Name,"_hidden","")%>" value="<%=x.Value%>">

 <%
 end if

if isURL then

myUid = "uid=" & uid

 %>

  <tr>
       <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%= Replace(x.Name,"_Ext","") %> </b></font></td>
      <td bgcolor="<%=clr%>" > </td>
      <td bgcolor="<%=clr%>" > <input type="text"  name="<%=x.Name%>" value="<%=x.Value%>" class="inputbox" size="100" maxlength="555">
         <a href="<%=Replace(x.Value,"uid=xx",myUid)%>"> view </a> </td>
   </tr>


 <%
 end if


if isCustomerID_Ext then

%>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>CustomerID_Ext </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="text" name="Customer" value="<%=x.Value%>" size="8" maxlength="255" >
  </td>
</tr>
<%
end if

%>