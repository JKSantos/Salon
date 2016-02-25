<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-productservice.css"/>
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
                                      <li class="orange"><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                      <li><a href="maintenance-promdisc.jsp">Promo & Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
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
                                         <li class="orange"><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promdisc.jsp">Promo & Discount</a></li>
                                         <li><a href="maintenance-package.jsp">Package</a></li>
                                       </ul>
                                     </div>
                                 </li>
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Transaction</b></a>
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
                         </div>
                       </nav>
                </header>

        <article>
          <div class="wrapper">
            <!-- 
                    <div class="aside aside1 z-depth-barts"> main aside1
                    
                    </div> -->
                      <div class="aside aside1 z-depth-barts">
                        <!-- main aside2-->
                        <div class="container">
                                            <header><h4>Create Product & Service</h4></header>
                                                <div class="row">
                                                    <form class="col s12">
                                                        <div class="input-field col s4">
                                                            <label class="red-text">(*) Indicates required field</label>
                                                        </div>
                                                        <div class="input-field col s12">
                                                                <img  id="serviceimg" style="width: 120px; height: 120px;" src="" alt="Image"/>
                                                        </div>
                                                        <div class="input-field col s12" style="margin-top: 10px;">
                                                              <select id="typeid">
                                                                <option value="Product" selected>Product</option>
                                                                <option value="Service">Service</option>
                                                              </select>
                                                              <label for="typeid">Type <span class="red-text">*</span></label>
                                                        </div>
                                                        <div class="input-field col s12" style="margin-top: 30px;">
                                                            <div class="file-field">
                                                                  <div class="btn orange">
                                                                    <span class="">Image</span>
                                                                    <input type="file" accept="image/*" onchange="ServiceImage(this)">
                                                                  </div>
                                                                  <div class="file-path-wrapper">
                                                                    <input class="file-path validate" type="text">
                                                                  </div>
                                                              </div>
                                                        </div>
                                                        <div class="input-field col s12">
                                                            <input type="text" class="validate" id="servicename">
                                                            <label for="servicename">Name <span class="red-text">*</span></label>
                                                        </div>
                                                        <div class="input-field col s12">
                                                            <textarea id="servicedetails" class="materialize-textarea" length="120"></textarea>
                                                            <label for="servicedetails">Details</label>
                                                        </div>
                                                        <div class="input-field col s5">
                                                            <select id="servicecategory">
                                                                  <option value="" disabled selected>Choose your option</option>
                                                              </select>
                                                              <label>Category <span class="red-text">*</span></label>
                                                        </div>
                                                        <div class="input-field col s3" style="margin-top: -0.2px;">
                                                            <p style="margin-top: 5px;" class="center"><a id="optionadd" class="waves-effect waves-light orange-btn"><i class="material-icons small">add</i></a><a class="waves-effect waves-light orange-btn" onclick="removeopt()"><i class="material-icons small">remove</i></a></p>
                                                        </div>
                                                        <div class="input-field col s4" style="margin-top: -4px;">
                                                            <input type="text" id="add-optname" class="validate">
                                                            <label for="add-optname">Another</label>
                                                        </div>
                                                        <div class="input-field col s6 offset-s6">
                                                            <input type="text" class="validate right-align" id="serviceprice" maxlength="8">
                                                            <label for="serviceprice">Price <span class="red-text">*</span></label>
                                                        </div>
                                                        <div class="input-field col s12 center">
                                                            <button class="waves-effect waves-light orange btn-flat" type="submit" value="Submit" id="servicebtn" onclick="success()">Create</button>
                                                            <button class="waves-effect waves-light btn-flat" type="reset" value="Reset" id="productclear">CLEAR</button>
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
                              <h5>Product List</h5>
                          </div>
                          <div class="col s12">
                              <ul class="collapsible z-depth-0" data-collapsible="accordion">
                                  <li>
                                    <div class="collapsible-header"><i class="material-icons green-text">info</i>Green Hair Color</div>
                                    <div class="collapsible-body blue-grey lighten-5">
                                      <a class="waves-effect waves-orange btn-flat">Update</a>
                                      <a class="waves-effect waves-orange btn-flat red-text">Deactivate</a>
                                    </div>
                                  </li>
                                </ul>
                          </div>
                        </div>
                      </div>
                        <div class="aside aside4 z-depth-barts">
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
                                  <h5>Service List</h5>
                              </div>
                              <div class="col s12">
                                  <ul class="collapsible z-depth-0" data-collapsible="accordion">
                                      <li>
                                        <div class="collapsible-header"><i class="material-icons green-text">info</i>Clean Cut</div>
                                        <div class="collapsible-body blue-grey lighten-5">
                                          <a class="waves-effect waves-orange btn-flat">Update</a>
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
                



    

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>


    <script type="text/javascript">
      $( document ).ready(function(){
        $(".button-collapse").sideNav();
          // Initialize collapsible (uncomment the line below if you use the dropdown variation)
        $('.collapsible').collapsible();
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

    <!-- upload image -->
    <script text="text/javascript">
      var loadFile = function(event) {
        var productimg = document.getElementById('productimg');
        productimg.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>

    <script type="text/javascript">
    function ServiceImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#serviceimg')
                        .attr('src', e.target.result)
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
   
    <script type="text/javascript">
    function ProductImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#productimg')
                        .attr('src', e.target.result)
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <script type="text/javascript">
    function success(){
      alert("Successfully Created!");
    }
    </script>
 

  </body>

</html>