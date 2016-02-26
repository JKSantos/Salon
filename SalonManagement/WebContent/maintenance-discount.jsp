<!DOCTYPE html>
<html ng-app>

  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Discount" %>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
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
                                      <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
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
                                   <a class="waves-effect waves-orange collapsible-header"><b>Maintenance</b></a>
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
                                   <a class="waves-effect waves-orange collapsible-header"><b>Transaction</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="transactions-inventory.jsp">Inventory</a></li>
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
            
                    <div class="aside aside1 z-depth-barts"> <!--main aside1-->
                          <div class="row">
                              <form class="col s12">
                                  <h4>Discount Maintenance</h4>
                                  <div class="input-field col s12" style="margin-bottom: 30px;">
                                      <label class="red-text"> (*) Indicates required field</label>
                                  </div>
                                  <div class="input-field col s12">
                                      <input name="strDiscountName" type="text" class="validate" id="discountname">
                                      <label for="discountname">Discount Name <span class="red-text">*</span></label>
                                  </div>
                                  <div class="input-field col s12">
                                      <textarea name="strDiscountDetails" id="discountdetails" class="materialize-textarea" length="120"></textarea>
                                      <label for="discountdetails">Description <span class="red-text">*</span></label>
                                  </div>
                                  <div class="input-field col s6">
                                    <select id="amounttype" name="strDiscountType">
                                      <option value="1">Percentage</option>
                                      <option value="2">Fixed Amount</option>
                                    </select>
                                    <label>Type <span class="red-text">*</span></label>
                                  </div>
                                  <div class="input-field col s6">
                                    <input type="text" class="validate right-align" id="discprice" name="dblDiscountPrice">
                                    <label for="discprice">Price <span class="red-text">*</span></label>
                                  </div>
                                  <div class="input-field col s12 center">
                                      <button class="waves-effect waves-light orange btn-flat" type="submit" value="Submit" id="promobtn">CREATE</button>
                                      <button class="waves-effect waves-orange transparent white btn-flat" type="reset" value="Reset">Clear</button>
                                  </div>
                                </form>
                          </div>
                      </div>
                    
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
                                <h5>Promo List</h5>
                            </div>
                            <div class="col s12">
                                <table class="ui sortable celled table responsive-table" ng-init="discount=[{id: '1',name: 'Pogi', type: 'Percentage', price: '20'},{id: '2',name: 'Student', type: 'Fixed Price', price: '50.00'}]">
                                                      <thead>
                                                        <tr>
                                                          <th data-sort="int" class="orange lighten-5">ID</th>
                                                          <th data-sort="string" class="orange lighten-5">Name</th>
                                                          <th data-sort="string" class="orange lighten-5">Type</th>
                                                          <th data-sort="string" class="orange lighten-5">Price</th>
                                                          <th class="no-sort orange lighten-5">Actions</th>
                                                        </tr>
                                                      </thead>
                                                        <tbody >
                                                        <c:forEach items="${discountList}" var="discount">
                                                            <%! String type = null; %>
                                                          	<%
                                                          		Discount discount = (Discount)pageContext.getAttribute("discount");
                                                            	if(discount.getIntDiscountType() == 1)
                                                            		type = "Percentage";
                                                            	else if(discount.getIntDiscountType() == 2)
                                                                	type = "Fixed Amount";

                                                                System.out.println("hey");
                                                          	%>
                                                           <tr ng-repeat="disc in discount | filter:name | filter: type | filter: price | orderBy: 'id'">
                                                            <td>${discount.intDiscountID}</td>
                                                              <td>${discount.strDiscountName}</td>
                                                              <td><%= type %></td>
                                                              <td>${discount.dblDiscountAmount}</td>
                                                              <td style="padding:0px;"><a href="#update" style="padding: 0px;" class="waves-effect waves-orange modal-trigger transparent btn-flat"><i class="material-icons">edit</i></a><button style="padding: 0px; margin-left:15px;" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons">delete</i></button></td>
                                                              </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                      </table>
                                                      
                                                         <!-- <c:forEach items="${empList}" var="employee">
                                                         <td>{{ disc.id }}</td>
                                                              <td>{{disc.name}}</td>
                                                              <td>{{disc.type}}</td>
                                                              <td>{{disc.price}}</td>
                                                              <td style="padding:0px;"><a href="#update" style="padding: 0px;" class="waves-effect waves-orange modal-trigger transparent btn-flat"><i class="material-icons">edit</i></a><button style="padding: 0px; margin-left:15px;" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons">delete</i></button></td>
                                                              </tr>


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
                



    <style type="text/css">
    

        .mntc {
            padding: 0px 0px;
        }
        

        .headnav, main, footer, article {
              padding-left: 240px;
            }

            @media only screen and (max-width : 992px) {
              .headnav, main, footer, article {
                padding-left: 0;
              }
            }

        .wrapper > * {
          flex: 1 100%;
        }

        .wrapper {
          display: -webkit-box;
          display: -moz-box;
          display: -ms-flexbox;
          display: -webkit-flex;
          display: flex;
          flex-direction: row;
        
          -webkit-flex-flow: row wrap;
          flex-flow: row wrap;
          -moz-flex-flow: row wrap;
          -o-flex-flow: row wrap;
        }

        .aside1 {
          background: white;
          border-radius: 3px;
          margin: 10px;
          text-align: center;
          width: 120px;
          height: 30%;
        }

        .aside2 {
          background: white;
          border-radius: 3px;
          margin: 10px;
          text-align: center;
          width: 120px;
          height: 30%
        }


        @media all and (min-width: 600px) {
          .aside { flex: 1 auto; }
        }

        @media all and (min-width: 800px) {
          /* We invert order of first sidebar and main
           * And tell the main element to take twice as much width as the other two sidebars 
           */
          .main { flex: 2 0px; }
          
          .aside1 { order: 1; }
          .main    { order: 2; }
          .aside2 { order: 3; }
          .main    { order: 6;}
          .footer  { order: 7; }
        }

    </style>

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
        $("table").stupidtable();
    </script>
   
 

  </body>

</html>