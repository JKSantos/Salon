<!DOCTYPE html>
<html ng-app>
  
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Employee" %>
  <head>
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
                  <li>
                  <a href="admin-home.jsp" class="waves-effect"><b>Home</b></a>
                  </li>
                 <!--  <li class="no-padding"> -->
                    <ul class="collapsible" data-collapsible="accordion">
                      <li>
                        <a class="collapsible-header active"><b>Maintenance</b></a>
                          <div class="collapsible-body">
                            <ul>
                              <li class="orange"><a href="maintenance-emp.jsp">Employee</a></li>
                                      <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                      <li><a href="maintenance-promo.jsp">Promo</a></li>
                                      <li><a href="#">Discount</a></li>
                                      <li><a href="#">Package</a></li>
                                      <li><a href="#">Catalogue</a></li>
                                      <li><a href="#">Extra Charge</a></li>
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
                     <li>
                     <a href="admin-home.jsp" class="waves-effect"><b>Home</b></a>
                     </li>
                       <ul class="collapsible collapsible-accordion">
                          <li>
                           <a class="waves-effect collapsible-header active"><b>Maintenance</b></a>
                          
                             <div class="collapsible-body">
                               <ul>
                                 <li class="orange"><a href="maintenance-emp.jsp">Employee</a></li>
                                 <li><a href="maintenance-prodsvc.jsp">Product & Service</a></li>
                                 <li><a href="maintenance-promo.jsp">Promo</a></li>
                                 <li><a href="#">Discount</a></li>
                                 <li><a href="#">Package</a></li>
                                 <li><a href="#">Catalogue</a></li>
                                 <li><a href="#">Extra Charge</a></li>
                               </ul>
                             </div>
                         </li>
                         <li>
                           <a class="waves-effect collapsible-header"><b>Transaction</b></a>
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

                    <div class="main z-depth-barts" style="margin-left: 50px; margin-right: 50px;">
                        <div class="col s12" style="margin-left: 50px; margin-right: 50px;">
                        <h3 class="grey-text text-darken-1">Employee Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Date of Creation</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                  <c:forEach items="${empList}" var="employee">
                                    <%! String str=null; %>
                                    <% Employee emp = (Employee)pageContext.getAttribute("employee");
                                       str=String.valueOf(emp.getIntEmpID());
                                    %>
                                    <tr>
                                        <td>${employee.intEmpID}</td>
                                        <td>${employee.strEmpFirstName} ${employee.strEmpLastName}</td>
                                        <td>${employee.strJobQualification}</td>
                                        <td class="center">01/01/01</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#emp<%=str%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#delete" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>
                                  </c:forEach>

                                    
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                        <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" method="post" action="createEmployee" enctype="multipart/form-data">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Create Employee</h3>
                                </div>
                                <div class="input-field col s12">
                                   <div class="col s4">
                                       <label class="red-text">(*) Indicates required field</label>
                                   </div>
                                   <div class="col s4 offset-s4">
                                       <img name="image" id="employeeimg" class="circle z-depth-1" style="width: 150px; height: 150px;" src="./img/anon.jpg" alt=""/>
                                   </div>
                                </div>
                                <div class="input-field col s5 offset-s4">
                                    <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadFile(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="path" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class = "row">
                                <div class="input-field col s4">
                                    <input name="strEmpFirstName" d="strEmpFirstName" type="text" class="validate active" required>
                                    <label for="strEmpFirstName">First Name<span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s4">
                                    <input name="strEmpMiddleName" id="strEmpMiddleName" type="text" class="validate">
                                    <label for="strEmpMiddleName">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input name="strEmpLastName" id="strEmpLastName" type="text" class="validate" required>
                                    <label for="strEmpLastName">Last Name<span class="red-text">*</span></label>
                                </div>
                                </div>
                                <div class="input-field col s3">
                                  <select required name="strMonth">
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
                                  <label>Birthday <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s2">
                                  <input type="text" maxlength="2" class="validate" required name="strDay" id="strDay">
                                  <label for="strDay">Day</label>
                                </div>
                                <div class="input-field col s3">
                                  <input type="text" maxlength="4" class="validate" required name="strYear" id="strYear">
                                  <label for="strYear">Year</label>
                                </div>
                                <div class="input-field col s4">
                                    <input type="text" class="validate" disabled value="" id="age">
                                    <label style="color: #9e9e9e;">Age: </label>
                                </div>
                                <div class="input-field col s12" style="margin-left: 5px; padding: 0px;">
                                    <p style="color:#9e9e9e;font-size:11px;">Gender<span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s5" style="margin-top: -1px;">
                                    <select required class="browser-default" name="strEmpGender">
                                      <option value="" disabled selected></option>
                                      <option value="1">Male</option>
                                      <option value="2">Female</option>
                                    </select>
                                </div>
                                <div class="input-field col s1 offset-s2" style="margin-top: -4px;">
                                  <p style="margin-top: 12px; margin-left: -7px;">(+63)</p>
                                </div>
                                <div class="input-field col s4" style="margin-top: -4px;">
                                    <input name="strEmpContactNo" type="text" id="contact" class="validate" maxlength="10">
                                    <label for="contact">Contact Number</label>
                                </div>
                                <div class="input-field col s12">
                                    <input name="strEmpAddress" type="text" id="address" class="validate" required>
                                    <label for="address">Address <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s12">
                                    <p style="color:#9e9e9e;font-size:12px;">Position <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s5" style="margin-top: -1px;">
                                    <select class="browser-default" id="slct1" name="selectedJob" required>
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${empCategory}" var="name">
                                          <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2" style="margin-top: -0.2px;">
                                    <p style="margin-top: 5px;" class="center"><a id="optionadd" class="waves-effect waves-light orange-btn"><i class="material-icons small">add</i></a><a class="waves-effect waves-light orange-btn" onclick="removeopt()"><i class="material-icons small">remove</i></a></p>
                                </div>
                                <div class="input-field col s4" style="margin-top: -4px;">
                                    <input type="text" id="add-optname" class="validate">
                                    <label for="add-optname">Another position</label>
                                </div>
                                <div class="input-field col s12">
                                  <p class="center">
                                        <input type="checkbox" id="access" name="access" />
                                        <label for="access">Grant Access</label>
                                  </p>
                                </div>
                              
                            <!-- </div> -->
                            </div>
                          </div>
                          <div class="modal-footer">
                              <a href="#!" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>
                          </div>
                          </form>
                    </div>


                       <c:forEach items="${empList}" var="employee">  
                        <div id="emp${employee.intEmpID}" class="modal modal-fixed-footer">
                        <form class="col s12" method="post" action="updateEmployee" enctype="multipart/form-data">
                          <div class="modal-content">
                            <!-- <div class="container"> -->
                            <div class="row">
                              
                                <div class="input-field col s12">
                                  <h3 class="grey-text text-darken-1">Update Employee</h3>
                                </div>
                                <div class="input-field col s12">
                                   <div class="col s4 offset-s4">
                                       <img name="empupdatedImg" id="empupdatedImg" class="circle z-depth-1" style="width: 150px; height: 150px;" src="./img/anon.jpg" alt=""/>
                                   </div>
                                </div>
                                <div class="input-field col s3">
                                  <input type="text" value="${employee.intEmpID}" name="intEmpID" id="intEmpID">
                                  <label for="intEmpID">ID</label>
                                </div>
                                <div class="input-field col s5 offset-s1">
                                    <div class="file-field">
                                          <div class="btn orange">
                                            <span class="">Image</span>
                                            <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadUpdate(event)">
                                          </div>
                                          <div class="file-path-wrapper">
                                            <input name="imageName" id="imageName" value="image" class="file-path validate" type="text">
                                          </div>
                                      </div>
                                </div>
                                <div class="input-field col s3">
                                  <input type="text" disabled="disabled" name="empdoc" id="empdoc">
                                  <label for="empdoc">Date of Creation</label>
                                </div>
                                <div class="input-field col s4">
                                    <input value="${employee.strEmpFirstName}" name="strEmpFirstName" d="strEmpFirstName" type="text" class="validate active" required>
                                    <label for="strEmpFirstName">First Name<span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s4">
                                    <input value="${employee.strEmpMiddleName}" name="strEmpMiddleName" id="strEmpMiddleName" type="text" class="validate">
                                    <label for="strEmpMiddleName">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input value="${employee.strEmpLastName}" name="strEmpLastName" id="strEmpLastName" type="text" class="validate" required>
                                    <label for="strEmpLastName">Last Name<span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s3">
                                  <select required name="strMonth">
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
                                  <label>Birthday <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s2">
                                  <input type="text" maxlength="2" class="validate" required name="strDay" id="strDay">
                                  <label for="strDay">Day</label>
                                </div>
                                <div class="input-field col s3">
                                  <input type="text" maxlength="4" class="validate" required name="strYear" id="strYear">
                                  <label for="strYear">Year</label>
                                </div>
                                <div class="input-field col s4">
                                    <input type="text" class="validate" disabled value="" id="age">
                                    <label style="color: #9e9e9e;">Age: </label>
                                </div>
                                <div class="input-field col s12" style="margin-left: 5px; padding: 0px;">
                                    <p style="color:#9e9e9e;font-size:11px;">Gender<span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s5" style="margin-top: -1px;">
                                    <select name="strEmpGender" required class="browser-default">
                                      <option disabled selected></option>
                                      <option value="M">Male</option>
                                      <option value="F">Female</option>
                                    </select>
                                </div>
                                <div class="input-field col s1 offset-s2" style="margin-top: -4px;">
                                  <p style="margin-top: 12px; margin-left: -7px;">(+63)</p>
                                </div>
                                <div class="input-field col s4" style="margin-top: -4px;">
                                    <input  name="strEmpContactNo" value="${employee.strEmpContactNo}" name="strEmpContactNo" type="text" id="contact" class="validate" maxlength="10">
                                    <label for="contact">Contact Number</label>
                                </div>
                                <div class="input-field col s12">
                                    <input  name="strEmpAddress" value="${employee.strEmpAddress}" name="strEmpAddress" type="text" id="address" class="validate" required>
                                    <label for="address">Address <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s12">
                                    <p style="color:#9e9e9e;font-size:12px;">Position <span class="red-text">*</span></p>
                                </div>
                                <div class="input-field col s5" style="margin-top: -1px;">
                                    <select class="browser-default" id="slct1" name="selectedJob" required>
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${empCategory}" var="name">
                                          <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2" style="margin-top: -0.2px;">
                                    <p style="margin-top: 5px;" class="center"><a id="optionadd" class="waves-effect waves-light orange-btn"><i class="material-icons small">add</i></a><a class="waves-effect waves-light orange-btn" onclick="removeopt()"><i class="material-icons small">remove</i></a></p>
                                </div>
                                <div class="input-field col s4" style="margin-top: -4px;">
                                    <input type="text" id="add-optname" class="validate">
                                    <label for="add-optname">Another position</label>
                                </div>
                                <div class="input-field col s12">
                                  <p class="center">
                                        <input type="checkbox" id="access" name="access" />
                                        <label for="access">Grant Access</label>
                                  </p>
                                </div>
                              
                            <!-- </div> -->
                            </div>
                          </div>
                          <div class="modal-footer">
                              <a href="#!" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</a>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">UPDATE</button>
                          </div>
                          </form>
                    </div>
                  </c:forEach>


                          <div id="delete" class="modal">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p>Are you sure you want to deactivate this account?</p>
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
                                <button class="waves-effect waves-light orange btn-flat white-text">YES</button>
                                <a href="#" class="modal-action modal-close waves-effect waves-light transparent btn-flat black-text">NO</a>
                              </div>
                            </div>
                      </div>
<!--                     <div class="aside aside2 z-depth-barts">
                     
                    </div> -->
                </div>
        </div>
      <!-- </div> -->
        </article>

        

  </div>

  <style type="text/css">
  #create {
    width: 55% !important;
    height: 80% !important;
    max-height: 100% !important;
  }
  #update{
    width: 55% !important;
    height: 80% !important;
    max-height: 100% !important;
  }

  #delete {
    width: 30% !important;
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