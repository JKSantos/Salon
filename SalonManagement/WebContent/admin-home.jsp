<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/admin.css"/>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                                      <li><a href="employeeMaintenance.action">Employee</a></li>
                                      <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                      <li><a href="maintenance-promdisc.jsp">Promo</a></li>
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
                             <li><a href="admin-home.jsp" class="waves-effect waves-orange"><b>Home</b></a></li>
                               <ul class="collapsible collapsible-accordion">
                                 <li>
                                   <a class="waves-effect waves-orange collapsible-header"><b>Maintenance</b></a>
                                     <div class="collapsible-body">
                                       <ul>
                                         <li><a href="maintenance-emp.jsp">Employee</a></li>
                                         <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                         <li><a href="maintenance-promdisc.jsp">Promo</a></li>
                                         <li><a href="maintenance-package.jsp">Discount</a></li>
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

        <!-- <article>
          <div class="wrapper">
                    <div class="aside aside1 z-depth-1">
                      <header><h5>Add Employee</h5></header>

                      <div class="row">
                          <form class="col s12" action="">
                              <div class="row">
                                  <div class="input-field col s6 offset-s6">
                                      <img  id="output1" style="width: 120px; height: 120px;" src="./img/anon.jpg" alt=""/>
                                  </div>
                                  <div class="input-field col s4">
                                      <input id="empid" type="text" disabled="disabled">
                                      <label for="empid">Employee ID</label>
                                  </div>
                                  <div class="input-field col s7 offset-s1">
                                      <div class="file-field">
                                            <div class="btn orange">
                                              <span class="">File</span>
                                              <input type="file" accept="image/*" onchange="loadFile(event)">
                                            </div>
                                            <div class="file-path-wrapper">
                                              <input class="file-path validate" type="text">
                                            </div>
                                        </div>
                                  </div>
                                  <div class="input-field col s12">
                                      <input id="fname" type="text" class="validate">
                                      <label for="fname">First Name</label>
                                  </div>
                                  <div class="input-field col s6">
                                      <input id="mname" type="text" class="validate">
                                      <label for="mname">Middle Name</label>
                                  </div>
                                  <div class="input-field col s6">
                                      <input id="lname" type="text" class="validate">
                                      <label for="lname">Last Name</label>
                                  </div>
                                  <div class="input-field col s12">
                                      <div class="input-field col s4">
                                          <select>
                                            <option value="" disabled selected>Month</option>
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
                                          <label>Birthday</label>
                                        </div>
                                        <div class="input-field col s2">
                                          <input type="text" id="day" class="validate" maxlength="2" style="margin-left: -25px;">
                                          <label for="day" style="margin-left: -10px;">Day</label>
                                        </div>
                                        <div class="input-field col s2">
                                          <input type="text" id="year" class="validate" maxlength="4" style="margin-left: -50px;">
                                          <label for="year" style="margin-left: -25px;">Year</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <input type="text" id="age" class="validate" maxlength="3" disabled="disabled">
                                            <label for="age">Age</label>
                                        </div>
                                  </div>
                                  <div class="input-field col s6">
                                      <p>   
                                            <input class="with-gap" name="group1" type="radio" id="Male" value="Male" />
                                            <label for="Male">Male</label>
                                            <input class="with-gap" name="group1" type="radio" id="Female" value="Female" />
                                            <label for="Female">Female</label>
                                        </p>
                                  </div>
                                  <div class="input-field col s1">
                                    <p style="margin-top: 12px; margin-left: -9px;">(+63)</p>
                                  </div>
                                  <div class="input-field col s5">
                                      <input type="text" id="contact" class="validate" maxlength="10">
                                      <label for="contact">Contact Number</label>
                                  </div>
                                  <div class="input-field col s12">
                                      <input type="text" id="address" class="validate">
                                      <label for="address">Address</label>
                                  </div>
                                  <div class="input-field col s12">
                                      <select multiple>
                                        <option value="" disabled selected>Choose Position:</option>
                                        <c:forEach items="${empCategory}" var="name">
                                          	<option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                          </c:forEach>
                                      </select>
                                      <label>Position:</label>
                                    </div>

                                  <a class="modal-trigger waves-effect waves-white btn-flat orange" title="Next" href="#modal1">NEXT</a>
                                  <button class="waves-effect waves-orange btn-flat white" type="reset" value="Reset" title="Clear">CLEAR</button>
                              </div>

                              Modal Structure
                                <div id="modal1" class="modal modal-fixed-footer" style="width: 450px; height: 450px;">
                                  <div class="modal-content">
                                    <h4>Employee Account</h4>
                                    <div class="row">
                                        <div class="col s12">
                                            <div class="row">
                                              <div class="input-field col s8 offset-s2">
                                                <input id="username" type="text" class="validate">
                                                <label for="username">Username</label>
                                              </div>
                                              <div class="input-field col s8 offset-s2">
                                                <input id="password" type="password" class="validate">
                                                <label for="password">Password</label>
                                              </div>
                                              <div class="input-field col s8 offset-s2">
                                                <input id="conf-password" type="password" class="validate" onkeyup="checkPass(); return false;">
                                                <label for="conf-password">Confirm Password</label>
                                                <span id="confirmMsg" class="confirmMsg"></span>
                                              </div>
                                              <div class="input-field col s8 offset-s2">
                                                <p id="pass-error"></p>
                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                                  <div class="modal-footer">
                                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">CANCEL</a>
                                    <button href="#!" class="modal-action waves-effect waves-green btn-flat orange" id="savebtn" disabled="disabled">SAVE</button>
                                  </div>
                                </div>

                          </form>
                      </div>

                     

                    </div>


                    <div class="aside aside2 z-depth-1">
                      EDIT/DELETE/VIEW Employee
                      edit/delete/view employee
                    </div>
          </div>
        </article> -->

        

  </div>
                



    

  <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="./js/materialize.min.js"></script>
    
    <script type="text/javascript">
      $( document ).ready(function(){

        $(".button-collapse").sideNav();
            
        
      });
    </script>

    <!-- Upload image -->

    <script text="text/javascript">
      var loadFile = function(event) {
        var output1 = document.getElementById('output1');
        output1.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>

    <!-- Birthday -->

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

            if(pass1 == pass2 && pass2 == pass1 && pass1 != null) {
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