<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/trans-reservation.css"/><!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>

  <body class="blue-grey lighten-5">
  <div class="wrapper">
        <header class="headnav">
                        <ul id="slide-out" class="side-nav fixed z-depth-0">
                          <div class="center">
                              <img src="./img/anon.jpg" class="circle" style="width: 150px; height: 150px; margin-top: 40px; margin-bottom: 20px;">
                            </div>
                          <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a></li>
                         <!--  <li class="no-padding"> -->
                            <ul class="collapsible" data-collapsible="accordion">
                              <li>
                                <a class="collapsible-header"><b>Maintenance</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="maintenance-emp.jsp">Employees</a></li>
                                      <li><a href="maintenance-prodsvc.jsp">Products & Services</a></li>
                                      <li><a href="maintenance-promdisc.jsp">Promos & Discounts</a></li>
                                      <li><a href="maintenance-package.jsp">Packages</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header"><b>Transactions</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li class="orange"><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li><a href="#!">Walk-In</a></li>
                                    </ul>
                                  </div>
                              </li>
                            </ul>
                          <li><a href="utilities.jsp" class="waves-effect waves-orange"><b>Utilities</b></a></li>
                        </ul>

                
                       <nav class="z-depth-0">
                         <div class="nav-wrapper orange">
                           <a href="#!" class="brand-logo white-text" style="margin-left: 30px;">Generic Salon System</a>
                         
                           <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                           <ul class="side-nav" id="mobile-demo">
                             <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a>
                               <ul class="collapsible collapsible-accordion">
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employees</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Products & Services</a></li>
                                         <li><a href="maintenance-promdisc.jsp">Promos & Discounts</a></li>
                                         <li><a href="maintenance-package.jsp">Packages</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Transactions</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li class="orange"><a href="transactions-reservation.jsp">Reservation</a></li>
                                         <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                         <li><a href="#!">Walk-In</a></li>
                                       </ul>
                                     </div>
                                 </li>
                               </ul>
                              <li><a href="utilities.jsp" class="waves-effect waves-orange"><b>Utilities</b></a></li>
                           </ul>
                         </div>
                       </nav>
                </header>

        <article>
          <div class="wrapper">
                    <div class="aside aside1 z-depth-barts">
                    <div class="container">
                      <div class="row">
                          <form class="col s12">
                              <div class="input-field col s12">
                                  <h4>Add Reservation</h4>
                              </div>
                                <div class="input-field col s6">
                                    <select id="reserve_eventhome" onchange="enableService(this);">
                                          <option value="choose" disabled selected>Choose...</option>
                                          <option value="event">Event</option>
                                          <option value="home">Home Service</option>
                                    </select>
                                    <label>Service</label>
                                </div>
                                <div class="input-field col s3">
                                    <input type="date" class="datepicker" id="datetimestart" placeholder="Date Start" disabled="disabled">
                                </div>
                                <div class="input-field col s3">
                                    <input type="date" class="datepicker" id="datetimeend" placeholder="Date End" disabled="disabled">
                                </div>
                              <div class="input-field col s12">
                                  <select id="" onchange="enableVIP(this);">
                                        <option value="1">VIP 1</option>
                                        <option value="2">VIP 2</option>
                                        <option value="3">VIP 3</option>
                                        <option value="guest" Selected>Guest</option>
                                  </select>
                                  <label>VIP List</label>
                              </div>
                              <div class="input-field col s12">
                                  <input type="text" class="validate" name="reserve_customername" id="reserve_customername" required>
                                  <label for="reserve_customername">Guest Name</label>
                              </div>
                              <div class="input-field col s12">
                                  <input type="text" class="validate" id="reserve_venue">
                                  <label for="reserve_venue">Venue</label>
                              </div>
                              <div class="input-field col s6">
                                  <select id="package-list">
                                        <option value="" disabled selected>Choose your option</option>
                                        <option value="1">Package 1</option>
                                        <option value="2">Package 2</option>
                                        <option value="3">Package 3</option>
                                        <option value="customize">Custom</option>
                                  </select>
                                  <label>Package Available</label>
                              </div>
                              <div class="input-field col s6" stype="margin-top: -10px;">
                                  <select id="servicelist" disabled="disabled" multiple>
                                        <option value="" disabled selected>Choose your option</option>
                                        <option value="1">Service 1</option>
                                        <option value="2">Service 2</option>
                                        <option value="3">Service 3</option>
                                  </select>
                                  <label>Service Available</label>
                              </div>
                              <div class="input-field col s5">
                                  <input type="text" class="validate" id="reserve_headcount" maxlength="4">
                                  <label for="reserve_headcount">Head Count</label>
                              </div>
                              <div class="input-field col s5 offset-s2">
                                  <input type="text" class="validate right-align" id="reserve_downpayment" maxlength="10">
                                  <label for="reserve_downpayment">Down Payment</label>
                              </div>
                              <div class="col s12">
                                  <button id="reservetn" type="submit" value="Submit" class="waves-effect waves-light orange btn-flat" style="margin-top:10px;">ADD</button>
                                  <button id="reserveclear" type="reset" value="Reset" class="waves-effect waves-orange white btn-flat" style="margin-top:10px;">CLEAR</button>
                              </div>

                          </form>
                      </div>
                    </div>

                     

                    </div>


                    <div class="aside aside2 z-depth-barts">
                      <div class="row">
                          <div class="col s12">
                              <h4 style="margin-top: 30px;">Reservation Calendar</h4>
                          </div>
                      </div>
                    </div>
          </div>
        </article>

        

  </div>
                



    

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>

    <script type="text/javascript">
      $( document ).ready(function(){

        $(".button-collapse").sideNav();
            
        
      });
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