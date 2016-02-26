<!DOCTYPE html>
<html ng-app>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-catalogue.css"/>
  <link rel="stylesheet" type="text/css" href="./css/table.css">
  <link rel="stylesheet" type="text/css" href="./css/table.min.css">
    <!--Let browser know website is optimized for mobile-->
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
                                      <li><a href="maintenance-emp.jsp">Employee</a></li>
                                      <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                      <li><a href="maintenance-promo.jsp">Promo</a></li>
                                      <li><a href="maintenance-discount.jsp">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="maintenance-catalogue.jsp">Catalouge</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header active"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li class="orange"><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li><a href="transaction-walkin.jsp">Walk-In</a></li>
                                    </ul>
                                  </div>
                              </li>
                            </ul>
                          <li><a href="utilities.jsp" class="waves-effect waves-orange"><b>Utilities</b></a></li>
                        </ul>

                
                       <nav class="z-depth-0">
                         <div class="nav-wrapper orange">
                           <a href="#!" class="brand-logo white-text" style="margin-left: 30px;">Salon Management System</a>
                         
                           <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                           <ul class="side-nav" id="mobile-demo">
                             <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a>
                               <ul class="collapsible collapsible-accordion">
                                 <li>
                                   <a class="collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promo.jsp">Promo</a></li>
                                         <li><a href="maintenance-discount.jsp">Discount</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                         <li><a href="maintenance-catalogue.jsp">Catalouge</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="collapsible-header active"><b>Transaction</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li class="orange"><a href="transactions-inventory.jsp">Inventory</a></li>
                                         <li><a href="transactions-reservation.jsp">Reservation</a></li>
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
                              
                      <div class="aside aside2 z-depth-barts">
                                      <nav class="z-depth-0">
                                        <div class="nav-wrapper orange lighten-3 grey-text text-darken-4">
                                          <form>
                                            <div class="input-field col s12 z-depth-0">
                                              <input class="orange lighten-3" id="search" type="search" ng-model="name" placeholder="Search...">
                                              <label for="search"><i class="material-icons grey-text text-darken-3">search</i></label>
                                            </div>
                                          </form>
                                        </div>
                                      </nav>
                       <div class="row">
                           <div class="col s12">
                                      <h5>Inventory</h5>


                                        <table class="ui sortable celled table" ng-init="inventory=[{id: '1',name: 'Razer', quantity: '38', markupprice: '100.00', sellingprice: '150.00', profit: '50.00'},{id: '2',name: 'AMD', quantity: '50', markupprice: '300.00', sellingprice: '450.00', profit: '150.00'},{id: '3',name: 'NVIDIA', quantity: '40', markupprice: '200.00', sellingprice: '520.00', profit: '320.00'}]">
                                          <thead>
                                            <tr>
                                              <th data-sort="int" class="orange lighten-5">ID</th>
                                              <th data-sort="string" class="orange lighten-5">Name</th>
                                              <th data-sort="string" class="orange lighten-5">Quantity</th>
                                              <th data-sort="int" class="orange lighten-5">Mark Up Price (Peso)</th>
                                              <th data-sort="int" class="orange lighten-5">Selling Price (Peso)</th>
                                              <th data-sort="int" class="orange lighten-5">Profit (Peso)</th>
                                              <th class="no-sort orange lighten-5">Actions</th>
                                            </tr>
                                          </thead>
                                            <tbody >
                                               <tr ng-repeat="invent in inventory | filter:name | filter: quantity | filter: markupprice | filter: sellingprice | filter: profit | orderBy: 'id'">
                                                <td>{{ invent.id }}</td>
                                                  <td>{{invent.name}}</td>
                                                  <td><input style="width: 50px; color: black; margin-top: 10px;" id="{{invent.id}}" type="number" value="{{invent.quantity}}"/></td>
                                                  <td>{{invent.markupprice}}</td>
                                                  <td><input style="width: 70px; color: black; margin-top: 10px;" id="{{invent.id}}" type="text" value="{{invent.sellingprice}}"/></td>
                                                  <td>{{invent.profit}}</td>
                                                  <td><a href="#update" action="update();" id="edit" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons" >edit</i></a></td>
                                                  </tr>
                                            </tbody>
                                          </table>
                                          
                                             <!-- <c:forEach items="${empList}" var="employee">
                                             <tr>
                                              <td>${employee.intEmpID}</td>
                                                <td>${employee.strEmpFirstName} ${employee.strEmpLastName}</td>
                                                <td>Cashier</td>
                                                <td><a href="#update" style="padding: 0px;" class="waves-effect waves-orange modal-trigger transparent btn-flat"><i class="material-icons">edit</i></a><button style="padding: 0px; margin-left:15px;" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons">delete</i></button></td>
                                                </tr>
                                              </c:forEach>  -->
                                            
                      

                                        <ul class="pagination right">
                                              <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                                              <li class="active orange"><a href="#!">1</a></li>
                                              <li class="waves-effect"><a href="#!">2</a></li>
                                              <li class="waves-effect"><a href="#!">3</a></li>
                                              <li class="waves-effect"><a href="#!">4</a></li>
                                              <li class="waves-effect"><a href="#!">5</a></li>
                                              <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                                            </ul>  
                              </div>
                          </div>
                        </div>
               
        </article>
  </div>
                
  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/jquery-latest.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    <script type="text/javascript" src="./js/addToProductList.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/package.js"></script>
    <script type="text/javascript" src="./js/stupidtable.js"></script>
    <script type="text/javascript" src="./js/stupidtable.min.js"></script>

    <script type="text/javascript">
        $("table").stupidtable();
    </script>

    <script type="text/javascript">
      $( document ).ready(function(){
        $(".button-collapse").sideNav();
          // Initialize collapsible (uncomment the line below if you use the dropdown variation)
        $('.collapsible').collapsible();
      });
    </script>

    <script type="text/javascript">
      $(document).ready(function() {
          $('select').material_select();
        });
    </script>

  </body>

</html>