<!DOCTYPE html>
<html>
  <head>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/trans-prodorder.css"/>
    <!--Let browser know website is optimized for mobile-->
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
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="packageMaintenance">Package</a></li>
                                      <li><a href="packageMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Charge</a></li>
                                      <li><a href="locationMaintenance">Location</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header active"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-vip.jsp">VIP</a></li>
                                      <li class="purple lighten-4"><a href="transactions-productorder.jsp">Product Sales</a></li>
                                      <li><a href="transactions-walkin.jsp">Walk-In</a></li>
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
                                         <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
                                         <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-purple collapsible-header"><b>Transaction</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                         <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                         <li class="purple"><a href="transactions-productorder.jsp">Product Sales</a></li>
                                         <li><a href="#!">Walk-In</a></li>
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
                    
                    <div class="aside aside2 z-depth-barts">
                    <div class="row">
                      <h2 class="thin">Product Sales</h2>
                        <nav class="z-depth-0">
                          <div class="nav-wrapper grey lighten-3 grey-text text-darken-4">
                            <form>
                              <div class="input-field col s12 z-depth-0">
                                <input class="grey lighten-1" id="search" type="search" required>
                                <label for="search"><i class="material-icons grey-text text-darken-3">search</i></label>
                              </div>
                            </form>
                          </div>
                        </nav>
                      <!-- <div class="container"> -->
                        <table class="centered highlight responsive-table">
                          <thead>
                            <tr>
                                <th data-field="name">Item Name</th>
                                <th data-field="quantity">Quantity</th>
                                <th data-field="price">Item Price</th>
                            </tr>
                          </thead>

                          <tbody>
                          <c:forEach items="${productList}" var="product">
                          	<tr>
                            <td>${product.intProductID}</td>
                                    <td>${product.strProductName}</td>
                                
                                    <td>${product.dblProductPrice}</td>
                                    <td><a href="#update" style="padding: 0px;" class="waves-effect waves-purple modal-trigger transparent btn-flat"><i class="material-icons">edit</i></a><button style="padding: 0px; margin-left:15px;" class="waves-effect waves-purple transparent btn-flat"><i class="material-icons">delete</i></button></td>
                                    </tr>
                                  </c:forEach>
                          </tbody>
                        </table>
                        <br>

                        <div class="row right">
                          <a class="btn-floating btn-large waves-effect waves-light purple darken-3" href="create-salesorder.jsp"><i class="material-icons">add</i></a>
                        </div>
                        </div>
                      <!-- </div> -->
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
    $(document).ready(function() {
        $('select').material_select();
      });
    </script>

    <script type="text/javascript">
        function enableAddress(selectorder){
          var order_ad = document.getElementById('order_address');

          if(selectorder.options[selectorder.selectedIndex].value=='delivery'){
            order_ad.disabled = false;
          }
          else{
            order_ad.disabled = true;
            order_ad.value = '';
          }
          return;
        }
    </script>
   
   <script type="text/javascript">
      function enableQty(selProd){
        var order_prod = document.getElementById('order_prodquantity');
        var order_price = document.getElementById('order_prodprice');

        if(selProd.options[selProd.selectedIndex].value!=''){
          order_prod.disabled = false;
          order_price.disabled = false;
        }else{
          order_prod.disabled = true;
          order_price.disabled = true;
          order_prod.value = '';
          order_price.value = '';

        }
        return;
      }
   </script>
 

  </body>

</html>