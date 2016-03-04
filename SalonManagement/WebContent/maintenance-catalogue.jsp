<!DOCTYPE html>
<html ng-app>
  

  <head>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-emp.css"/>

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
                              <li><a href="maintenance-promo.jsp">Promo</a></li>
                              <li><a href="maintenance-discount.jsp">Discount</a></li>
                              <li><a href="maintenance-package.jsp">Package</a></li>
                              <li class="orange"><a href="maintenance-catalogue.jsp">Catalogue</a></li>
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
                                 <li><a href="maintenance-promo.jsp">Promo</a></li>
                                 <li><a href="maintenance-discount.jsp">Discount</a></li>
                                 <li><a href="maintenance-package.jsp">Package</a></li>
                                 <li class="orange"><a href="maintenance-catalogue.jsp">Catalogue</a></li>
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
                        <h3 class="grey-text text-darken-1">Catalogue Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Type</th>
                                        <th>Description</th>
                                        <th>Price</th>
                                        <th>Date of Creation</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mohawk</td>
                                        <td>Senior Cut</td>
                                        <td>desciption</td>
                                        <td>99.00</td>
                                        <td>01/01/01</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#update" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>


                                    
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Create Catalogue</h3>
                                </div>
                                <div class="col s12">
                                     <label class="red-text">(*) Indicates required field</label>
                                </div>
                                <div class="col s12">
                                    <img name="createCatalogue" id="createCatalogue" style="width: 150px; height: 150px; margin-top: 20px;" src="./img/product.png" alt=""/>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                    <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadCreateCatalogue(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="strPath" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Type <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s8 offset-s2" style="margin-top: -1px;">
                                  <select class="browser-default" required >
                                    <option value="" disabled="disabled" selected></option>
                                  </select>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" class="validate" required id="prodsvcName" name="prodsvcName">
                                  <label for="prodsvcName">Name <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <textarea id="prodsvcDetail" name="prodsvcDetail" class="materialize-textarea"></textarea>
                                  <label for="prodsvcDetail">Details</label>
                                </div>
                                <div class="input-field col s3 offset-s7" style="margin-top: 20px;">
                                    <input type="text" class="validate right-align" id="prodsvcPrice" name="prodsvcPrice">
                                    <label for="prodsvcPrice">Price <span class="red-text">*</span></label>
                                </div>
                              
                            <!-- </div> -->
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
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Update Catalogue</h3>
                                </div>
                                <div class="col s12">
                                    <img name="updateCatalogue" id="updateCatalogue" style="width: 150px; height: 150px; margin-top: 20px;" src="./img/product.png" alt=""/>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                    <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadUpdateCatalogue(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="strPath" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Type</p>
                                </div>
                                <div class="input-field col s8 offset-s2" style="margin-top: -1px;">
                                  <select class="browser-default" required >
                                    <option value="" disabled="disabled" selected></option>
                                  </select>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" class="validate" required id="prodsvcName" name="prodsvcName">
                                  <label for="prodsvcName">Name</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <textarea id="prodsvcDetail" name="prodsvcDetail" class="materialize-textarea"></textarea>
                                  <label for="prodsvcDetail">Details</label>
                                </div>
                                <div class="input-field col s3 offset-s7" style="margin-top: 20px;">
                                    <input type="text" class="validate right-align" id="prodsvcPrice" name="prodsvcPrice">
                                    <label for="prodsvcPrice">Price</label>
                                </div>
                              
                            <!-- </div> -->
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
                                <p>Are you sure?</p>
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
    width: 45% !important;
    height: 80% !important;
    max-height: 100% !important;
  }
  #update{
    width: 45% !important;
    height: 80% !important;
    max-height: 100% !important;
  }
  #delete {
    width: 30% !important;
  }
  #addCategory {
    width: 40% !important;
  }
  #addCategorySelect {
    height: 150px !important;
  }
  #updateCategorySelect {
    height: 150px !important;
  }
  #updateAddCategory {
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