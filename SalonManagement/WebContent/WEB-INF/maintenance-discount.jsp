<!DOCTYPE html>
<html ng-app>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Discount" %>

  <head>
  <meta charset="UTF-8">
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
                              <li class="orange"><a href="maintenance-discount.jsp">Discount</a></li>
                              <li><a href="maintenance-package.jsp">Package</a></li>
                              <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
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
                                 <li class="orange"><a href="maintenance-discount.jsp">Discount</a></li>
                                 <li><a href="maintenance-package.jsp">Package</a></li>
                                 <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
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
                        <h3 class="grey-text text-darken-1">Discount Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Discount Name</th>
                                        <th>Price (Php/%)</th>
                                        <th>Date of Creation</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${discountList}" var="discount">
                                    <%
                                        Discount discount1 = (Discount)pageContext.getAttribute("discount");
                                        String id = String.valueOf(discount1.getIntDiscountID());
                                        String percet = null; 
                                        String fixed = null;

                                        if(discount1.getIntDiscountType() == 1){
                                            percet = "%";
                                            fixed = "";
                                        }
                                        else{
                                            fixed = "Php ";
                                            percet = "";
                                        }
                                    %>
                                    <tr>
                                        <td>${discount.intDiscountID}</td>
                                        <td>${discount.strDiscountName}</td>
                                        <td><%=fixed%>${discount.dblDiscountAmount}<%=percet%></td>
                                        <td>2016/03/06</td>
                                        <td>${discount.intDiscountStatus}</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#dis<%=id%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#del<%=id%>" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>
                                  </c:forEach>
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" method="get" action="createDiscount">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1" style="margin-bottom: 40px;">Create Discount</h4>
                                    <div class="row">
                                            <div class="input-field col s12" style="margin-bottom: 30px;">
                                                <label class="red-text"> (*) Indicates required field</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <input type="text" name="strDiscountName" class="validate" id="discountName" required>
                                                <label for="discountName">Discount Name <span class="red-text">*</span></label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="discountDesc" name="strDiscountDetails" class="materialize-textarea" length="120"></textarea>
                                                <label for="discountDesc">Description</label>
                                            </div>
                                            <div class="input-field col s2">
                                              <label for="select">Type <span class="red-text">*</span></label>
                                            </div>
                                            <div class="input-field col s5">
                                                <p>
                                                   <input type="radio" name="strDiscountType1" id="createDiscPercent"/>
                                                   <label for="createDiscPercent">Percentage</label>
                                                </p>
                                                <p>
                                                   <input type="radio" name="strDiscountType2" id="createDiscAmount" />
                                                   <label for="createDiscAmount">Fixed Amount</label>
                                                </p>
                                            </div>
                                            <div class="input-field col s4 offset-s1">
                                                <input type="text" class="validate right-align" id="createDiscPrice" required name="dblDiscountPrice">
                                                <label for="createDiscPrice">Discount Amount <span class="red-text">*</span></label>
                                            </div>
                                    </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>

                      <c:forEach items="${discountList}" var="discount">
                        <%
                          Discount discount2 = (Discount)pageContext.getAttribute("discount");
                          String id2 = String.valueOf(discount2.getIntDiscountID());

                        %>
                        <div id="dis<%=id2%>" class="modal modal-fixed-footer" style="width: 45% !important; height: 80% !important; max-height: 100% !important;">
                        <form class="col s12" method="get" action="updateDiscount">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1" style="margin-bottom: 50px;">Update Discount</h4>
                                    <div class="row">
                                            <div class="input-field col s12">
                                                <input type="hidden" name="intDiscountID" value="${discount.intDiscountID}">
                                                <input value="${discount.strDiscountName}" name="strDiscountName" type="text" class="validate" id="discountName">
                                                <label for="discountName">Discount Name</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="discountDesc" name="strDiscountDetails" class="materialize-textarea" length="120">${discount.strDiscountDesc}</textarea>
                                                <label for="discountDesc">Description</label>
                                            </div>
                                            <div class="input-field col s2">
                                              <label for="select">Type</label>
                                            </div>
                                            <div class="input-field col s5">
                                              <%
                                                  Discount discount3 = (Discount)pageContext.getAttribute("discount");
                                                  String type1 = null;
                                                  String type2 = null;

                                                  if(discount3.getIntDiscountType() == 1){
                                                      type1 = "checked";
                                                      type2 = "";
                                                  }
                                                  else{
                                                      type1 = "";
                                                      type2 = "checked";
                                                  }

                                              %>
                                                <p>
                                                   <input name="strDiscountType1" type="radio" id="createDiscPercent" <%out.print(type1);%>/>
                                                   <label for="createDiscPercent">Percentage</label>
                                                </p>
                                                <p>
                                                   <input name="strDiscountType2" type="radio" id="createDiscAmount" <%out.print(type2);%>/>
                                                   <label for="createDiscAmount">Fixed Amount</label>
                                                </p>
                                            </div>
                                            <div class="input-field col s4 offset-s1">
                                                <input type="text" value="${discount.dblDiscountAmount}" class="validate right-align" id="createDiscPrice"name="dblDiscountPrice">
                                                <label for="createDiscPrice">Discount Amount</label>
                                            </div>
                                    </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>
                  </c:forEach>

                      <c:forEach items="${discountList}" var="discount">
                        <%
                          Discount dis = (Discount)pageContext.getAttribute("discount");
                          String disID = String.valueOf(dis.getIntDiscountID());
                        %>
                        <div id="del<%=disID%>" class="modal" style="width: 30% !important;">
                        <form action="deactivateDiscount" method="get">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure you want to deactivate <b>${discount.strDiscountName}</b>?</p>
                              </div>
                            </div>
                            <div class="col s12 center" style="margin-bottom: 30px;">
                              <input type="hidden" value="${discount.intDiscountID}" name="intDiscountID">
                              <button class="waves-effect waves-light orange btn-flat white-text">YES</button>
                              <a href="#" class="modal-action modal-close waves-effect waves-light transparent btn-flat black-text">CANCEL</a>
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