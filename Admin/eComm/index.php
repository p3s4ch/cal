<?php
session_start();

?>
<!DOCTYPE html>
<html>
<head>
<style>
A:link     {text-decoration: none}
A:visited  {text-decoration: none}
A:active   {text-decoration: none}
A:hover    {text-decoration: none}
A:hover    {color: "#000000"}

.inputSubmit
{
color: #000000;
background-color: #EEEEEE;
border-color : #000000;
border-top : 1px solid;
border-bottom : 1px solid;
border-left : 1px solid;
border-right : 1px solid;
font-family : Verdana,tahoma,Arial;
font-size : 10px;
font-weight: bold;
}
.inner-banner {
  padding-top: 5px;
    height: 200px;
    margin: 0 auto;
    width: 1280px;
  padding-left: 270px;

}
.inputbutton
{
color: #000000;
background-color: #EEEEEE;
border-color : #000000;
border-top : 1px solid;
border-bottom : 1px solid;
border-left : 1px solid;
border-right : 1px solid;
font-family : Verdana,tahoma,Arial;
font-size : 10px;
font-weight: bold;
}
.inputBox
{
color : #000000;
background : #FFFFFF;
border-color : #000000;
border-top : 1px solid;
border-bottom : 1px solid;
border-left : 1px solid;
border-right : 1px solid;
font-family : Verdana,tahoma,Arial;
font-size : 10px;
}


table, th, td {
    border: 1px solid black;
    font-family : Verdana,tahoma,Arial;
    font-size : 11.5px;
}
p {
    font-family : Verdana,tahoma,Arial;
    font-size : 11px;
}

div#notes {
    font-family : Verdana,tahoma,Arial;
    font-size : 14px;
    color: red;
}


//background: #ccc url('gifs/checkButton.jpg') no-repeat top left;

input#image-button{

    padding-left: 16px;
    height: 72px; width: 216px;
    color:#00f;
    background-color:#ddd;
}
input#image-button2{

    padding-left: 16px;
    color:#00f;
    background-color:#ddd;
}

input[type="submit"]:hover{

    border: 12px solid #999;color:#383;
}
input[type="button"]:hover{

    border: 12px solid #999;color:#383;
}
</style>
</head>
<body>



<?php
$ARRIVAL=$_SESSION['ARRIVAL'];
$departuredate=$_SESSION['DEPARTURE'];
$days=$_SESSION['days'];
$phone=$_SESSION['MOBILE'];
$BookingId=$_SESSION['orderid'];
$Nights=$_SESSION['nights'];
$Email=$_SESSION['EMAIL'];
$amount=$_SESSION['amount'];
$roomType=$_SESSION['roomType'];
$ordertype=$_SESSION['ordertype'];
?>


<div class="inner-banner">
        <img width=800 height=200 src="gifs/banner2.png" >

    </div>

<div style="width:800px; margin:0 auto;">



<form action="<?php echo  $_SERVER['PHP_SELF']?>" method="post">
<table>

<tr>
<td colspan=4>
   <a href="index.php">Home</a> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <a href="about.html">About Us</a> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <a href="BookOnline.php">Make A New Reservation On-line</a> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="location.html">Locations</a>    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;       <a href="contact.html">Contact Us</a>
</td></tr>
<tr>

<td colspan=4>
<h3> www.OrderAroom.com <br>
Thank you for your Reservation :  <?php echo "$BookingId"; $_SESSION['orderid']=$BookingId;?> <br><br>
</h3>

Address: The Reception Office is located at 1 Chilton Rd, HA8 7NJ.<br>
However, the Rooms are located in adjacent houses around the corner.<br>
You must inform us of your expected Arrival so that we can meet you to give you a key.<br>
There is not always someone at reception so you do need to contact us before arrival.<br><br>

Web Check-in is now available as soon as you are ready in order to qualify for the web discount!
</td></tr>



<tr><td>Requests</td><td><input type="text" name="requests"  value='<?php echo "$request"; ?>' >


</td>

<td></td><td>     </td>



</tr>


<tr><td>Room Type</td><td><input type="text" name="roomType"  value='<?php echo "$roomType" ;?>' ></td> <td>Rate</td>
<td>
<input type="text" name="rate"  value='<?php
if($ordertype=='Cancellable')
{
  echo"Refundable";
}
if($ordertype=='Non-Cancellable')
{
echo"Non-Refundable";
} ?>' >
</td></tr>



<tr><td>Arrival</td><td><input type="text" name="ARRIVAL"  value='<?php echo "$ARRIVAL" ;?>' ></td>   <td>Departure</td>
<td><input type="text" name="DEPARTURE"  value='<?php echo "$departuredate" ;?>' > </td></tr>
<tr><td>Nights</td><td><input type="text" name="nights" value='<?php echo "$Nights" ;?>' ></td>
 <td>DaysToArrival</td><td><input type="text" name="days" readonly value='<?php echo "$days" ;?>' ></td></tr>

</table>
 <br>

<p>

<?php

