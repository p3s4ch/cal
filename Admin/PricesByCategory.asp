
<script language="JavaScript">

 function doCat(obj)

  {

   //alert("hi from Prices By category ver 2")

   cat = document.frmUser.category.options[document.frmUser.category.selectedIndex].innerText;



   //alert("value of cat is : " + cat);



   if (cat == "Garden")

     {

       i=0;

       document.frmUser.duration.options[i].innerText = "1st hour  £40. Online Price £36  " ;

       document.frmUser.duration.options[i].durMin=0;

       document.frmUser.duration.options[i].durHr=1;

       document.frmUser.duration.options[i].value=60;

       document.frmUser.duration.options[i].price="36";



       i++;



       document.frmUser.duration[i].innerText = "2 hours  £55. Online Price £49.50  " ;

       document.frmUser.duration.options[i].durMin=0;

       document.frmUser.duration.options[i].durHr=2;

       document.frmUser.duration.options[i].value=120;

       document.frmUser.duration.options[i].price="49.50"





       i++;

       document.frmUser.duration[i].innerText = "3 - 4 hours  £80. Online Price £72" ;

       document.frmUser.duration.options[i].durMin=0;

       document.frmUser.duration.options[i].durHr=4 ;

       document.frmUser.duration.options[i].value=240;

       document.frmUser.duration.options[i].price="72.00";



      i++;

       document.frmUser.duration[i].innerText = "5- 6 hours £105. Online Price £94.50" ;

       document.frmUser.duration.options[i].durMin=0;

       document.frmUser.duration.options[i].durHr=6;

       document.frmUser.duration.options[i].value=360;

       document.frmUser.duration.options[i].price="94.50";



      i++;



       document.frmUser.duration[i].innerText =  "Full day £125. Online Price £112.50" ;

       document.frmUser.duration.options[i].durMin=0;

       document.frmUser.duration.options[i].durHr=8;

       document.frmUser.duration.options[i].value=480;

       document.frmUser.duration.options[i].price="112.50";



 }



 if (cat == "Gas" || cat == "Electrical")

      {

     i=0;

      document.frmUser.duration.options[i].innerText = "1st hour £85. Online Price £ 76.50" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=1;

      document.frmUser.duration.options[i].value=60;

      document.frmUser.duration.options[i].price="76.50";



    i++;

      document.frmUser.duration[i].innerText = "2 hours  £155. Online Price £ 139.50" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=2;

      document.frmUser.duration.options[i].value=120;

      document.frmUser.duration.options[i].price=139.50;



    i++;

      document.frmUser.duration[i].innerText = "3 - 4  hours  £215. Online Price £ 193.50" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=4;

      document.frmUser.duration.options[i].value=240;

      document.frmUser.duration.options[i].price="193.50";

     i++;

      document.frmUser.duration[i].innerText = "5 - 6 hours  £270. Online Price £ 243.00" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=6;

      document.frmUser.duration.options[i].value=360;

      document.frmUser.duration.options[i].price="243.00";



     i++;

      document.frmUser.duration[i].innerText = "Full day £325. Online Price £292.50" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=5;

      document.frmUser.duration.options[i].value=480;

      document.frmUser.duration.options[i].price="292.50";



   }



   if (cat == "Handyman" || cat == "Decorating" )

      {



      i=0;

      document.frmUser.duration.options[i].innerText = "1st hour £40. Online Price £ 36" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=1;

      document.frmUser.duration.options[i].value=60;

      document.frmUser.duration.options[i].price="36.00";



    i++;

      document.frmUser.duration[i].innerText = "2 hours  £70. Online Price £ 63.00" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=2;

      document.frmUser.duration.options[i].value=120;

      document.frmUser.duration.options[i].price=63.00;



    i++;

      document.frmUser.duration[i].innerText = "3 - 4 hours  £110. Online Price £ 99.00" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=4;

      document.frmUser.duration.options[i].value=240;

      document.frmUser.duration.options[i].price="99.00";

     i++;

      document.frmUser.duration[i].innerText = "5 -6 hours   £150. Online Price £135.00" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=6;

      document.frmUser.duration.options[i].value=360;

      document.frmUser.duration.options[i].price="135.00";



     i++;

      document.frmUser.duration[i].innerText =  "Full day £185. Online Price £166" ;

      document.frmUser.duration.options[i].durMin=0;

      document.frmUser.duration.options[i].durHr=8;

      document.frmUser.duration.options[i].value=480;

      document.frmUser.duration.options[i].price="166.00";



    }



       if (cat == "Plumbing" )

      {

      //60 first plus 50 each extra

        i=0;

            document.frmUser.duration.options[i].innerText = "1st hour £65. Online Price £ 58.50" ;

            document.frmUser.duration.options[i].durMin=0;

            document.frmUser.duration.options[i].durHr=1;

            document.frmUser.duration.options[i].value=60;

            document.frmUser.duration.options[i].price="58.50";



          i++;

            document.frmUser.duration[i].innerText = "2 hours  £100. Online Price £ 90" ;

            document.frmUser.duration.options[i].durMin=0;

            document.frmUser.duration.options[i].durHr=2;

            document.frmUser.duration.options[i].value=120;

            document.frmUser.duration.options[i].price=90.00;



          i++;

            document.frmUser.duration[i].innerText = "3 - 4 hours  £145. Online Price £ 130.50" ;

            document.frmUser.duration.options[i].durMin=0;

            document.frmUser.duration.options[i].durHr=4;

            document.frmUser.duration.options[i].value=240;

            document.frmUser.duration.options[i].price="130.50";

           i++;

            document.frmUser.duration[i].innerText = "5 -6 hours   £185. Online Price £ 166.50" ;

            document.frmUser.duration.options[i].durMin=0;

            document.frmUser.duration.options[i].durHr=6;

            document.frmUser.duration.options[i].value=360;

            document.frmUser.duration.options[i].price="166.50";



           i++;

            document.frmUser.duration[i].innerText =  "Full day £225. Online Price £202.50" ;

            document.frmUser.duration.options[i].durMin=0;

            document.frmUser.duration.options[i].durHr=8;

            document.frmUser.duration.options[i].value=480;

                document.frmUser.duration.options[i].price="202.50";



    }







   if (cat == "Holiday" || cat == "Errand" || cat == "Quote" || cat == "Kids" )

      {





      i=0;

             document.frmUser.duration.options[i].innerText = "1 hour" ;

             document.frmUser.duration.options[i].durMin=0;

             document.frmUser.duration.options[i].durHr=1;

             document.frmUser.duration.options[i].value=60;

             document.frmUser.duration.options[i].price="0";



       i++;

             document.frmUser.duration[i].innerText = "2 hours" ;

             document.frmUser.duration.options[i].durMin=0;

             document.frmUser.duration.options[i].durHr=2;

             document.frmUser.duration.options[i].value=120;

             document.frmUser.duration.options[i].price="0";



       i++;

             document.frmUser.duration[i].innerText = "3-4 hours" ;

             document.frmUser.duration.options[i].durMin=0;

             document.frmUser.duration.options[i].durHr=4;

             document.frmUser.duration.options[i].value=240;

             document.frmUser.duration.options[i].price="";

            i++;

             document.frmUser.duration[i].innerText = "Half Day" ;

             document.frmUser.duration.options[i].durMin=0;

             document.frmUser.duration.options[i].durHr=6;

             document.frmUser.duration.options[i].value=360;

             document.frmUser.duration.options[i].price="";



            i++;

             document.frmUser.duration[i].innerText =  "Full Day" ;

             document.frmUser.duration.options[i].durMin=0;

             document.frmUser.duration.options[i].durHr=8;

             document.frmUser.duration.options[i].value=480;

             document.frmUser.duration.options[i].price="0";



    }



     //document.frmUser.duration.selectedIndex =0;

     //doDuration(this);

     //Now set BillTotal

   document.frmUser.BillTotal.value = document.frmUser.duration.options[document.frmUser.duration.selectedIndex].price;



 }





  function Test(obj)

  {



      alert("able to choose: " + document.frmUser.duration.options[document.frmUser.duration.selectedIndex].innerText);

      alert("value min =" + document.frmUser.duration.options[document.frmUser.duration.selectedIndex].value);

      alert("durMin= " + document.frmUser.duration.options[document.frmUser.duration.selectedIndex].durMin);

      alert("durHr= " + document.frmUser.duration.options[document.frmUser.duration.selectedIndex].durHr);

      alert("price=" + document.frmUser.duration.options[document.frmUser.duration.selectedIndex].price);



  }

 </script>

