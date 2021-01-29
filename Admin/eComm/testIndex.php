<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
</head>
<body>

<?php
$orderid = $_POST['orderid'];

echo "testIndex.php goes to Index.php <br>";
?>
<FORM METHOD="POST" ACTION="<?php echo  $_SERVER['PHP_SELF']?>" id="form1" name="form1">

    ORDER ID<INPUT type="text" NAME="orderid" value='<?php echo "$orderid";?>'/><br>
    ORDERTYPE:<br><INPUT type="radio" NAME="ordertype" required value="Cancellable"/>Cancellable
    <input type="radio" name="ordertype" required value="Non-Cancellable" />Non-Cancellable<br>

    ROOMTYPE<INPUT type="text" NAME="roomType" required value="Double"><br>
    AMOUNT<INPUT type="text" NAME="amount" required value="1500"><br>
    CURRENCY<INPUT type="text" NAME="CURRENCY" value="GBP"><br>
    <INPUT type="hidden" NAME="LANGUAGE" value="en_US">
    ARRIVAL<INPUT type="text" NAME="ARRIVAL" required id="arrivaldate"><br>
    DEPARTURE<INPUT type="text" NAME="DEPARTURE" required id="departuredate"><br>
    NightsToSpend<INPUT type="text" NAME="nights" required id="nights"> <br>
    DaysToArrival<INPUT type="text" NAME="days" required id="days" ><br>
    isDorm<INPUT type="text" NAME="isDorm"required value="true">    <br>
    isFern<INPUT type="text" NAME="isFern" required value="true">    <br>
    EMAIL<INPUT type="text" name="EMAIL" required value="guzvolk@hotmail.com"><br>
    MOBILE<INPUT type="text" name="MOBILE" required value="07881966867"> <br>
    <!-- lay out information -->

    <INPUT type="hidden" NAME="TITLE" value="">



    <INPUT type="hidden" NAME="LOGO" value="">
    <!-- or dynamic template page -->
    <INPUT type="hidden" NAME="TP" value="">
    <!-- post-payment redirection -->
    <INPUT type="hidden" NAME="ACCEPTURL" VALUE="">
    <INPUT type="hidden" NAME="DECLINEURL" VALUE="">
    <INPUT type="hidden" NAME="EXCEPTIONURL" VALUE="">
    <INPUT type="hidden" NAME="CANCELURL" VALUE="">
    <INPUT type="hidden" NAME="BACKURL" VALUE="">
    <!-- miscellanous -->
    <INPUT type="hidden" NAME="HOMEURL" VALUE="">
    <INPUT type="hidden" NAME="CATALOGURL" VALUE="">
    <INPUT type="hidden" NAME="CN" value="">

    <INPUT type="hidden" NAME="PM" VALUE="">
    <INPUT type="hidden" NAME="BRAND" VALUE="">
    <INPUT type="hidden" NAME="ALIASUSAGE" VALUE="">
    <INPUT type="hidden" NAME="ALIASOPERATION" VALUE="">
    <INPUT type="hidden" NAME="COM" VALUE="">
    <INPUT type="hidden" NAME="COMPLUS" VALUE="">
    <INPUT type="hidden" NAME="PARAMPLUS" VALUE="">
    <INPUT type="hidden" NAME="USERID" VALUE="">
    <INPUT type="hidden" NAME="CREDITCODE" VALUE="">

    <input type="submit" value="testIndex" id="submit2" name="submit2">
<script src="https://code.jquery.com/jquery-1.8.3.js"></script>
<script src="https://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" />
<script>
$(document).ready(function() {

$( "#arrivaldate,#departuredate" ).datepicker({
changeMonth: true,
changeYear: true,
firstDay: 1,
dateFormat: 'dd/mm/yy',
})

$( "#arrivaldate" ).datepicker({ dateFormat: 'dd-mm-yy' });
$( "#departuredate" ).datepicker({ dateFormat: 'dd-mm-yy' });

var start = $('#arrivaldate').datepicker('getDate');

$('#departuredate').change(function() {

var start = $('#arrivaldate').datepicker('getDate');
var end   = $('#departuredate').datepicker('getDate');

 if (start<new Date())
{
  alert ("The arrival date you have chosen has already passed!!");
$('#arrivaldate').val("");
$('#departuredate').val("");
$('#nights').val("");
$('#days').val("");
}
else if (start<end) {
var nights   = (end - start)/1000/60/60/24;
$('#nights').val(nights);
var next=new Date();
var days= (start - next)/1000/60/60/24;
 var n = days.toFixed(0)
$('#days').val(n);
}


else if (start>end)  {
alert ("You cant depart before you arrive!");
$('#arrivaldate').val("");
$('#departuredate').val("");
$('#nights').val("");
$('#days').val("");

}
else if (start=end) {
var nights   = 0;
$('#nights').val(nights);

}
else if (start=next) {
var days   = 0;
$('#days').val(days);

}
}); //end change function
}); //end ready
</script>
    </form>
</body>
</html>
<?php 
if($_SERVER['REQUEST_METHOD']=="POST"){

$con=mysqli_connect("79.171.34.90","mary1","$3Awi6h9","spiderdb");
                    // Check connection
                    if (!$con)
                    {
                     echo "<script>alert('Failed to connect to MySQL database')</script>";
                   }

                     else{
$BookingId=mysqli_real_escape_string($con, $_POST['orderid']);
$Nights=mysqli_real_escape_string($con, $_POST['nights']);
$Email=mysqli_real_escape_string($con, $_POST['EMAIL']);
$arrivaldate=mysqli_real_escape_string($con, $_POST['ARRIVAL']);
$departuredate=mysqli_real_escape_string($con, $_POST['DEPARTURE']);
$DaysToArrival=mysqli_real_escape_string($con, $_POST['days']);
$phone=mysqli_real_escape_string($con, $_POST['MOBILE']);
$roomType=mysqli_real_escape_string($con, $_POST['roomType']);
$ordertype=mysqli_real_escape_string($con, $_POST['ordertype']);

$amount=mysqli_real_escape_string($con, $_POST['amount']);

$_SESSION['amount']=$amount;
$_SESSION['ordertype']=$ordertype;
$_SESSION['roomType']=$roomType;
$_SESSION['ARRIVAL']=$arrivaldate;
$_SESSION['DEPARTURE']=$departuredate;
$_SESSION['days']=$DaysToArrival;
$_SESSION['MOBILE']=$phone;
$_SESSION['orderid']=$BookingId;
$_SESSION['nights']=$Nights;
$_SESSION['EMAIL']=$Email;

//Check to see if there are duplicates 
$query = "SELECT * FROM reservations WHERE BookingID='$orderid'";
$results = mysqli_query($con,$query);
  if(mysqli_num_rows($results)>0)
{
  echo "<script> alert('Customer Id is already booked.')</script>";
 echo "<script>window.location.replace('http://79.171.34.90/room/testIndex.php')</script> ";

  exit();
  }
else     {
   echo "<script>window.location.replace('http://79.171.34.90/room/index.php')</script> ";
            exit();
        }
}}
      session_destroy();
        ?>