if($ordertype=="Cancellable")
{

echo"<div id='notes'>
The Original booking price if we charge your card ourselves is &pound ".$amount;
echo"<br>
By paying now online you will know your payment is succesful and that your reservation is secure.
</div>";

$CN = $days;
$_SESSION['CN']=$CN;
//echo"Created date is " . date("d.m.Y") . "<br>";

if ($CN > 1 && $CN <201) {
    $discount=($amount*98/100);
$discounted_amount = ($discount/(1+($days/100)));
$_SESSION['discounted_amount'] = $discounted_amount;
 echo " <div id='notes'> Your reservation is Cancellable upto the day of arrival, we will attempt to take a payment of  &nbsp;&nbsp;&pound". $amount;echo" from your card on ". $ARRIVAL;
 echo ". However, if you <i>choose</i> to pay now,". $CN ." days earlier, the discounted early bird price you will pay is indicated below. ";

 echo " The discount that we offer depends on how early you pay.";
 echo " So, as soon as you have confirmed your travel plans please feel free to use our Secure Web Check-In  </div> ";

echo "<br>";
echo "Amount To Pay Now is:&nbsp;&nbsp;&pound"; echo number_format((float)$discounted_amount, 2, '.', '');
}

if ($CN > 200) {
 $discount=($amount*98/100);
$discounted_amount = ($discount/3);
$_SESSION['discounted_amount'] = $discounted_amount;

 echo " <div id='notes'> Your reservation is Cancellable upto the day of arrival, we will attempt to take a payment of  &nbsp;&nbsp;&pound". $amount;echo" from your card on ". $ARRIVAL;
 echo ". However, if you <i>choose</i> to pay now,". $CN ." days earlier, the discounted early bird price you will pay is indicated below. ";

 echo " The discount that we offer depends on how early you pay.";
 echo " So, as soon as you have confirmed your travel plans please feel free to use our Secure Web Check-In  </div> ";

echo "<br>";
echo "Amount To Pay Now is:&nbsp;&nbsp;&pound"; echo number_format((float)$discounted_amount, 2, '.', '');
}
if ($CN < 2 )
 {
$discounted_amount = ($amount*98/100);
$_SESSION['discounted_amount'] = $discounted_amount;
 echo " <div id='notes'> Your reservation is Cancellable upto the day of arrival, we will attempt to take a payment of  &nbsp;&nbsp;&pound". $amount;echo" from your card on ". $ARRIVAL;
 echo ". However, you can <i>choose</i> to pay online before then.";
 echo " So, as soon as you have confirmed your travel plans please feel free to use our Secure Web Check-In  </div> ";

 echo "<br>";
echo "The Amount To Pay is:  &nbsp;&nbsp;&pound"; echo number_format((float)$discounted_amount, 2, '.', '');

 }

}

if($ordertype=="Non-Cancellable")
{

$discounted_amount = ($amount*(98/100));
$_SESSION['discounted_amount'] = $discounted_amount;

$CN = $days;
$_SESSION['CN'] = $CN;


echo"Created date is " . date("d.m.Y") . "<br>";
 echo " <div id='notes'> Your reservation is Non cancellable we will attempt to take a payment of  &nbsp;&nbsp;&pound". $amount;echo" from your card on ". $ARRIVAL;
  echo ".However you can <i>choose</i> to pay online before then,with a 2% discount of the original price. </div> ";
  echo "<br>";
echo "The Amount To Pay is:  &nbsp;&nbsp;&pound";   echo number_format((float)$discounted_amount, 2, '.', '');


}
?>
<br>
</p>
<br>
<br><input type="submit" id="image-button" value="Web Check In" >   </input>
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
     <input type="button" id="image-button2" value="AMEND or CANCEL this reservation"   onclick="window.location='http://79.171.34.90/room/cancel.php'" />
</form>

    </div>
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
$Nights=mysqli_real_escape_string($con, $_POST['nights']);
$Email=mysqli_real_escape_string($con, $Email);
$arrivaldate=mysqli_real_escape_string($con, $_POST['ARRIVAL']);
$NR=mysqli_real_escape_string($con, $_POST['rate']);
if($roomType=='Double')
{
$Rooms=2;
$NoOfRooms=mysqli_real_escape_string($con, $Room);
}

$_SESSION['amount']=$amount;
$_SESSION['ordertype']=$ordertype;
$_SESSION['rooms']=$NoOfRooms;
$_SESSION['ARRIVAL']=$arrivaldate;
$_SESSION['DEPARTURE']=$departuredate;
$_SESSION['days']=$DaysToArrival;
$_SESSION['MOBILE']=$phone;
$_SESSION['nights']=$Nights;
$_SESSION['EMAIL']=$Email;
$_SESSION['rate']=$NR;
$_SESSION['roomType']=$roomType;

if($_SESSION['ARRIVAL']=$arrivaldate)
{
$dt = DateTime::createFromFormat("d/m/Y", $_SESSION['ARRIVAL']);

$_SESSION['ARRIVALDate']= $dt->format("Y-m-d");
}

if($_SESSION['roomType']=='Double')
{
$Rooms=2;
$_SESSION['rooms']=$Rooms;
}
// Insert data into mysql database
$sql="INSERT INTO reservations (BookingID,nights,NR,NoOfRooms,Email,Updated,Arrival)
VALUES ('$BookingId','$Nights','$NR','$_SESSION[rooms]','$_SESSION[EMAIL]',now(),'$_SESSION[ARRIVALDate]')";

 if($result=mysqli_query($con,$sql))
{
 echo "<script>window.location.replace('takeOff.php')</script> ";
 exit();
 }

}}
?>

