<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link rel="stylesheet" type="text/css" href="./css/datatables.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/datatables.material.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css">
  <link type="text/css" rel="stylesheet" href="./css/trans-reservation.css"/><!--Let browser know website is optimized for mobile-->
  <!-- full calendar declrations -->
  <link href='./css/fullcalendar.css' rel='stylesheet' />
  <link href='./css/fullcalendar.print.css' rel='stylesheet' media='print' />
  <script src='./js/moment.min.js'></script>
  <script src='./js/jquery.min.js'></script>
  <script src='./js/fullcalendar.min.js'></script>

  <script>

   $(document).ready(function() {
     
     $('#calendar').fullCalendar({
       header: {
         left: 'prev,next today',
         center: 'title',
         right: 'month,basicWeek,basicDay'
       },
       defaultDate: '2016-01-12',
       editable: true,
       eventLimit: true, // allow "more" link when too many events
       events: [
         {
           title: 'All Day Event',
           start: '2016-01-01'
         },
         {
           title: 'Long Event',
           start: '2016-01-07',
           end: '2016-01-10'
         },
         {
           id: 999,
           title: 'Repeating Event',
           start: '2016-01-09T16:00:00'
         },
         {
           id: 999,
           title: 'Repeating Event',
           start: '2016-01-16T16:00:00'
         },
         {
           title: 'Conference',
           start: '2016-01-11',
           end: '2016-01-13'
         },
         {
           title: 'Meeting',
           start: '2016-01-12T10:30:00',
           end: '2016-01-12T12:30:00'
         },
         {
           title: 'Lunch',
           start: '2016-01-12T12:00:00'
         },
         {
           title: 'Meeting',
           start: '2016-01-12T14:30:00'
         },
         {
           title: 'Happy Hour',
           start: '2016-01-12T17:30:00'
         },
         {
           title: 'Dinner',
           start: '2016-01-12T20:00:00'
         },
         {
           title: 'Birthday Party',
           start: '2016-01-13T07:00:00'
         },
         {
           title: 'Click for Google',
           url: 'http://google.com/',
           start: '2016-01-28'
         }
       ]
     });
     
   });

  </script>
