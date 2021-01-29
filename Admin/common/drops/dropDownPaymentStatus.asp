




<%
'set already
'status = RS("Status")

'Response.Write "status = "& status
if status="CREATED" then NEW_SELECTED ="selected" end if
if status="NEW" then NEW_SELECTED ="selected" end if

if status="PAID" then PAID_SELECTED ="selected" end if
if status="PAID CASH" then PAIDCASH_SELECTED ="selected" end if
if status="PAID_CANCELLED_CN" then PAIDCANCELLED_CN_SELECTED ="selected" end if
if status="PAID_CANCELLED_NR" then PAIDCANCELLED_NR_SELECTED ="selected" end if

if status="DECLINED" then DECLINED_SELECTED ="selected" end if
if status="WAITING" then WAITING_SELECTED ="selected" end if
if status="CANCELLED" then CANCELLED_SELECTED ="selected" end if

if status="REFUNDED" then REFUNDED_SELECTED ="selected" end if


clr="#DAE3F0"

%>


<tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> Payment Status </b></font></td>
   <td bgcolor="<%=clr%>" ></td>
   <td bgcolor="<%=clr%>" >
   <select name="Status" class="inputBox">
                        <option value="" SELECTED >   </option>
                        <option value="NEW"        <%=NEW_SELECTED%>                    >NEW </option>

                        <option value="PAID"       <%=PAID_SELECTED%>                        >PAID </option>
                        <option value="PAID CASH"  <%=PAIDCASH_SELECTED%>                    >PAID CASH </option>
                        <option value="PAID_CANCELLED_CN"  <%=PAIDCANCELLED_CN_SELECTED%>    >PAID CANCELLED CN </option>
                        <option value="PAID_CANCELLED_NR"  <%=PAIDCANCELLED_NR_SELECTED%>    >PAID CANCELLED NR </option>

                        <option value="DECLINED"   <%=DECLINED_SELECTED%>               >DECLINED </option>
                        <option value="WAITING"    <%=WAITING_SELECTED%>                >WAITING </option>
                        <option value="CANCELLED"  <%=CANCELLED_SELECTED%>              >CANCELLED </option>
                        <option value="REFUNDED"   <%=REFUNDED_SELECTED%>               >REFUNDED </option>
               </select>




 </td>
</tr>