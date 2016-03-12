<!DOCTYPE html>
<html ng-app>
  <head>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                          <li><a href="admin-home.jsp" class="waves-effect"><b>Home</b></a></li>
                         <!--  <li class="no-padding"> -->
                            <ul class="collapsible" data-collapsible="accordion">
                              <li>
                                <a class="collapsible-header"><b>Maintenance</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="packageMaintenance">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header active"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li class="orange"><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-vip.jsp">VIP</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li><a href="transaction-walkin.jsp">Walk-In</a></li>
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
                                   <a class="collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promo.jsp">Promo</a></li>
                                         <li><a href="maintenance-discount.jsp">Discount</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                         <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
                                         <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
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
                          <h2 class="thin center">Inventory</h2>
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
                                        <table class="ui sortable celled table" ng-init="inventory=[{id: '1',name: 'Razer', quantity: '38', markupprice: '100.00', sellingprice: '150.00', profit: '50.00'},{id: '2',name: 'AMD', quantity: '50', markupprice: '300.00', sellingprice: '450.00', profit: '150.00'},{id: '3',name: 'NVIDIA', quantity: '40', markupprice: '200.00', sellingprice: '520.00', profit: '320.00'}]" id="quantityTable">
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
                                                <c:forEach items="${productList}" var="product">
                                                          <td>${product.intProductID}</td>
                                                          <td>${product.strProductName}</td>
                                                          <td>${product.intProductQuantity}</td>
                                                          <td></td>
                                                            <td>${product.dblProductPrice}</td>
                                                            <td></td>
                                                            <td>
                                                            <a style="padding: 0px;" class="waves-effect waves-orange modal-trigger transparent btn-flat" href="#editModal" onclick="editQuantity(this)"><i class="material-icons">edit</i>
                                                            </a>
                                                            <button style="padding: 0px; margin-left:15px;" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons">delete</i>
                                                            </button>
                                                          </td>
                                                         </tr> 
                                                          </c:forEach>
                                                    
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
                            <a class="btn waves-effect waves-light orange darken-3">SAVE</a><br>
                        </div>
        </article>
           <!-- Modal Structure -->
           <div id="editModal" class="modal">
             <div class="modal-content">
               <h4 class="thin">Add/Update Price/Quantity</h4>
               <p id="p1"></p>

                <div class="container">
                  <form>
                    <div class="input-field col s6">
                        <input type="number" class="validate" id="quantity">
                        <label for="quantity">Quantity</label>
                    </div>
                    <div class="input-field col s6">
                        <input type="number" class="validate" id="price">
                        <label for="price">Price</label>
                    </div>
                    <div class="modal-footer">
                      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
                      <button class="btn orange darken-4 white-text" type="submit">SUBMIT</button>
                    </div>
                  </form>
                </div>
             </div>   
           </div>
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
      function editQuantity(row){
          alert("enable!");
          var i=row.parentNode.parentNode.rowIndex;
          var quantityName = document.getElementById("quantityTable").rows[i].cells[1].innerHTML;
          alert(quantityName);
          var text = document.getElementById("p1");
          text.innerHTML = "Add/ Update Price or Quantity for " + quantityName;
      }
      function updateQuantiy(row){
         alert("edit!");
          var i=row.parentNode.parentNode.rowIndex;
          var quantityCountText = document.getElementById("quantityTable").rows[i].cells[2].innerHTML;
          var quantityPriceText = document.getElementById("quantityTable").rows[i].cells[3].innerHTML;
          var quantCount = document.getElementById("quantity");
          var quantPrice = document.getElementById("price");

          quantityCountText.innerHTML = quantCount;
          quantityPriceText.innerHTML = quantPrice;

      }
    </script>

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

    <script type="text/javascript">
      $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
      });
    </script>

  </body>

</html>