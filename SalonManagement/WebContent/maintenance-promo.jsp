<!DOCTYPE html>
<html ng-app>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Product"%>
  <%@ page import="com.gss.model.Service"%>
  <%@ page import="com.gss.model.Promo"%>

  <head>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-promo.css"/>

  <link rel="stylesheet" type="text/css" href="./css/bartstable.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>

  <body class="purple lighten-5">
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
                        <a class="collapsible-header active"><b>Maintenance</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="employeeMaintenance">Employee</a></li>
                              <li><a href="productServiceMaintenance">Product & Service</a></li>
                              <li><a href="catalogueMaintenance">Catalogue</a></li>
                              <li><a href="packageMaintenance">Package</a></li>
                              <li><a href="locationMaintenance">Delivery Charge</a></li>
                              <li><a href="extraChargeMaintenance">Other Charge</a></li>
                              <li class="purple lighten-4"><a href="promoMaintenance">Promo</a></li>
                              <li><a href="discountMaintenance">Discount</a></li>
                            </ul>
                          </div>
                      </li>
                      <li>
                        <a class="collapsible-header"><b>Transaction</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="transactions-inventory.jsp">Inventory</a></li>
                              <li><a href="transactions-reservation.jsp">Reservation</a></li>
                              <li><a href="transactions-vip.jsp">VIP</a></li>
                              <li><a href="transactions-productorder.jsp">Product Order</a></li>
                              <li><a href="transactions-walkin.jsp">Walk-In</a></li>
                            </ul>
                          </div>
                      </li>
                    </ul>
                  <li><a href="utilities.jsp" class="waves-effect"><b>Utilities</b></a></li>
                </ul>

        
               <nav class="z-depth-0">
                 <div class="nav-wrapper purple darken-4">
                   <a href="#!" class="brand-logo purple-text text-lighten-5" style="margin-left: 30px;">Salon Management System</a>
                 
                   <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                   <ul class="side-nav" id="mobile-demo">
                     <li><a href="admin-home.jsp" class="waves-effect"><b>Home</b></a>
                       <ul class="collapsible collapsible-accordion">
                         <li>
                           <a class="waves-effectcollapsible-header"><b>Maintenance</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li class="purple lighten-4"><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
                               </ul>
                             </div>
                         </li>
                         <li>
                           <a class="waves-effectcollapsible-header"><b>Transaction</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="transactions-inventory.jsp">Monitor Product</a></li>
                                 <li><a href="transactions-reservation.jsp">Manage Reservation</a></li>
                                 <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                 <li><a href="transactions-vip.jsp">VIP</a></li>
                                 <li><a href="transactions-walkin.jsp">Walk In</a></li>
                               </ul>
                             </div>
                         </li>
                       </ul>
                    <li><a href="utilities.jsp" class="waves-effect"><b>Utilities</b></a></li>
                   </ul>
                 </div>
               </nav>
        </header>

        <article>
        <!-- <div class="container"> -->
          <div class="wrapper">
