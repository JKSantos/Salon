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
                          <li><a href="admin-home.jsp" class="waves-effect"><b>Home</b></a></li>
                         <!--  <li class="no-padding"> -->
                            <ul class="collapsible" data-collapsible="accordion">
                              <li>
                                <a class="collapsible-header"><b>Maintenance</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="employeeMaintenance.action">Employee</a></li>
                                      <li><a href="productServiceMaintenance.action">Product & Service</a></li>
                                      <li><a href="maintenance-promo.jsp">Promo</a></li>
                                      <li><a href="discountMaintenance.action">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance.action">Extra Charge</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li class="orange"><a href="transactions-walkin.jsp">Walk-In</a></li>
                                    </ul>
                                  </div>
                              </li>
                            </ul>
                          <li><a href="utilities.jsp" class="waves-effect"><b>Utilities</b></a></li>
                        </ul>

                
                       <nav class="z-depth-0">
                         <div class="nav-wrapper orange">
                           <a href="#!" class="brand-logo white-text" style="margin-left: 30px;">Salon Management System</a>
                         
                           <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                           <ul class="side-nav" id="mobile-demo">
                             <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a>
                               <ul class="collapsible collapsible-accordion">
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promo.jsp">Promo</a></li>
                                         <li><a href="maintenance-discount.jsp">Discount</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                         <li><a href="maintenance-catalouge.jsp">Catalogue</a></li>
                                         <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Transactions</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                         <li class="orange"><a href="transactions-reservation.jsp">Reservation</a></li>
                                         <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                         <li><a href="transaction-walkin.jsp">Walk-In</a></li>
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
                                  <h4>Walk-In</h4>
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
                                  <select id="servicelist"  multiple>
                                        <option value="" disabled selected>Choose your option</option>
                                        <option value="1">Service 1</option>
                                        <option value="2">Service 2</option>
                                        <option value="3">Service 3</option>
                                  </select>
                                  <label>Service Available</label>
                              </div>
                              
                              <div class="input-field col s12" stype="margin-top: -10px;">
                                  <select id="stylistlist"  multiple>
                                        <option value="" disabled selected>Choose your option</option>
                                        <option value="1">Service 1</option>
                                        <option value="2">Service 2</option>
                                        <option value="3">Service 3</option>
                                  </select>
                                  <label>Stylist Available</label>
                              </div>
                          
                              <div class="col s12">
                                  <button id="reservetn" type="submit" value="Submit" class="waves-effect waves-light orange btn-flat  modal-trigger" style="margin-top:10px;" data-target="summaryModal">CREATE</button>
                                  <button id="reserveclear" type="reset" value="Reset" class="waves-effect waves-orange white btn-flat" style="margin-top:10px;">CLEAR</button>
                              </div>

                          </form>
                      </div>
                    </div>

                     <div id="summaryModal" class="modal modal-fixed-footer">
                        <form>
                          <div class="modal-content">
                            <h3 class="orange-text text-darken-3 thin">Summary of Reservation</h3>
                            <div class="container">
                              <div class="row">
                                <table class="center highlight">
                                        <thead>
                                          <tr>
                                              <th data-field="id">Service</th>
                                              <th data-field="name">Descriptioin</th>
                                              <th data-field="price">Service Price</th>
                                          </tr>
                                        </thead>

                                        <tbody>
                                          <tr>
                                            <td>Haircut</td>
                                            <td>Short</td>
                                            <td>$0.87</td>
                                          </tr>
                                          <tr>
                                            <td>Rebond</td>
                                            <td>Hot oil</td>
                                            <td>$3.76</td>
                                          </tr>
                                          <tr>
                                            <td>Spa</td>
                                            <td>Full body</td>
                                            <td>$7.00</td>
                                          </tr>
                                        </tbody>
                                      </table>
                              </div>
                              <div class="row">
                                <h5 class="thin col s6">Total Amount: </h5>
                                <h5 class="thin col s6">Php 2,500.00</h5>
                              </div>   

                               <div class="row">
                                <h5 class="thin col s6">Down Payment: </h5>
                                <h5 class="thin col s6">Php 1,250.00</h5>
                              </div>
        
                            </div>
                          </div>
                         <div class="modal-footer">
                            <a href="#" class="modal-action modal-close waves-orange btn-flat transparent">Cancel</a>
                           <button class="modal-action waves-effect waves-light orange btn-flat ">Confirm</button>
                         </div>
                         </form>
                    </div>
                     

                    </div>


                    <div class="aside aside2 z-depth-barts">
                      <div class="row">
                          <div class="col s12">
                              <h4 style="margin-top: 30px;">List of Walk In</h4>
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