<style>

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>

  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>

  <body class="blue-grey lighten-5">
  <div class="wrapper">
        <header class="headnav">
                        <ul id="slide-out" class="side-nav fixed z-depth-0">
                          <div class="center">
                             <img src="./img/logo.png" class="circle" style="width: 100%; height: 100%; margin-top: 40px; margin-bottom: 20px;">
                            </div>
                          <li><a href="admin-home.jsp" class="waves-effect"><b>Home</b></a></li>
                         <!--  <li class="no-padding"> -->
                            <ul class="collapsible" data-collapsible="accordion">
                              <li>
                                <a class="collapsible-header"><b>Maintenance</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="packageMaintenance">Package</a></li>
                                      <li><a href="locationMaintenance">Delivery Charge</a></li>
                                      <li><a href="extraChargeMaintenance">Other Charge</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header active"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li class="purple lighten-4"><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li><a href="transactions-vip.jsp">VIP</a></li>
                                      <li><a href="transactions-walkin.jsp">Walk In</a></li>
                                    </ul>
                                  </div>
                              </li>
                            </ul>
                          <li><a href="utilities.jsp" class="waves-effect"><b>Utilities</b></a></li>
                        </ul>

                
                       <nav class="z-depth-0">
                         <div class="nav-wrapper purple">
                           <a href="#!" class="brand-logo white-text" style="margin-left: 30px;">Salon Management System</a>
                         
                           <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                           <ul class="side-nav" id="mobile-demo">
                             <li><a href="admin-home.jsp" class="waves-effect waves-purple"><b>Home</b></a>
                               <ul class="collapsible collapsible-accordion">
                                 <li>
                                   <a class="waves-effect waves-purple collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promo.jsp">Promo</a></li>
                                         <li><a href="maintenance-discount.jsp">Discount</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                         <li><a href="maintenance-catalouge.jsp">Catalogue</a></li>
                                         <li><a href="maintenance-extra.jsp">Charge</a></li>
                                         <li><a href="locationMaintenance">Location</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-purple collapsible-header"><b>Transaction</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="transactions-inventory.jsp">Monitor Product</a></li>
                                         <li class="purple lighten-4"><a href="transactions-reservation.jsp">Manage Reservation</a></li>
                                         <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                         <li><a href="transactions-vip.jsp">VIP</a></li>
                                         <li><a href="transactions-walkin.jsp">Walk In</a></li>
                                       </ul>
                                     </div>
                                 </li>
                               </ul>
                              <li><a href="utilities.jsp" class="waves-effect waves-purple"><b>Utilities</b></a></li>
                           </ul>
                         </div>
                       </nav>
                </header>

        <article>
          <div class="wrapper">
                  
                    <div class="aside aside1 z-depth-barts">
                        <div class="row">
                          <h2 class="thin center"> Reservations</h2>
                          <br>
                            <table id="example" class="mdl-data-table responsive-table" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Date of Reservation</th>
                                            <th>Venue</th>
                                            <th>Detail</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>January 1, 2016</td>
                                            <td>Manila Cathedral</td>
                                            <th><button class="waves-effect waves-light purple btn-flat white-text">Details</button></th>
                                            <td><a href="#update" class="modal-trigger"><i class="material-icons green-text">edit</i></a>
                                            <a href="#!"><i class="material-icons red-text">delete</i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>January 1, 2016</td>
                                            <td>Manila Cathedral</td>
                                            <th><button class="waves-effect waves-light purple btn-flat white-text">Details</button></th>
                                            <td><a href="#update" class="modal-trigger"><i class="material-icons green-text">edit</i></a>
                                            <a href="#!"><i class="material-icons red-text">delete</i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>January 1, 2016</td>
                                            <td>Manila Cathedral</td>
                                            <th><button class="waves-effect waves-light purple btn-flat white-text">Details</button></th>
                                            <td><a href="#update" class="modal-trigger"><i class="material-icons green-text">edit</i></a>
                                            <a href="#!"><i class="material-icons red-text">delete</i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br> <br>
                                <div class="row ">
                                  <div class="col s12">
                                    <div class="right">
                                      <a class="btn-floating btn-large waves-effect waves-light purple darken-3" href="calendar-view.jsp" target="_blank"><i class="material-icons">event</i></a>
                                   <a class="btn-floating btn-large waves-effect waves-light purple darken-3" href="create-reservation.jsp"><i class="material-icons">add</i></a>
                                    </div>                                  
                                  </div>
                                </div>
                        </div>           
                    </div>
          </div>
        </article>
  </div>
                

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/jquery-latest.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/package.js"></script>
    <script type="text/javascript" src="./js/datatables.min.js"></script>
    <script type="text/javascript" src="./js/datatables.material.min.js"></script>
    <script type="text/javascript" src="./js/addPackage.js"></script>


      <script type="text/javascript">
        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();
          }); 
    </script>
  

    <script type="text/javascript">
      $(document).ready(function() {
          $('#example').DataTable( {
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
              columnDefs: [
                  {
                      targets: [ 0, 1, 2 ],
                      className: 'mdl-data-table__cell--non-numeric',

                  },
              ]
          } );
      } );
    </script>

    <script type="text/javascript">
      $(document).ready(function() {
          $('#example').DataTable();
      } );
    </script>

    <script type="text/javascript">
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
      });
    </script>

    <script type="text/javascript">
    $(document).ready(function() {
       $('select').material_select();
     });
    </script>

  

    <script type="text/javascript">
        function enableService(datetime){
            var dtmstart = document.getElementById('datetimestart');
            var dtmend = document.getElementById('datetimeend');

            if(datetime.options[datetime.selectedIndex].value=='home'){
              dtmstart.disabled = false;
              dtmend.disabled = true;
              dtmend.value = '';
              dtmstart.value = '';
            }else if(datetime.options[datetime.selectedIndex].value=='event'){
              dtmstart.disabled = false;
              dtmend.disabled = false;
              dtmstart.value = '';
              dtmend.value = '';
            }
            return;
          }
    </script>

    

    <script type="text/javascript">
        $(function(){
          $('#package-list').change(function(){
            if ($(this).val()=='customize'){
              $('#servicelist').prop('disabled', false);
            }else{
              $('#servicelist').prop('disabled', true);
            }
          });
        });
    </script>
   
    <script type="text/javascript">
        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();
          }); 
    </script>

    <script type="text/javascript">
        function enableVIP(selectguest){
          guest = document.getElementById('reserve_customername');

          if(selectguest.options[selectguest.selectedIndex].value=='guest'){
            guest.disabled = false;
          }else{
            guest.disabled = true;
            guest.value = '';
          }
          return;
        }
    </script>

<!-- reservation schedule viewer -->
  </body>

</html>