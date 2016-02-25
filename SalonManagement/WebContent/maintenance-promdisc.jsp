<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-promodiscount.css"/>
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
                          <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a></li>
                         <!--  <li class="no-padding"> -->
                            <ul class="collapsible" data-collapsible="accordion">
                              <li>
                                <a class="collapsible-header"><b>Maintenance</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="maintenance-emp.jsp">Employee</a></li>
                                      <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                      <li class="orange"><a href="maintenance-promdisc.jsp">Promo</a></li>
                                      <li><a href="maintenance-package.jsp">Discount</a></li>
                                    </ul>
                                  </div>
                              </li>
                              <li>
                                <a class="collapsible-header"><b>Transaction</b></a>
                                  <div class="collapsible-body">
                                    <ul>
                                      <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                      <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                      <li><a href="#!">Walk-In</a></li>
                                    </ul>
                                  </div>
                              </li>
                            </ul>
                          <li><a href="utilities.jsp" class="waves-effect waves-orange"><b>Utilities</b></a></li>
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
                                         <li class="orange"><a href="maintenance-promdisc.jsp">Promo</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Transaction</b></a>
                                     <div class="collapsible-body">
                                       <ul>
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
                    <div class="container">
                    <header><h4>Create Promo</h4></header>
                        <div class="row">
                            <form class="col s12">

                                <div class="input-field col s12" style="margin-bottom: 30px;">
                                    <label class="red-text"> (*) Indicates required field</label>
                                </div>
                                <div class="input-field col s12" style="margin-bottom: 5px;">

                                <label>Availability <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s6">
                                <p class="center">
                                  <input type="checkbox" class="filled-in" id="unli"/>
                                  <label for="unli">Non-Expiry</label>
                                </p>
                                </div>
                                <div class="input-field col s6">
                                     <input type="date" class="datepicker" id="promoend" placeholder="Expiration"/>
                                </div>
                                <div class="input-field col s12">
                                    <input type="text" class="validate" id="promoname">
                                    <label for="promoname">Promo Name <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s12">
                                    <textarea id="promodetails" class="materialize-textarea" length="120"></textarea>
                                    <label for="promodetails">Description</label>
                                </div>
                                <div class="input-field col s12">
                                    <select multiple id="promo-services-included">
                                          <option value="" disabled selected>Choose your option</option>
                                      </select>
                                      <label>Service/s Included</label>
                                </div>
                                <div class="input-field col s12">
                                    <select multiple id="promo-product-included">
                                          <option value="" disabled selected>Choose your option</option>
                                      </select>
                                      <label>Product/s Included</label>
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
                                <div class="input-field col s12 center">
                                    <button class="waves-effect waves-light orange btn-flat" type="submit" value="Submit" id="promobtn" onclick="success()">CREATE</button>
                                </div>
                              </form>
                        </div>
                        </div>
                    </div>
                                        
                    <div class="aside asidecontainer z-depth-0">
                      <div class="aside aside3 z-depth-barts">
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
                    <div class="row">
                          <div class="col s12">
                              <h5>Promo List</h5>
                          </div>
                          <div class="col s12">
                              <ul class="collapsible z-depth-0" data-collapsible="accordion">
                                  <li>
                                    <div class="collapsible-header"></div>
                                    <div class="collapsible-body blue-grey lighten-5">
                                      <a class="waves-effect waves-orange btn-flat">Edit</a>
                                      <a class="waves-effect waves-orange btn-flat red-text">Deactivate</a>
                                    </div>
                                  </li>
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
          width: 250px;
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
          .main    { order: 4;}
          .asidecontainer { order: 5;}
          .main    { order: 6;}
          .footer  { order: 7; }
        }

    </style>

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>

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