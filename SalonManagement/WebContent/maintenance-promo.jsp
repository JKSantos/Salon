<!DOCTYPE html>
<html ng-app>
  

  <head>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-promo.css"/>

  <link rel="stylesheet" type="text/css" href="./css/dataTables.material.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css"/>

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
                        <a class="collapsible-header active"><b>Maintenance</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="maintenance-emp.jsp">Employee</a></li>
                              <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                              <li class="orange"><a href="maintenance-promo.jsp">Promo</a></li>
                              <li><a href="maintenance-discount.jsp">Discount</a></li>
                              <li><a href="#">Package</a></li>
                              <li><a href="#">Catalogue</a></li>
                              <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
                            </ul>
                          </div>
                      </li>
                      <li>
                        <a class="collapsible-header"><b>Transaction</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="#">Inventory</a></li>
                              <li><a href="#">Reservation</a></li>
                              <li><a href="#">VIP</a></li>
                              <li><a href="#">Product Order</a></li>
                              <li><a href="#">Walk-In</a></li>
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
                     <li><a href="admin-home.jsp" class="waves-effect"><b>Home</b></a>
                       <ul class="collapsible collapsible-accordion">
                         <li>
                           <a class="waves-effectcollapsible-header"><b>Maintenance</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="maintenance-emp.jsp">Employee</a></li>
                                 <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                 <li class="orange"><a href="maintenance-promo.jsp">Promo</a></li>
                                 <li><a href="maintenance-discount.jsp">Discount</a></li>
                                 <li><a href="#">Package</a></li>
                                 <li><a href="#">Catalogue</a></li>
                                 <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
                               </ul>
                             </div>
                         </li>
                         <li>
                           <a class="waves-effectcollapsible-header"><b>Transaction</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="#">Inventory</a></li>
                                 <li><a href="#">Reservation</a></li>
                                 <li><a href="#">VIP</a></li>
                                 <li><a href="#">Product Order</a></li>
                                 <li><a href="#">Walk-In</a></li>
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
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Promo Name</th>
                                        <th>Service/Product</th>
                                        <th>Price</th>
                                        <th>Expiration</th>
                                        <th>Date of Creation</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>New Year Promo</td>
                                        <td><button data-target="viewProdSvc" class="waves-effect waves-orange modal-view btn-flat orange lighten-4">View</button></td>
                                        <td>99.00</td>
                                        <td>01/01/01</td>
                                        <td>01/01/01</td>
                                        <td><button class="waves-effect waves-light btn-flat transparent black-text modal-trigger" title="Update" style="padding: 0px;" data-target="update" data-toggle="modal"><i class="material-icons">edit</i></button>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>
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
                        <form class="col s12">
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
                                              <input type="checkbox" class="filled-in" id="unli">
                                              <label for="unli">Non-Expiry</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6">
                                                 <input type="date" class="datepicker-promo" id="promoend" placeholder="Expiration"/>
                                            </div>
                                            <div class="input-field col s12">
                                                <input type="text" class="validate" id="promoname" required>
                                                <label for="promoname">Promo Name <span class="red-text">*</span></label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="promodetails" class="materialize-textarea" length="120"></textarea>
                                                <label for="promodetails">Description</label>
                                            </div>
                                            
                                            <div class="input-field col s5">
                                            <p class="center">
                                                <input type="checkbox" class="filled-in" id="free"/>
                                                <label for="free">Free</label>
                                            </p>
                                            </div>
                                            <div class="input-field col s6 offset-s1">
                                                <input type="text" class="validate right-align" id="promoprice" maxlength="8">
                                                <label for="promoprice">Promo Price</label>
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
                                              <select class="browser-default" id="promoService">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                    <option value="A">A</option>
                                                    <option value="B">B</option>
                                                    <option value="C">C</option>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="promoServiceQty" name="promoServiceQty" class="validate">
                                              <label for="promoServiceQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat orange" id="promoAddSvc" onclick="addServPromo()"><i class="material-icons">add</i></a>
                                          </div>
                                          <!--product  -->
                                          <div class="input-field col s8">
                                              <p style="color:#9e9e9e;font-size:12px;">Product </p>
                                          </div>
                                          <div class="input-field col s6" style="margin-top: -1px;">
                                              <select class="browser-default" id="promoProduct">
                                                    <option value="Choose..." disabled selected>Choose</option>
                                                    <option value="Daasdasdadas">ASDADADADAD</option>
                                                    <option value="E">E</option>
                                                    <option value="F">F</option>
                                                </select>
                                          </div>
                                          <div class="input-field col s3" style="margin-top: -1px;">
                                              <input type="number" id="promoProductQty" name="promoServiceQty" class="validate">
                                              <label for="promoProductQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat orange" onclick="addProdPromo()"><i class="material-icons">add</i></a>
                                          </div>
                                        <!-- end -->
                                        <!-- start table -->
                                          <div class="input-field col s12">
                                          <table class="centered">
                                            <thead>
                                              <tr>
                                                <th>Type</th>
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
                              <a href="#!" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
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
                                              <input type="number" id="updatePromoSQty" name="updatePromoSQty" class="validate">
                                              <label for="updatePromoSQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat orange" id="updatePromoAddSvc" onclick="updateServPromo()"><i class="material-icons">add</i></a>
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
                                              <input type="number" id="updatePromoPQty" name="updatePromoPQty" class="validate">
                                              <label for="updatePromoPQty">Qty</label>
                                          </div>
                                          <div class="input-field col s3 left-align" style="margin-top: -1px;">
                                              <a class="waves-effect waves-light btn-flat orange" id="updatePromoaddProd" onclick="updateProdPromo()"><i class="material-icons">add</i></a>
                                          </div>
                                        <!-- end -->
                                        <!-- start table -->
                                          <div class="input-field col s12">
                                          <table class="centered">
                                            <thead>
                                              <tr>
                                                <th>Type</th>
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
                              <a href="#!" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>


                          <div id="delete" class="modal">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p>Are you sure you want to deactivate this product/service??</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <button class="waves-effect waves-light orange btn-flat white-text">YES</button>
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
  </style>

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/maintenance-emp.js"></script>
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="./js/dataTables.material.min.js"></script>
  </body>


</html>