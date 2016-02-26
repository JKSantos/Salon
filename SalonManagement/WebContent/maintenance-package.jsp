<!DOCTYPE html>
<html ng-app>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-promodiscount.css"/>
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
                                      <li><a href="maintenance-discount.jsp">Discount</a></li>
                                      <li class="orange"><a href="maintenance-package.jsp">Package</a></li>
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
                                   <a class="collapsible-header active"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promo.jsp">Promo</a></li>
                                         <li><a href="maintenance-discount.jsp">Discount</a></li>
                                         <li class="orange"><a href="maintenance-package.jsp">Package</a></li>
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
                                         <li><a href="#!">Product Order</a></li>
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
                    <header><h4>Package Maintenance</h4></header>
                        <div class="row">
                            <form class="col s12">
                                <div class="input-field col s12">
                                  <p class="left-align red-text">(*) Indicates required field</p>
                                </div>
                                <div class="input-field col s12">
                                  <input type="text" class="validate" id="packname" name="packname">
                                  <label for="packname">Package Name <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s12">
                                    <textarea id="packdesc" name="packdesc" class="materialize-textarea"></textarea>
                                    <label for="packdesc">Description <span class="red-text">*</span></label>
                                </div>
                                <div class="col s3">
                                <p>Type <span class="red-text">*</span></p>
                                </div>
                                <div class="col s4">
                                          <input class="with-gap" name="eventhome" type="radio" id="event" />
                                          <label for="event">Event</label>
                                </div>
                                <div class="col s5">
                                          <input class="with-gap" name="eventhome" type="radio" id="home" />
                                          <label for="home">Home Service</label>
                                </div>
                                <div class="input-field col s6">
                                    <select id="package-list" class="browser-default">
                                          <option value="" disabled selected>Product</option>
                                    </select>
                                </div>
                                    <div class="input-field col s3">
                                        <input type="number" class="validate" id="package_quantity">
                                        <label for="package_quantity">Quantity</label>
                                    </div>

                                    <div class="input-field col s3">
                                      <button class="waves-effect waves-light btn" onclick="myFunction()"><i class="material-icons">add</i></button>
                                    </div>

                                    <div class="row">
                                      <table class="center-aligned highlight" id="packageTable">

                                      </table>
                                    </div>
                                  <div class="input-field col s6">
                                      <select id="servicelist" class="browser-default">
                                            <option value="" disabled selected>Service</option>
                                      </select>
                                  </div>
                                      <div class="input-field col s3">
                                          <input type="number" class="validate" id="package_quantity">
                                          <label for="service_quantity">Quantity</label>
                                      </div>

                                      <div id="div1">
                                        
                                      </div>

                                      <div class="input-field col s3">
                                        <a class="waves-effect waves-light btn"><i class="material-icons">add</i></a>
                                      </div>

                                      <div class="row">
                                        <table class="center highlight">
                                              </table>
                                        </div>

                                      <div class="input-field col s4 offset-s8">
                                        <input type="text" class="validate right-align" id="packprice" name="packprice">
                                        <label for="packprice">Price <span class="red-text">*</span></label>
                                      </div>
                                      <div class="input-field col s12">
                                        <button class="waves-effect waves-light orange btn-flat" type="submit" value="Submit" id="packsubmit">Create</button>
                                        <button class="waves-effect waves-orange transparent btn-flat" type="reset" value="Reset">Clear</button>
                                      </div>
                              </form>
                        </div>
                    </div>
                                        
                    <div class="aside asidecontainer z-depth-0">
                      <div class="aside aside3 z-depth-barts">
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
                              <h5>Package List</h5>
                          </div>
                          <div class="col s12">
                              <table class="ui sortable celled table responsive-table" ng-init="package=[{id: '1',name: 'Package', type: 'event', service: 'massage', servqty: '3', product: 'hair color', prodqty: '2', price: '800.00'}]">
                                                    <thead>
                                                      <tr>
                                                        <th data-sort="int" class="orange lighten-5">ID</th>
                                                        <th data-sort="string" class="orange lighten-5">Name</th>
                                                        <th data-sort="string" class="orange lighten-5">Type</th>
                                                        <th data-sort="string" class="orange lighten-5">Service</th>
                                                        <th data-sort="int" class="orange lighten-5">Qty</th>
                                                        <th data-sort="string" class="orange lighten-5">Product</th>
                                                        <th data-sort="int" class="orange lighten-5">Qty</th>
                                                        <th data-sort="int" class="orange lighten-5">Price</th>
                                                        <th class="no-sort orange lighten-5">Actions</th>
                                                      </tr>
                                                    </thead>
                                                      <tbody >
                                                         <tr ng-repeat="pack in package | filter: name | filter: type | filter: service | filter: product | filter: price | orderBy: 'id'">
                                                          <td>{{ pack.id }}</td>
                                                            <td>{{pack.name}}</td>
                                                            <td>{{pack.type}}</td>
                                                            <td>{{pack.service}}</td>
                                                            <td>{{pack.servqty}}</td>
                                                            <td>{{pack.product}}</td>
                                                            <td>{{pack.prodqty}}</td>
                                                            <td>{{pack.price}}</td>
                                                            <td style="padding: 0px;"><a href="#update" style="padding: 0px; margin-left: 5px;" class="waves-effect waves-orange modal-trigger transparent btn-flat"><i class="material-icons">edit</i></a><button style="padding: 0px; margin-left:15px;" class="waves-effect waves-orange transparent btn-flat"><i class="material-icons">delete</i></button></td>
                                                            </tr>
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
          width: 80px;
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
        .aside3 {
          background: white;
          border-radius: 3px;
          margin: 10px;
          text-align: center;
          height: 30%
        }
        .aside4 {
          background: white;
          border-radius: 3px;
          margin: 10px;
          text-align: center;
          height: 30%
        }
        .asidecontainer {
          background: transparent;
          margin-right: 0;
          text-align: center;
          width: 210px;
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
          .main    { order: 4;}
          .asidecontainer { order: 5;}
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
        $("table").stupidtable();
    </script>

    <script type="text/javascript">
      $( document ).ready(function(){

        $(".button-collapse").sideNav();
      });
    </script>
    
    <script type="text/javascript">
        $('.datepicker').pickadate({
          selectMonths: true, // Creates a dropdown to control month
          selectYears: 15 // Creates a dropdown of 15 years to control year
        });
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('select').material_select();
      });
    </script>

     <script type="text/javascript">
        $(function () {
            $("#unli").click(function () {
                if ($(this).is(":checked")) {
                    $("#promoend").attr("disabled", "disabled");
                    $("#promoend").val('');
                } else {
                    $("#promoend").removeAttr("disabled");
                    $("#promoend").focus();
                }
            });
        });
    </script>

     <script type="text/javascript">
        $(function () {
            $("#free").click(function () {
                if ($(this).is(":checked")) {
                    $("#promoprice").attr("disabled", "disabled");
                    $("#promoprice").val('');
                } else {
                    $("#promoprice").removeAttr("disabled");
                    $("#promoprice").focus();
                }
            });
        });
    </script>

    <script type="text/javascript">
      function success(){
        alert("Successfully Created!");
      }
    </script>
   
 

  </body>

</html>