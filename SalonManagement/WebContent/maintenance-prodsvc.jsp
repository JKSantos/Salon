<!DOCTYPE html>
<html ng-app>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Product" %>
  <%@ page import="com.gss.model.Service" %>

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
                                      <li class="orange"><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
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
                                      <li class="orange"><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
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
                        <h3 class="grey-text text-darken-1">Product & Service Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Price</th>
                                        <th>Date of Creation</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${productList}" var="product">
                                    <%! String string = null; %>
                                    <% Product prod = (Product)pageContext.getAttribute("product");
                                       string = String.valueOf(prod.getIntProductID());
                                    %>
                                    <tr>
                                        <td>${product.intProductID}</td>
                                        <td>${product.strProductName}</td>
                                        <td>Product</td>
                                        <td>Php ${product.dblProductPrice}</td>
                                        <td>01/01/01</td>
                                        <td>${product.intProductStatus}</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#prod<%=string%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#del<%=string%>" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>
                                  </c:forEach>
                                  <c:forEach items="${serviceList}" var="service">
                                    <%! String strService =null; %>
                                    <% Service serv = (Service)pageContext.getAttribute("service");
                                       strService = String.valueOf(serv.getIntServiceID());
                                    %>
                                    <tr>
                                        <td>${service.intServiceID}</td>
                                        <td>${service.strServiceName}</td>
                                        <td>Service</td>
                                        <td>Php ${service.dblServicePrice}</td>
                                        <td>01/01/01</td>
                                        <td>${service.intServiceStatus}</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#serv<%=strService%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#del<%=strService%>" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>
                                  </c:forEach>


                                    
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" method="post" action="createProdServ" enctype="multipart/form-data">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Create Product/Service</h3>
                                </div>
                                <div class="col s12">
                                     <label class="red-text">(*) Indicates required field</label>
                                </div>
                                <div class="col s12">
                                    <img name="prodsvcCreate" id="prodsvcCreate" style="width: 150px; height: 150px; margin-top: 20px;" src="./img/packIcon.png" alt=""/>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                    <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadProdSvc(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Type <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s8 offset-s2" style="margin-top: -1px;">
                                  <select name="strItemCate" class="browser-default" required >
                                    <option value="" disabled="disabled" selected></option>
                                    <option value="service">Service</option>
                                    <option value="product">Product</option>
                                  </select>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="text" class="validate" required id="prodsvcName" name="strItemName">
                                  <label for="prodsvcName">Name <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <textarea id="prodsvcDetail" name="strItemDetails" class="materialize-textarea"></textarea>
                                  <label for="prodsvcDetail">Details</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Category <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s6 offset-s2">
                                    <select class="browser-default" id="createPSCategory" name="strItemCategory" required>
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${productCategory}" var="product">
                                          <option value="${product}">${product}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2">
                                  <button data-target="addCategory" class="waves-effect waves-light btn-flat modal-category orange lighten-1">add</button>
                                </div>
                                <div class="input-field col s4 offset-s6" style="margin-top: 20px;">
                                    <input type="text" class="validate right-align" id="prodsvcPrice" name="dblItemPrice">
                                    <label for="prodsvcPrice">Price <span class="red-text">*</span></label>
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

                    <!-- add category BEGIN -->
                          <div id="addCategory" class="modal" style="margin-top: 30px;">
                            <form>
                              <div class="modal-content">
                                <h4>Add Another Category</h4>
                                <div class="row">
                                  <div class="col s12">
                                    <div class="input-field col s8 offset-s2">
                                      <select id="createAddCategorySelect" class="browser-default" size="10">
                                        <c:forEach items="${productCategory}" var="product">
                                          <option value="${product}">${product}</option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                    <div class="input-field col s8 offset-s2" style="margin-top: 20px;">
                                      <input type="text" class="validate" id="createAddCategoryName" name="createAddCategoryName">
                                      <label for="createAddCategoryName">Position Name</label>
                                    </div>
                                    <div class="input-field col s8 offset-s2 center">
                                      <a href="" id="createAddCatBtn" class="modal-close waves-effect waves-light orange darken-4 btn-flat white-text">SAVE</a>
                                      <button type="reset" value="Reset" class="modal-close waves-effect waves-orange transparent btn-flat white">CANCEL</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                    <!-- add category END -->



                      <c:forEach items="${productList}" var="product">
                        <%! String strProdID = null; %>
                        <% Product prodID = (Product)pageContext.getAttribute("product");
                           strProdID = String.valueOf(prodID.getIntProductID());
                           String productCate = prodID.getStrProductCategory();
                        %>
                        <div id="prod<%=strProdID%>" class="modal modal-fixed-footer" style="width: 45% !important; height: 80% max-height: 100% !important;">
                        <form class="col s12" method="get" action="updateItem">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Update Product/Service</h3>
                                </div>
                                <div class="col s12">
                                    <img name="upload" id="prodsvc" style="width: 150px; height: 150px; margin-top: 20px;" src="<s:url action='getImage'><s:param name='ImageID'><%=strProdID%></s:param><s:param name='type'>product</s:param></s:url>" alt=""/>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                    <div class="file-field">
                                        <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/*" onchange="ServiceImage(this)">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input name="imageName" value="image" class="file-path validate" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="hidden" name="intItemID" value="${product.intProductID}">
                                  <input type="hidden" name="intItemQuantity" value="${product.intProductQuantity}">
                                  <select class="browser-default" name="strItemCate" required>
                                    <option value="service" >Service</option>
                                    <option value="product" selected>Product</option>
                                  </select>
                                  
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input value="${product.strProductName}" type="text" class="validate" id="prodsvcName" name="strItemName">
                                  <label for="prodsvcName">Name</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <textarea id="prodsvcDetail" name="strItemDetails" class="materialize-textarea">${product.strProductDesc}</textarea>
                                  <label for="prodsvcDetail">Details</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Category</p>
                                </div>
                                <div class="input-field col s6 offset-s2">
                                    <select class="browser-default updateProdCategory" id="updateProdCategory" name="strItemCategory" autocomplete="off">
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${productCategory}" var="cate">
                                          <%
                                              String cate = (String)pageContext.getAttribute("cate");
                                              String selectedProduct = null;
                                              if(productCate.equals(cate)){
                                                  selectedProduct = "selected";
                                              }
                                              else {
                                                  selectedProduct = "";
                                              }
                                          %>
                                          <option value="${cate}" <%out.println(selectedProduct);%>>${cate}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2">
                                  <button data-target="addUpdateProdCategory" class="waves-effect waves-light btn-flat modal-updateCategory orange lighten-1">add</button>
                                </div>
                                <div class="input-field col s4 offset-s6" style="margin-top: 20px;">
                                    <input value="${product.dblProductPrice}" type="text" class="validate right-align" id="prodsvcPrice" name="dblItemPrice">
                                    <label for="prodsvcPrice" >Price</label>
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
                  </c:forEach>

                  <!-- add category BEGIN -->
                          <div id="addUpdateProdCategory" class="modal" style="margin-top: 30px;">
                            <form>
                              <div class="modal-content">
                                <h4>Add Another Category</h4>
                                <div class="row">
                                  <div class="col s12">
                                    <div class="input-field col s8 offset-s2">
                                      <select id="updateAddCatProdSelect" class="browser-default" size="10">
                                        <c:forEach items="${productCategory}" var="product">
                                          <option value="${product}">${product}</option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                    <div class="input-field col s8 offset-s2" style="margin-top: 20px;">
                                      <input type="text" class="validate" id="updateAddCatProdName" name="updateAddCatProdName">
                                      <label for="updateAddCatProdName">Position Name</label>
                                    </div>
                                    <div class="input-field col s8 offset-s2 center">
                                      <a href="" id="updateAddProdCatBtn" class="modal-close waves-effect waves-light orange darken-4 btn-flat white-text">SAVE</a>
                                      <button type="reset" value="Reset" class="modal-close waves-effect waves-orange transparent btn-flat white">CANCEL</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                    <!-- add category END -->

                 <c:forEach items="${serviceList}" var="service">
                        <%! String serviceID = null; %>
                        <% Service servID = (Service)pageContext.getAttribute("service");
                           serviceID = String.valueOf(servID.getIntServiceID());
                           String serviceCate = servID.getStrServiceCategory();
                        %>
                        <div id="serv<%=serviceID%>" class="modal modal-fixed-footer" style="width: 45% !important; height: 80% max-height: 100% !important;">
                        <form class="col s12" method="get" action="updateItem" enctype="multipart/form-data">
                          <div class="modal-content">

                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Update Product/Service</h3>
                                </div>
                                <div class="col s12">
                                    <img name="upload" id="prodsvc" style="width: 150px; height: 150px; margin-top: 20px;" src="<s:url action='getImage'><s:param name='ImageID'><%=serviceID%></s:param><s:param name='type'>service</s:param></s:url>" alt=""/>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                     <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="fileUpload" type="file" accept="image/.jpg, image/.png" onchange="ServiceImage(this)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="imageName" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input type="hidden" name="intItemID" value="${service.intServiceID}">
                                  <select name="strItemCate" class="browser-default" required autocomplete="off">
                                    <option value="service" selected>Service</option>
                                    <option value="product">Product</option>
                                  </select>
                                  
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <input value="${service.strServiceName}" type="text" class="validate" id="prodsvcName" name="strItemName">
                                  <label for="prodsvcName">Name</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                  <textarea id="prodsvcDetail" name="strItemDetails" class="materialize-textarea">${service.strServiceDesc}</textarea>
                                  <label for="prodsvcDetail">Details</label>
                                </div>
                                <div class="input-field col s8 offset-s2">
                                    <p style="color:#9e9e9e;font-size:12px;">Category</p>
                                </div>
                                <div class="input-field col s6 offset-s2">
                                    <select class="browser-default updateServCategory" id="updateServCategory" name="strItemCategory" autocomplete="off">
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${serviceCategory}" var="service">
                                          <%
                                              String cate3 = (String)pageContext.getAttribute("service");
                                              String selectedService = null;
                                              if(serviceCate.equals(cate3)){
                                                  selectedService = "selected";
                                              }
                                              else {
                                                  selectedService = "";
                                              }
                                          %>
                                          <option value="${service}" <%out.println(selectedService);%>>${service}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2">
                                  <button data-target="addUpdateServCategory" class="waves-effect waves-light btn-flat modal-updateCategory orange lighten-1">add</button>
                                </div>
                                <div class="input-field col s4 offset-s6" style="margin-top: 20px;">
                                    <input type="text" value="${service.intServiceName}" class="validate right-align" id="prodsvcPrice" name="dblItemPrice"/>
                                    <label for="prodsvcPrice" >Price</label>
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
                  </c:forEach>

                  <!-- add category BEGIN -->
                          <div id="addUpdateServCategory" class="modal" style="margin-top: 30px;">
                            <form>
                              <div class="modal-content">
                                <h4>Add Another Category</h4>
                                <div class="row">
                                  <div class="col s12">
                                    <div class="input-field col s8 offset-s2">
                                      <select id="updateAddCatServSelect" class="browser-default" size="10">
                                        <c:forEach items="${serviceCategory}" var="service">
                                          <option value="${service}">${service}</option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                    <div class="input-field col s8 offset-s2" style="margin-top: 20px;">
                                      <input type="text" class="validate" id="updateAddCatServName" name="updateAddCatServName">
                                      <label for="updateAddCatServName">Position Name</label>
                                    </div>
                                    <div class="input-field col s8 offset-s2 center">
                                      <a href="" id="updateAddServCatBtn" class="modal-close waves-effect waves-light orange darken-4 btn-flat white-text">SAVE</a>
                                      <button type="reset" value="Reset" class="modal-close waves-effect waves-orange transparent btn-flat white">CANCEL</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                    <!-- add category END -->

                        <c:forEach items="${productList}" var="product">
                        <%
                            Product prod = (Product)pageContext.getAttribute("product");
                            String prodID = String.valueOf(prod.getIntProductID());
                        %>
                          <div id="del<%=prodID%>" class="modal" style="width: 30% !important;">
                          <form action="deactivateItem" method="get">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <input type="hidden" name="intItemID" value="${product.intProductID}">
                                <button class="waves-effect waves-light orange btn-flat white-text">YES</button>
                                <a href="#" class="modal-action modal-close waves-effect waves-light transparent btn-flat black-text">NO</a>
                              </div>
                            </div>
                          </form>
                      </div>
                    </c:forEach>

                    <c:forEach items="${serviceList}" var="service">
                        <%
                            Service serv = (Service)pageContext.getAttribute("service");
                            String servID = String.valueOf(serv.getIntServiceID());
                        %>
                          <div id="del<%=servID%>" class="modal" style="width: 30% !important;">
                          <form method="get" action="deactivateService">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                              <input type="hidden" name="intItemID" value="${service.intServiceID}">
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
  #createAddCategorySelect {
    height: 150px !important;
  }
  #updateAddCatProdSelect {
    height: 150px !important;
  }
  #updateAddCatServSelect {
    height: 150px !important;
  }
  #addUpdateServCategory {
    width: 40% !important;
  }
  #addUpdateProdCategory {
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