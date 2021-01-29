

<%

isReservationPaymentStatus =false
isADateType =false
isAnID=false
isCostCode=false
isPayment=false
isPayer=false
isSource=false
isLodger=false
isPayerHidden=false
isProjectDetails=false
isRoomType=false
isComment=false
isEntryTime=false
isBeginTime=false
isEndTime=false
isDetails=false
isHidden=false

if InStr(x.Name,"_hidden") > 0 then isHidden =true else isHidden=false end if
if InStr(x.Name,"Details") > 0 then isDetails =true else isDetails=false end if


if InStr(x.Name,"Begin Time") > 0 then isBeginTime =true else isBeginTime=false end if
if InStr(x.Name,"End Time") > 0 then isEndTime =true else isEndTime=false end if

if InStr(x.Name,"EntryTime") > 0 then isEntryTime =true else isEntryTime=false end if
if InStr(x.Name,"Comment") > 0 then isComment =true else isComment=false end if
if InStr(x.Name,"PaymentStatus") > 0 then isReservationPaymentStatus =true else isReservationPaymentStatus=false end if
if InStr(x.Name,"RoomType") > 0 then isRoomType =true else isRoomType=false end if
if InStr(x.Name,"ProjectDetails") > 0 then isProjectDetails =true else isProjectDetails=false end if
if InStr(x.Name,"P_ayerHidden")  > 0 then isPayerHidden =true else isPayerHidden=false end if
if InStr(x.Name,"Source")  > 0 then isSource =true else isSource=false end if
if InStr(x.Name,"Payer")  > 0 then isPayer =true else isPayer=false end if
if (InStr(x.Name,"Lodger") > 0)  then isLodger =true else isLodger=false end if
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if
if (InStr(x.Name,"ID") > 0)  then isAnID =true else isAnID=false end if
if (InStr(x.Name,"ChequeNo") > 0)  then isAnID =false end if
'if (InStr(x.Name,"Payment") > 0)  then isPayment =true else isPayment=false end if


if isDetails then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  &nbsp; </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
       <textarea name="Details" class="inputbox" cols="85" rows="5" > <%=x.Value%> </textarea>

  </td>
</tr>
<%
end if


if isBeginTime then
    myDatetime = x.Value
    fieldName = "BeginTime"
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
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
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
  <!--#include file="drops\dropHours.asp"-->

  </td>
  </td>
</tr>
<%
end if

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

if Not isHidden AND isAnID then
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
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Name Of Payer</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="payer" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Payer from fees order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Payer") = RS_CC("Payer") then
	                        %>
		                        <option value="<%=RS_CC("Payer")%>" selected><%=RS_CC("Payer")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Payer")%>"><%=RS_CC("Payer")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="PayerOther" class="inputbox" size="25" maxlength="255" ></td>
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

if isProjectDetails then
  SQL_DropDown="select distinct Details dropDown from Costs where date > '1 jan 2013' and Details <>'' order by 1"
  fieldThis="ProjectDetails"
  fieldOther="ProjectDetailsOther"
  selectedValue = RS("ProjectDetails")
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


if isEntryTime then
dt1 = x.Value

 %>

  <tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%></b></font></td>
   <td bgcolor="<%=clr%>" > </td>
   <td bgcolor="<%=clr%>" >
     <!--#include file="buttons\searchAsof.asp"-->
   </td>
 </tr>

 <%
 end if


if isHidden then
 %>
   <input type="hidden" name="<%=x.Name%>" value="<%=x.Value%>">

 <%
 end if



if Not isHidden AND Not isDetails AND Not isEndTime AND Not isBeginTime AND Not isEntryTime AND  Not isComment AND Not isReservationPaymentStatus AND Not isRoomType AND Not isProjectDetails AND Not isPayerHidden AND Not isSource AND Not isLodger AND Not isADateType AND NOT isAnID and NOT isCostCode and NOT isPayment and NOT isPayer then
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