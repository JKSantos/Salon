<!DOCTYPE html>
<html ng-app>
  
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.ExtraCharge"%>
  <head>
  <meta charset="UTF-8">
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
                              <li class="purple lighten-4"><a href="extraChargeMaintenance">Other Charge</a></li>
                              <li><a href="promoMaintenance">Promo</a></li>
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
                              <li><a href="transactions-productorder.jsp">Product Order</a></li>
                              <li><a href="transactions-vip.jsp">VIP</a></li>
                              <li><a href="transactions-walkin.jsp">Walk In</a></li>
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
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li class="purple lighten-4"><a href="extraChargeMaintenance">Extra Charge</a></li>
                               </ul>
                             </div>
                         </li>
                         <li>
                           <a class="waves-effectcollapsible-header"><b>Transaction</b></a>
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
                        <h3 class="grey-text text-darken-1">Other Charge Maintenance</h3>
                        <a data-delay="30" data-position="bottom" data-tooltip="Create" class="waves-effect waves-light modal-trigger btn-flat purple darken-3 left white-text tooltipped" href="#create" style="margin-top: 50px; margin-left: 15px;"><i class="material-icons">add</i></a>
                        <a data-delay="30" data-position="bottom" data-tooltip="Archive" class="waves-effect waves-light modal-trigger btn-flat purple darken-3 left white-text tooltipped" href="#archive" style="margin-top: 50px; margin-left: 15px;"><i class="material-icons">archive</i></a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th><center>Charge Name</center></th>
                                        <th><center>Description</center></th>
                                        <th><center>Action</center></th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <!--  <tr>
                                        <td>1</td>
                                        <td>Additional 20km</td>
                                        <td>20km +</td>
                                        <td>01/01/01</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#update" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr> -->
                                    <c:forEach items="${ecList}" var="extracharge">
                                      <tr>
                                      <%
                                          ExtraCharge ext = (ExtraCharge)pageContext.getAttribute("extracharge");
                                          String exID = String.valueOf(ext.getIntECID());
                                      %>

                                        <td style="padding:0; margin:0;"><center>${extracharge.strECName}</center></td>
                                        <td style="padding:0; margin:0;"><center>${extracharge.strECDetails}</center></td>
                                        <td class="center" style="padding:0; margin:0;"><center>
                                        <a data-delay="30" data-position="bottom" data-tooltip="View" class="tooltipped waves-effect waves-light modal-trigger btn-flat transparent black-text" href="#ec${extracharge.intECID}" style="padding-left: 10px;padding-right:10px; margin: 5px;">
                                        <i class="material-icons">visibility</i></a>
                                        <a data-delay="30" data-position="bottom" data-tooltip="Update" class="tooltipped waves-effect waves-light modal-trigger btn-flat transparent black-text" href="#ec${extracharge.intECID}" style="padding-left: 10px;padding-right:10px; margin: 5px;">
                                        <i class="material-icons">edit</i></a>
                                        <a data-delay="30" data-position="bottom" data-tooltip="Deactivate" class="tooltipped waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#del<%=exID%>" style="padding-left: 10px;padding-right:10px; margin: 5px;">
                                        <i class="material-icons">delete</i></a></center>
                                        </td>
                                      </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" id="createExtraForm" method="post" action="createExtraCharge">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1" style="margin-bottom: 40px;">Create Charge</h4>
                                    <div class="row">
                                            <div class="input-field col s12" style="margin-bottom: 30px;">
                                                <label class="red-text"> (*) Indicates required field</label>
                                            </div>
                                            <div class="input-field col s12" style="margin-top: 25px;">
                                                <input type="text" class="validate tooltipped specialname noSpace" id="createEChargeName" name="strECName" required pattern="^[a-zA-Z\-'`\s]{5,}$" minlength="5" maxlength="15" data-delay="30" data-position="bottom" data-tooltip="Ex: Missing Equipments<br/>( At least 5 or more characters )" placeholder="Charge Name">
                                                <label for="createEChargeName" class="active">Charge Name<span class="red-text">*</span></label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="createEChargeDesc" name="strECDetails" class="materialize-textarea tooltipped noSpace" maxlength="30" minlength="5" data-delay="30" data-position="bottom" data-tooltip="Description" placeholder="Description"></textarea>
                                                <label for="createEChargeDesc" class="active">Description<span class="red-text">*</span></label>
                                            </div>
                                    </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class="modal-action modal-close waves-effect waves-purple transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light purple darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>

                      <c:forEach items="${ecList}" var="extra">
                        <div id="ec${extra.intECID}" class="modal modal-fixed-footer" style="width: 30% !important; height: 70% !important; max-height: 100% !important;">
                        <form class="col s12 updateExtraForm" method="get" id="updateExtraForm" action="updateExtraCharge">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                              <div class="wrapper">
                                  <h4 class="grey-text text-darken-1" style="margin-bottom: 40px;">Update Charge</h4>
                                    <div class="row">
                                            <div class="input-field col s12">
                                                <input type="hidden" name="intECID" value="${extra.intECID}">

                                                <input id="updateEChargeName" name="strECName" type="text" value="${extra.strECName}" class="validate tooltipped specialname noSpace" pattern="^[a-zA-Z\-'`\s]{5,}$" placeholder="Charge Name" data-delay="30" data-position="bottom" data-tooltip="Ex: Missing Equipments<br/>( At least 5 or more characters )" minlength="5" maxlength="15">
                                                <label for="updateEChargeName" class="active">Charge Name</label>
                                            </div>
                                            <div class="input-field col s12">
                                                <textarea id="updateEChargeDesc" name="strECDetails" class="materialize-textarea tooltipped noSpace" data-delay="30" data-position="bottom" data-tooltip="Description<br/>( At least 5 or more characters )" maxlength="30" minlength="5">${extra.strECDetails}</textarea>
                                                <label for="updateEChargeDesc" class="active">Description</label>
                                            </div>
                                    </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class="modal-action modal-close waves-effect waves-purple transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light purple darken-3 white-text btn-flat" type="submit" value="Submit">UPDATE</button>
                          </div>
                          </form>
                    </div>
                  </c:forEach>

                        <c:forEach items="${ecList}" var="extra">
                          <%
                                        
                              ExtraCharge ext2 = (ExtraCharge)pageContext.getAttribute("extra");
                              String exID2 = String.valueOf(ext2.getIntECID());
                         %>


                          <div id="del<%=exID2%>" class="modal" style="width: 30% !important;">
                          <form action="deactivateExtraCharge" method="get">
                          <div class="container">
                            <input type="hidden" name="intECID" value="${extra.intECID}">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <button class="waves-effect waves-light purple btn-flat white-text">YES</button>
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
    width: 30% !important;
    height: 70% !important;
    max-height: 100% !important;
  }
  #update{
    width: 30% !important;
    height: 70% !important;
    max-height: 100% !important;
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
    <script type="text/javascript" src="./js/materialize.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/maintenance-emp.js"></script>
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="./js/bartstable.js"></script>
    <script type="text/javascript" src="./js/jquery.validate.js"></script>
    <script type="text/javascript" src="./js/validation.js"></script>
  </body>


</html>