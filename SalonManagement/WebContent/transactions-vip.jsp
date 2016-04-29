<!DOCTYPE html>
<html ng-app>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>

  <head>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-emp.css"/>
  <link rel="stylesheet" type="text/css" href="./css/datatables.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/datatables.material.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css">

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
                        <a class="collapsible-header"><b>Maintenance</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="employeeMaintenance">Employee</a></li>
                              <li><a href="productServiceMaintenance">Product & Service</a></li>
                              <li><a href="catalogueMaintenance">Catalogue</a></li>
                              <li><a href="packageMaintenance">Package</a></li>
                              <li><a href="locationMaintenance">Delivery Charge</a></li>
                              <li><a href="extraChargeMaintenance">Other Charge</a></li>
                              <li><a href="promoMaintenance">Promo</a></li>
                              <li><a href="discountMaintenance">Discount</a></li>
                            </ul>
                          </div>
                      </li>
                      <li>
                        <a class="collapsible-header active"><b>Transaction</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li><a href="transactions-inventory.jsp">Inventory</a></li>
                              <li><a href="transactions-reservation.jsp">Reservation</a></li>
                              <li><a href="transactions-productorder.jsp">Product Order</a></li>
                              <li class="purple lighten-4"><a href="transactions-vip.jsp">VIP</a></li>
                              <li><a href="transactions-walkin.jsp">Walk In</a></li>
                            </ul>
                          </div>
                      </li>
                    </ul>
                  <li><a href="utilities.jsp" class="waves-effect"><b>Utilities</b></a></li>
                </ul>

        
               <nav class="z-depth-0">
                 <div class="nav-wrapper purple">
                   <a href="#!" class="brand-logo white-text" style="margin-left: 30px;">Salon Management System</a>
                 
                   <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                   <ul class="side-nav" id="mobile-demo">
                     <li><a href="admin-home.jsp" class="waves-effect waves-purple"><b>Home</b></a>
                       <ul class="collapsible collapsible-accordion">
                         <li>
                           <a class="waves-effect waves-purple collapsible-header"><b>Maintenance</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="maintenance-emp.jsp">Employee</a></li>
                                 <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                 <li><a href="maintenance-promo.jsp">Promo</a></li>
                                 <li><a href="maintenance-discount.jsp">Discount</a></li>
                                 <li><a href="maintenance-package.jsp">Package</a></li>
                                 <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
                                 <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
                               </ul>
                             </div>
                         </li>
                         <li>
                           <a class="waves-effect waves-purple collapsible-header"><b>Transaction</b></a>
                             <div class="collapsible-body">
                               <ul>
                                 <li><a href="transactions-inventory.jsp">Inventory</a></li>
                                 <li><a href="transactions-reservation.jsp">Reservation</a></li>
                                 <li class="purple"><a href="transactions-vip.jsp">VIP</a></li>
                                 <li><a href="transactions-productorder.jsp">Product Order</a></li>
                                 <li><a href="#!">Walk-In</a></li>
                               </ul>
                             </div>
                         </li>
                       </ul>
                    <li><a href="utilities.jsp" class="waves-effect waves-purple"><b>Utilities</b></a></li>
                   </ul>
                 </div>
               </nav>
        </header>

        <article>
          <div class="wrapper">
                    <div class="aside aside2 z-depth-barts white">
                     <div class="row">
                         <div class="col s12">
                             <div class="row">
                                    <h2 class="thin">VIP List</h2>
                                      <table id="example" class="mdl-data-table" cellspacing="0" width="100%">
                                              <thead>
                                                  <tr>
                                                      <th>ID</th>
                                                      <th>Name</th>
                                                      <th>Actions</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
													
                                                  <tr>
                                                      <td>1</td>
                                                      <td>Ainan Ongsip</td>
                                                      <td><a href="#update" class="modal-trigger"><i class="material-icons green-text">edit</i></a>
                                                      <a href="#!"><i class="material-icons red-text">delete</i></a>
                                                      </td>
                                                  </tr>
                                              </tbody>
                                          </table>
                                      <br>
                                      <br>
                                      <div class="row right">
                                        <a class="btn-floating btn-large waves-effect waves-light purple darken-3" href="create-vip.jsp"><i class="material-icons">add</i></a>
                                      </div>


                                     <div id="update" class="modal modal-fixed-footer">
                                        <form>
                                         <div class="modal-content">
                                           <h4>Update Employee</h4>
                                           <div class="row">
                                             <div class="input-field col s6 offset-s3">
                                                <img name="upload" id="empupdateimg" style="width: 120px; height: 120px;" src="./img/anon.jpg" alt=""/>
                                              </div>
                                              <div class="input-field col s4">
                                                <input type="text" id="emp_id" disabled="disabled">
                                                <label for="emp_id">Employee ID</label>
                                              </div>
                                              <div class="input-field col s7 offset-s1">
                                                  <div class="file-field">
                                                        <div class="btn purple">
                                                          <span class="">Image</span>
                                                          <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadPic(event)">
                                                        </div>
                                                        <div class="file-path-wrapper">
                                                          <input name="strPath" value="image" class="file-path validate" type="text">
                                                        </div>
                                                    </div>
                                              </div>
                                              <div class="input-field col s4">
                                                  <input name="strEmpFirstName" id="fname" type="text" class="validate active">
                                                  <label for="fname">First Name</label>
                                              </div>
                                              <div class="input-field col s4">
                                                  <input name="strEmpMiddleName" id="mname" type="text" class="validate">
                                                  <label for="mname">Middle Name</label>
                                              </div>
                                              <div class="input-field col s4">
                                                  <input name="strEmpLastName" id="lname" type="text" class="validate">
                                                  <label for="lname">Last Name</label>
                                              </div>
                                              <div class="input-field col s3">
                                                  <select name="strMonth" id="month">
                                                    <option value="1">January</option>
                                                    <option value="2">February</option>
                                                    <option value="3">March</option>
                                                    <option value="4">April</option>
                                                    <option value="5">May</option>
                                                    <option value="6">June</option>
                                                    <option value="7">July</option>
                                                    <option value="8">August</option>
                                                    <option value="9">September</option>
                                                    <option value="10">October</option>
                                                    <option value="11">November</option>
                                                    <option value="12">December</option>
                                                  </select>
                                                  <label for="month">Month</label>
                                              </div>
                                              <div class="input-field col s1">
                                                  <input type="text" name="strDay" id="day" class="validate" maxlength="2">
                                                  <label for="day">Day</label>
                                              </div>
                                              <div class="input-field col s3">
                                                  <input type="text" name="strYear" maxlength="4" class="validate" id="year">
                                                  <label for="strYear">Year</label>
                                              </div>
                                              <div class="input-field col s2 offset-s2">
                                                  <input type="text" name="age" maxlength="3" class="validate" id="age" disabled="disabled">
                                                  <label for="age">Age</label>
                                              </div>
                                              <div class="input-field col s6" >
                                                  <select name="strEmpGender" required>
                                                    <option value="" disabled selected>Choose...</option>
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                  </select>
                                                  <label>Gender</label>
                                              </div>
                                              <div class="input-field col s1 offset-s1">
                                                <p style="margin-top: 12px; margin-left: -7px;">(+63)</p>
                                              </div>
                                              <div class="input-field col s4">
                                                  <input name="strEmpContactNo" type="text" id="number" class="validate" maxlength="10">
                                                  <label for="number">Contact Number</label>
                                              </div>
                                              <div class="input-field col s12">
                                                  <input name="strEmpAddress" type="text" id="adres" class="validate">
                                                  <label for="adres">Address</label>
                                              </div>
                                              <div class="input-field col s12">
                                                  <p style="color:#9e9e9e;font-size:12px;">Position</p>
                                              </div>
                                              <div class="input-field col s5" style="margin-top: -1px;">
                                                  <select class="browser-default" id="slct1" name="selectedJob">
                                                      <option value="" disabled selected>Choose Position</option>
                                                      <c:forEach items="${empCategory}" var="name">
                                                        <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                                      </c:forEach>
                                                  </select>
                                              </div>
                                              <div class="input-field col s2" style="margin-top: -0.2px;">
                                                  <p style="margin-top: 5px;" class="center"><a id="optionadd" class="waves-effect waves-light purple-btn"><i class="material-icons small">add</i></a><a class="waves-effect waves-light purple-btn" onclick="removeopt()"><i class="material-icons small">remove</i></a></p>
                                              </div>
                                              <div class="input-field col s4" style="margin-top: -4px;">
                                                  <input type="text" id="optname" class="validate">
                                                  <label for="optname">Another position</label>
                                              </div>
                                              <div class="divider col s12" style="margin-top: 20px;"></div>
                                              <div class="col s12"  style="margin-top: 10px;">
                                                  <h4>Account</h4>
                                              </div>
                                              <div class="input-field col s6 offset-s3">
                                                  <input name="strEmpUsername" type="text" class="validate" id="un" maxlength="15" disabled="disabled">
                                                  <label for="strEmpUsername">Username</label>
                                              </div>
                                              <div class="input-field col s6 offset-s3">
                                                  <input name="strEmpPassword" type="password" class="validate" id="pw" maxlength="20" disabled="disabled">
                                                  <label for="strEmpPassword">Password <span id="pw1"></span></label>
                                              </div>
                                              <div class="input-field col s6 offset-s3">
                                                  <input type="password" class="validate" id="conf-pw" maxlength="20" disabled="disabled">
                                                  <label for="conf-pw">Confirm Password <span id="pw2"></span></label>
                                              </div>
                                           </div>
                                         </div>
                                         <div class="modal-footer">
                                            <a href="#!" class="modal-action modal-close waves-purple btn-flat transparent">Cancel</a>
                                           <button class="modal-action waves-effect waves-light purple btn-flat ">Confirm</button>
                                         </div>
                                         </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
          </div>
        </article>

        

  </div>

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/jquery-latest.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    <script type="text/javascript" src="./js/angular.min.js"></script>
    <script type="text/javascript" src="./js/package.js"></script>
    <script type="text/javascript" src="./js/datatables.min.js"></script>
    <script type="text/javascript" src="./js/datatables.material.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
      });
    </script>

    <script type="text/javascript">
      $(document).ready(function() {
          $('#example').DataTable( {
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
              columnDefs: [
                  {
                      targets: [ 0, 1, 2 ],
                      className: 'mdl-data-table__cell--non-numeric',

                  },
              ]
          } );
      } );
    </script>

    <script type="text/javascript">
      $(document).ready(function() {
          $('#example').DataTable();
      } );
    </script>



  


    

    <script type="text/javascript">
      $( document ).ready(function(){
        $(".button-collapse").sideNav();
          // Initialize collapsible (uncomment the line below if you use the dropdown variation)
        $('.collapsible').collapsible();
      });
    </script>
    <!-- bday -->

    <!-- Upload image -->

    <script text="text/javascript">
      var loadFile = function(event) {
        var employeeimg = document.getElementById('employeeimg');
        employeeimg.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>

    <script text="text/javascript">
      var loadPic = function(event) {
        var empupdateimg = document.getElementById('empupdateimg');
        empupdateimg.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>

    <script text="text/javascript">
      var loadFile = editFile(event) {
        var output2 = document.getElementById('output2');
        output2.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>

    

    <script>
      $(document).ready(function() {
          $('select').material_select();
        });
      </script>

    <!--- Modal -->

    <script type="text/javascript">
        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();
          }); 
    </script>

    <script type="text/javascript">
          function checkPass(){
            var pass1 = document.getElementById('password').value;
            var pass2 = document.getElementById('conf-password').value;
            var good = "#66cc66";
            var bad = "#ff6666";

            if(pass1 == pass2 && pass2 == pass1 && pass1 != null && pass2 != null) {
              document.getElementById('confirmMsg').style.color = good;
              document.getElementById('confirmMsg').innerHTML = "Password Match!";
              document.getElementById('savebtn').disabled = false;
            }else{
              document.getElementById('confirmMsg').style.color = bad;
              document.getElementById('confirmMsg').style.color = bad;
              document.getElementById('confirmMsg').innerHTML = "Password Do Not Match!";
              document.getElementById('savebtn').disabled = true;
            }
          }
    </script>

    <!-- add option -->
    

    <script>
           $(document).ready(function(){
              $("#optionadd").click(function(){
                 var addopt = $("#add-optname").val();
                 if(jQuery.trim(addopt).length > 0){
                      var o = new Option(addopt, addopt, true);
                      /// jquerify the DOM object 'o' so we can use the html method
                      $(o).html(addopt);
                      $("#slct1").append(o);
                 }else{
                  $("<div title='Error!'>Empty</div>").dialog();
                 }
                   
                   });
                  
                });
    </script>
   
   <script type="text/javascript">
      function removeopt(){
        var x = document.getElementById("slct1");
        var y = document.getElementById("slct2");

        x.remove(x.selectedIndex);
        y.remove(y.selectedIndex);
      }
   </script>

   <script type="text/javascript">
   // var month = document.getElementById('month').value;
   // var day = document.getElementById('day').value;
   // var year = document.getElementById('year').value;

   // var curday = new Date();
   // var mm = curday.getMonth()+1;
   // var dd = curday.getDate();
   // var yyyy = curday.getFullYear();

   // var bday = month+'/'+day+'/'+year;
   // var today = mm+'/'+dd+'/'+yyyy;
   
   // if(day<32 && month!='' || day!='' || year!=''){
   //       if(month<=mm && day<=dd && year<=yyyy && day!='' && year>0){
   //             var myage = yyyy - year;
   //             document.getElementById('age').innerHTML = myage;
   //             document.getElementById('age').style.color = "black";
   //       } else if(month>=mm && day>dd && year<yyyy && year>0){
   //         var myage = yyyy-year;
   //         document.getElementById('age').innerHTML = myage-1;
   //         document.getElementById('age').style.color = "black";
   //       } else if(month>=mm && day<dd && year<yyyy && year>0){
   //         var myage = yyyy-year;
   //         document.getElementById('age').innerHTML = myage-1;
   //         document.getElementById('age').style.color = "black";
   //       }else if(year=='' || day=='' || month==''){
   //         document.getElementById('age').innerHTML = " ";
   //       }else if(year>yyyy){
   //         document.getElementById('age').innerHTML = "dpa buhay";
   //         document.getElementById('age').style.color = "red";
   //       }
   //   }
   //  else{
   //       document.getElementById('age').innerHTML = "";
   //  }
   // </script>

   <script type="text/javascript">
         function checkPass(){
           var pass1 = document.getElementById('pass').value;
           var pass2 = document.getElementById('conf-pass').value;
           var good = "#66cc66";
           var bad = "#ff6666";

           if(pass1 == pass2 && pass2 == pass1 && pass1 != "" && pass2 != "") {
             document.getElementById('confirmMsg').style.color = good;
             document.getElementById('confirmMsg').innerHTML = "Password Match!";
             document.getElementById('savebtn').disabled = false;
           }else{
             document.getElementById('confirmMsg').style.color = bad;
             document.getElementById('confirmMsg').style.color = bad;
             document.getElementById('confirmMsg').innerHTML = "Password Do Not Match!";
             document.getElementById('savebtn').disabled = true;
           }
         }
   </script>

  </body>

</html>