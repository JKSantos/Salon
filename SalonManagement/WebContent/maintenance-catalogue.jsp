<!DOCTYPE html>
<html ng-app>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Catalogue"%>
  <%@ page import="com.gss.model.Service"%>

  <head>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-emp.css"/>

  <link rel="stylesheet" type="text/css" href="./css/bartstable.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css"/>

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
                        <a class="collapsible-header active"><b>Maintenance</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li class="orange"><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
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
                                 <li><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li class="orange"><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
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
                                        <th>Price</th>
                                        <th>Date of Creation</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <!--  <tr>
                                        <td>1</td>
                                        <td>Mohawk</td>
                                        <td>Senior Cut</td>
                                        <td>desciption</td>
                                        <td>99.00</td>
                                        <td>01/01/01</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#update" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr> -->
                                  <c:forEach items="${catList}" var="cat">
                                    <%
                                        Catalogue cat1 = (Catalogue)pageContext.getAttribute("cat");
                                        String cat1ID = String.valueOf(cat1.getIntCatalogueID());
                                    %>
                                    <tr>
                                        <td>${cat.intCatalogueID}</td>
                                        <td>${cat.strCatalogueName}</td>
                                        <td>${cat.strCatalogueType}</td>
                                        <td>Php ${cat.dblCataloguePrice}</td>
                                        <td>2016/03/06</td>
                                        <td>${cat.intCatalogueStatus}</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#cata<%=cat1ID%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#dec<%=cat1ID%>" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr> 
                                   </c:forEach>
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" method="post" action="createCatalogue" enctype="multipart/form-data">
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
                                            <input name="strCataloguePath" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Type <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s8 offset-s2" style="margin-top: -1px;">
                                  <select class="browser-default" required name="strCatalogueCategoryID" >
                                    <option value="" disabled="disabled" selected></option>
                                    <c:forEach items="${serviceList}" var="service">
                                      <option value="${service.strServiceName}">${service.strServiceName}</option>
                                    </c:forEach>
                                  </select>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" class="validate" required id="prodsvcName" name="strCatalogueName">
                                  <label for="prodsvcName">Name <span class="red-text">*</span></label>
                                </div> 
                              
                            <!-- </div> -->
                            </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">SAVE</button>
                          </div>
                          </form>
                    </div>

                      <c:forEach items="${catList}" var="category">
                        <%
                            Catalogue cat3 = (Catalogue)pageContext.getAttribute("category");
                            String catID2 = String.valueOf(cat3.getIntCatalogueID());
                            String cateType = cat3.getStrCatalogueType();
                        %>
                        <div id="cata<%=catID2%>" class="modal modal-fixed-footer" style="width: 45% !important; height: 80% !important; max-height: 100% !important;">
                        <form class="col s12" method="post" action="updateCatalogue" enctype="multipart/form-data">
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
                                          <input type="hidden" name="intCatalogueID"value="${category.intCatalogueID}">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadCreateCatalogue(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="strCataloguePath" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Type</p>
                                </div>
                                <div class="input-field col s8 offset-s2" style="margin-top: -1px;">
                                  <select class="browser-default" required name="strCatalogueCategoryID">
                                    <option value="" disabled="disabled" selected></option>
                                    <c:forEach items="${serviceList}" var="service">
                                      <%
                                          Service cat2 = (Service)pageContext.getAttribute("service");
                                          String type = "";
                                          if(cat2.getStrServiceName().equals(cateType)){
                                              type = "selected";
                                          }
                                      %>
                                      <option value="${service.strServiceName}" <%out.print(type);%>>${service.strServiceName}</option>
                                    </c:forEach>
                                  </select>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" class="validate" required id="prodsvcName" name="strCatalogueName" value="${category.strCatalogueName}">
                                  <label for="prodsvcName">Name</label>
                                </div>
                    
                              
                            <!-- </div> -->
                            </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>
                  </c:forEach>

                    <c:forEach items="${catList}" var="category">
                      <%
                          Catalogue cat5 = (Catalogue)pageContext.getAttribute("category");
                          String catID4 = String.valueOf(cat5.getIntCatalogueID());
                      %>
                      <div id="dec<%=catID4%>" class="modal" style="width: 30% !important;">
                        <form method="get" action="deactivateCatalogue">      
                          <div class="container">
                            <div class="modal-content">
                              <input type="hidden" name="intCatalogueID" value="${category.intCatalogueID}">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure you want to deactivate <b>${category.strCatalogueName}</b>?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <button class="waves-effect waves-light orange btn-flat white-text">YES</button>
                                <a href="#" class="modal-action modal-close waves-effect waves-light transparent btn-flat black-text">NO</a>
                              </div>
                            </div>
                         </form>
                      </div>
                    </c:forEach>
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
    <script type="text/javascript" src="./js/bartstable.js"></script>
  </body>


</html>