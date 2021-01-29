<!--#include file="SQL_Cn.asp"-->



<script>
function Shabaru()
{

alert("hi");
 d   = betterDat.iDay.selectedIndex;
 //m   = iMonth.selectedIndex;
//y   = iYear.Value;

//var dt = new Date(y, m, d);
alert(d);

//var myDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
//document.getElementById('asofdate').innerText=myDays[dt.getDay()] ;
}
</script>





<%

 AddID = request("AddID")



    set RS = SQLCN.Execute("select * from Cheques where ID = "& AddID)

    asof = RS("Date")

    Response.Write "DB has Date=" & asof &"<br>"
    cDt = CDate(asof)

    'var myDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];



    'i = cDt.getDay()-1

    nme= WeekdayName(Weekday(cDt))

    iDay = Day(cDt)

    iMonth = Month(cDt)

    iYr = Year(cDt)



%>



<form name=betterDat>



<span id=asofdate><font color=red><b><%=nme%></b></font> </span> &nbsp


<select name=iDay class="inputbox"  onChange="Shabaru()">
<option value=1 <%if iDay="1" then Response.Write "selected" end if%> >1</option>
<option value=1 <%if iDay="2" then Response.Write "selected" end if%> >2</option>
<option value=1 <%if iDay="3" then Response.Write "selected" end if%> >3</option>
<option value=1 <%if iDay="4" then Response.Write "selected" end if%> >4</option>
<option value=1 <%if iDay="5" then Response.Write "selected" end if%> >5</option>
<option value=1 <%if iDay="6" then Response.Write "selected" end if%> >6</option>
<option value=1 <%if iDay="7" then Response.Write "selected" end if%> >7</option>
<option value=1 <%if iDay="8" then Response.Write "selected" end if%> >8</option>
<option value=1 <%if iDay="9" then Response.Write "selected" end if%> >9</option>
<option value=1 <%if iDay="10" then Response.Write "selected" end if%> >10</option>
<option value=1 <%if iDay="11" then Response.Write "selected" end if%> >11</option>
<option value=1 <%if iDay="12" then Response.Write "selected" end if%> >12</option>
<option value=1 <%if iDay="13" then Response.Write "selected" end if%> >13</option>
<option value=1 <%if iDay="14" then Response.Write "selected" end if%> >14</option>
<option value=1 <%if iDay="15" then Response.Write "selected" end if%> >15</option>
<option value=1 <%if iDay="16" then Response.Write "selected" end if%> >16</option>
<option value=1 <%if iDay="17" then Response.Write "selected" end if%> >17</option>
<option value=1 <%if iDay="18" then Response.Write "selected" end if%> >18</option>
<option value=1 <%if iDay="19" then Response.Write "selected" end if%> >19</option>
<option value=1 <%if iDay="20" then Response.Write "selected" end if%> >20</option>
<option value=1 <%if iDay="21" then Response.Write "selected" end if%> >21</option>
<option value=1 <%if iDay="22" then Response.Write "selected" end if%> >22</option>
<option value=1 <%if iDay="23" then Response.Write "selected" end if%> >23</option>
<option value=1 <%if iDay="24" then Response.Write "selected" end if%> >24</option>
<option value=1 <%if iDay="25" then Response.Write "selected" end if%> >25</option>
<option value=1 <%if iDay="26" then Response.Write "selected" end if%> >26</option>
<option value=1 <%if iDay="27" then Response.Write "selected" end if%> >27</option>
<option value=1 <%if iDay="28" then Response.Write "selected" end if%> >28</option>
<option value=1 <%if iDay="29" then Response.Write "selected" end if%> >29</option>
<option value=1 <%if iDay="30" then Response.Write "selected" end if%> >30</option>
<option value=1 <%if iDay="31" then Response.Write "selected" end if%> >31</option>
</select>


<select name=iMonth class="inputbox"  onChange="Shabaru()">

<option value=1 <%if iMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if iMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if iMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if iMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if iMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if iMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if iMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if iMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if iMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if iMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if iMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if iMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>





<input type=text name=iYr value="<%=iYr%>" class="inputbox" size="4" maxlength="55">



</select>

<select name=iYear class="inputbox"  onChange="Shabaru()">

<option value=2010 <%if iYear="2010" then Response.Write "selected" end if%> >2010</option>
<option value=2011 <%if iYear="2011" then Response.Write "selected" end if%>>2011</option>
<option value=2012 <%if iYear="2012" then Response.Write "selected" end if%>>2012</option>

</select>










<script type="text/javascript" src="inc/popupWindow.js"></script>



 <a href="javascript:;"

 onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=asofdate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">

 <img src="inc/cal.gif" class="DatePicker" alt="Pick A Date" /></a>

</form>