<!--                     <div class="aside aside1 z-depth-barts">
                    
                    </div> -->

                    <div class="main z-depth-barts" style="margin-left: 20px; margin-right: 20px;">
                        <div class="col s12" style="margin-left: 20px; margin-right: 20px;">
                        <h3 class="grey-text text-darken-1">Promo Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat purple darken-2 darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                              <thead>
                                  <tr>
                                      <th><center>Promo Name</center></th>
                                      <th><center>Price</center></th>
                                      <th><center>Expiration</center></th>
                                      <th>Actions</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <!-- <tr>
                                      <td>1</td>
                                      <td>New Year Promo</td>
                                      <td><button data-target="viewProdSvc" class="waves-effect waves-purple modal-view btn-flat purple lighten-4">View</button></td>
                                      <td>99.00</td>
                                      <td>01/01/01</td>
                                      <td>01/01/01</td>
                                      <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#update" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                      <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                      </td>
                                  </tr>    -->
                                <c:forEach items="${promoList}" var="promo">
                                  <tr>
                                      <td style="padding:0; margin:0;"><center>${promo.strPromoName}</center></td>
                                      <td style="padding:0; margin:0;"><center>Php ${promo.dblPromoPrice}</center></td>
                                      <td style="padding:0; margin:0;"><center>${promo.strPromoAvailability}</center></td>
                                      <td class="center" style="padding:0; margin:0;"><button data-target="viewProdSvc" class="waves-effect waves-purple modal-view btn-flat transparent" style="padding-left: 10px;padding-right:10px; margin: 5px;"><i class="material-icons">visibility</i></button>
                                      <a class="waves-effect waves-purple modal-trigger btn-flat transparent black-text" title="Update" href="#update" style="padding-left: 10px;padding-right:10px; margin: 5px;"><i class="material-icons">edit</i></a>
                                      <a class="waves-effect waves-purple modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate" style="padding-left: 10px;padding-right:10px; margin: 5px;"><i class="material-icons">delete</i></a>
                                      </td>
                                  </tr>
                                </c:forEach>                                  
                              </tbody>
                        </table>

                      </div>

                      <!-- view product and service modal -->
                          <div id="viewProdSvc" class="modal">
                            <div class="modal-content">
                              <!-- <div class="container"> -->
                              <div class="row">
                                <h5 class="grey-text text-darken-1">Services & Products Included</h5>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" disabled="disabled" id="promoViewName" name="promoViewName">
                                  <label for="promoViewName">Promo Name</label>
                                </div>
                                <table class="centered responsive-table">
                                  <thead>
                                    <tr>
                                        <th data-field="viewService">Service</th>
                                        <th data-field="viewServiceQty">Qty</th>
                                        <th data-field="viewProduct">Product</th>
                                        <th data-field="viewProductQty">Qty</th>
                                    </tr>
                                  </thead>

                                  <tbody>
                                    <tr>
                                      <td>Service 1</td>
                                      <td>1</td>
                                      <td>Product 1</td>
                                      <td>1</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                        </div>

                      <!-- end view product and service modal -->

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" action="createPromo" method="get" id="createPromoForm">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1">Create Promo</h4>
                                  <div class="aside aside1 z-depth-barts" style="padding: 10px;">
                                    <div class="row">
                                            <h5 class="grey-text text-darken-1">Promo Information</h5>
                                            <div class="input-field col s12" style="margin-bottom: 30px;">
                                                <label class="red-text"> (*) Indicates required field</label>
                                            </div>
                                            <div class="input-field col s8 offset-s2" style="margin-bottom: 20px;">

                                            <label><b>Availability <span class="red-text">*</span></b></label>
                                            </div>
                                            <div class="input-field col s6">
                                            <p class="center">
                                              <input type="checkbox" class="filled-in nonexpiry filltwo" id="unli" name="strNonExp">
                                              <label for="unli">Non-Expiry</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6">
                                                 <input name="strExp" type="date" class="datepicker-promo expiration filltwo" id="promoend" placeholder="Expiration"/>
                                            </div>
                                            <div class="input-field col s12">
                                                <input name="strPromoName" type="text" class="validate specialname noSpace" id="promoname" required placeholder="Promo Name">
                                                <label for="promoname" class="active">Promo Name<span class="red-text">*</span></label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea name="strPromoDesc" id="promodetails" class="materialize-textarea noSpace" minlength="5" placeholder="Description"></textarea>
                                                <label for="promodetails" class="active">Description</label>
                                            </div>
                                            
                                            <div class="input-field col s5">
                                            <p class="center">
                                                <input name="strFree" type="checkbox" class="filled-in free fillone" id="free"/>
                                                <label for="free">Free</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6 offset-s1">
                                                <input name="dblPromoPrice" type="text" class="validate right-align price amountFormat noSpace fillone" id="promoprice" maxlength="8" placeholder="Amount">
                                                <label for="promoprice" class="active">Price</label>
                                            </div>
                                    </div>
                                  </div>
                                  <div class="aside aside2 z-depth-barts" style="padding: 10px;">
                                      <div class="row">
                                        <!-- service -->
                                          <h5 class="grey-text text-darken-1">Included Service/s and Product/s</h5>
                                          <div class="input-field col s8">
                                              <p style="color:#9e9e9e;font-size:12px;">Service </p>
                                          </div>
                                          <div class="input-field col s6" style="margin-top: -1px;">
                                              <select class="browser-default fillthree" id="promoService">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                    <c:forEach items="${serviceList}" var="service">
                                                      <option value="${service.strServiceName}">${service.strServiceName}</option>
                                                    </c:forEach>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="promoServiceQty" name="promoServiceQty" class="validate" min="0">
                                              <label for="promoServiceQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat purple" id="promoAddSvc" onclick="addServPromo()"><i class="material-icons white-text">add</i></a>
                                          </div>
                                          <!--product  -->
                                          <div class="input-field col s8">
                                              <p style="color:#9e9e9e;font-size:12px;">Product </p>
                                          </div>
                                          <div class="input-field col s6" style="margin-top: -1px;">
                                              <select class="browser-default fillthree" id="promoProduct">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                    <c:forEach items="${productList}" var="product">
                                                      <option value="${product.strProductName}">${product.strProductName}</option>
                                                    </c:forEach>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="promoProductQty" name="promoServiceQty" class="validate" min="0">
                                              <label for="promoProductQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat purple" onclick="addProdPromo()"><i class="material-icons white-text">add</i></a>
                                          </div>
                                        <!-- end -->
                                        <!-- start table -->
                                          <div class="input-field col s12">
                                          <table class="centered">
                                            <thead>
                                              <tr>
                                                <th>Name</th>
                                                <th>Qty</th>
                                                <th>Action</th>
                                              </tr>
                                            </thead>
                                            <table class="highlight centered responsive-table" id="promoTable">
                                            </table>
                                            </table>
                                            
                                          </div>
                                        <!-- end table -->
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <a href="#!" class=" modal-action modal-close waves-effect waves-purple transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light purple darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>

                        <div id="update" class="modal modal-fixed-footer">
                        <form class="col s12">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1">Update Promo</h4>
                                  <div class="aside aside1 z-depth-barts" style="padding: 10px;">
                                    <div class="row">
                                            <h5 class="grey-text text-darken-1">Promo Information</h5>
                                            <div class="input-field col s8 offset-s2" style="margin-bottom: 20px;">
                                              <label><b>Availability</b></label>
                                            </div>
                                            <div class="input-field col s6">
                                            <p class="center">
                                              <input type="checkbox" class="filled-in" id="updateNonExpiry">
                                              <label for="updateNonExpiry">Non-Expiry</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6">
                                                 <input type="date" class="datepicker-promo" id="updatePromoEnd" placeholder="Expiration"/>
                                            </div>
                                            <div class="input-field col s12">
                                                <input type="text" class="validate" id="updatePromoName" required>
                                                <label for="updatePromoName">Promo Name</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="updatePromoDetails" class="materialize-textarea" length="120"></textarea>
                                                <label for="updatePromoDetails">Description</label>
                                            </div>
                                            
                                            <div class="input-field col s5">
                                            <p class="center">
                                                <input type="checkbox" class="filled-in" id="updatePromoFree"/>
                                                <label for="updatePromoFree">Free</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6 offset-s1">
                                                <input type="text" class="validate right-align" id="updatePromoPrice" maxlength="8">
                                                <label for="updatePromoPrice">Promo Price</label>
                                            </div>
                                    </div>
                                  </div>
                                  <div class="aside aside2 z-depth-barts" style="padding: 10px;">
                                      <div class="row">
                                        <!-- service -->
                                          <h5 class="grey-text text-darken-1">Service/s and Product/s Included </h5>
                                          <div class="input-field col s8">
                                              <p style="color:#9e9e9e;font-size:12px;">Service </p>
                                          </div>
                                          <div class="input-field col s6" style="margin-top: -1px;">
                                              <select class="browser-default" id="updatePromoService">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="updatePromoSQty" name="updatePromoSQty" class="validate" min="0">
                                              <label for="updatePromoSQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat purple" id="updatePromoAddSvc" onclick="updateServPromo()"><i class="material-icons">add</i></a>
                                          </div>
                                          <!--product  -->
                                          <div class="input-field col s8">
                                              <p style="color:#9e9e9e;font-size:12px;">Product </p>
                                          </div>
                                          <div class="input-field col s6" style="margin-top: -1px;">
                                              <select class="browser-default" id="updatePromoProduct">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="updatePromoPQty" name="updatePromoPQty" class="validate" min="0">
                                              <label for="updatePromoPQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat purple" id="updatePromoaddProd" onclick="updateProdPromo()"><i class="material-icons">add</i></a>
                                          </div>
                                        <!-- end -->
                                        <!-- start table -->
                                          <div class="input-field col s12">
                                          <table class="centered">
                                            <thead>
                                              <tr>
                                                <th>Name</th>
                                                <th>Qty</th>
                                                <th>Action</th>
                                              </tr>
                                            </thead>
                                            <table class="highlight centered responsive-table" id="updatePromoTable">
                                            </table>
                                            </table>
                                            
                                          </div>
                                        <!-- end table -->
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <a href="#!" class=" modal-action modal-close waves-effect waves-purple transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light purple darken-3 white-text btn-flat" type="submit" value="Submit">SAVE</button>
                          </div>
                          </form>
                    </div>


                          <div id="delete" class="modal">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p>Are you sure?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <button class="waves-effect waves-light purple btn-flat white-text">YES</button>
                                <a href="#" class="modal-action modal-close waves-effect waves-light transparent btn-flat black-text">NO</a>
                              </div>
                            </div>
                      </div>
<!--                     <div class="aside aside2 z-depth-barts">
                     
                    </div> -->
                </div>
        </div>
      <!-- </div> -->
        </article>

        

  </div>

  <style type="text/css">
  #create {
    width: 75% !important;
    height: 80% !important;
    max-height: 100% !important;
  }
  #update{
    width: 75% !important;
    height: 80% !important;
    max-height: 100% !important;
  }
  #delete {
    width: 30% !important;
  }
  #viewProdSvc {
    width: 40% !important;
  }
  .error {
    color: red;
  }
  </style>

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/maintenance-emp.js"></script>
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="./js/bartstable.js"></script>
    <script type="text/javascript" src="./js/priceformat.js"></script>
    <script type="text/javascript" src="./js/jquery.validate.js"></script>
    <script type="text/javascript" src="./js/additional-methods.js"></script>
    <script type="text/javascript" src="./js/validation.js"></script>

    <script type="text/javascript">
    $('.amountFormat').priceFormat({
      prefix: '',
      centsSeparator: '.',
      centsLimit: 2,
      limit: 8,
      thousandsSeparator: ','
    });
    </script>

  </body>


</html>