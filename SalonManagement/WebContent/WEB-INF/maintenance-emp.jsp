<!DOCTYPE html>
<html ng-app>
  <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Employee" %>
  <%@ page import="com.gss.model.EmployeeCategory" %>
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
  <%!
      String month = null;
      String gender = null;
      String position = null;
      String granAccess = null;
  %>


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
                                      <li><a href="maintenance-discount.jsp">Discount</a></li>
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
                                 <li><a href="maintenance-discount.jsp">Discount</a></li>
                                 <li><a href="maintenance-package.jsp">Package</a></li>
                                 <li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
                                 <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
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

                    <div class="main z-depth-barts" style="margin-left: 20px; margin-right: 20px;">
                        <div class="col s12" style="margin-left: 20px; margin-right: 20px;">
                        <h3 class="grey-text text-darken-1">Employee Maintenance</h3>
                        <a class="waves-effect waves-light modal-trigger btn-flat orange darken-3 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Date of Creation</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${empList}" var="employee">
                                    <%! String str=null; %>
                                    <% Employee emp = (Employee)pageContext.getAttribute("employee");
                                       str=String.valueOf(emp.getIntEmpID());
                                       String de = str;
                                    %>
                                    <tr>
                                        <td>${employee.intEmpID}</td>
                                        <td>${employee.strEmpFirstName} ${employee.strEmpLastName}</td>
                                        <td>${employee.strJobQualification}</td>
                                        <td class="center">01/01/01</td>
                                        <td>${employee.strEmpStatus}</td>
                                        <td><a class="waves-effect waves-light modal-trigger btn-flat transparent black-text" title="Update" href="#emp<%=str%>" style="padding: 0px;"><i class="material-icons">edit</i></a>
                                        <a class="waves-effect waves-light modal-trigger btn-flat transparent red-text text-accent-4" href="#de<%=de%>" title="Deactivate"><i class="material-icons">delete</i></a>
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
                                <div class="input-field col s4">
                                    <input type="date" class="datepicker" id="createBirthday" placeholder=" ">
                                    <label for="createBirthday">Birthday <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s4 offset-s4">
                                    <label for="createAge">Age</label>
                                    <input type="text" class="validate black-text" disabled id="createAge" placeholder="">
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
                                <div class="input-field col s4">
                                    <select class="browser-default" id="slct1" name="selectedJob" required>
                                        <option value="" disabled selected> </option>
                                        <c:forEach items="${empCategory}" var="name">
                                          <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-field col s2">
                                  <button data-target="addOption" class="waves-effect waves-light btn-flat modal-option orange lighten-1">add</button>
                                </div>
                                <div class="input-field col s6">
                                  <p class="center">
                                        <input type="checkbox" id="access" name="access" />
                                        <label for="access">Grant Access</label>
                                  </p>
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

                        <!-- add option -->
                        <div id="addOption" class="modal" style="margin-top: 30px;">
                          <form>
                            <div class="modal-content">
                              <h4>Add Another Position</h4>
                              <div class="row">
                                <div class="col s12">
                                  <div class="input-field col s8 offset-s2">
                                    <select id="addOptionSelect" class="browser-default" size="10">
                                      <c:forEach items="${empCategory}" var="name">
                                          <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                        </c:forEach>
                                    </select>
                                  </div>
                                  <div class="input-field col s8 offset-s2" style="margin-top: 20px;">
                                    <input type="text" class="validate" id="addOptionName" name="addOptionName">
                                    <label for="addOptionName">Position Name</label>
                                  </div>
                                  <div class="input-field col s8 offset-s2 center">
                                    <a href="" id="createAddPosition" class="modal-close waves-effect waves-light orange darken-4 btn-flat white-text">SAVE</a>
                                    <a href="" class="modal-close waves-effect waves-orange transparent btn-flat white">CANCEL</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </form>
                        </div>

                        <!-- add option end -->
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
                                  <input type="text" value="${employee.intEmpID}" name="intEmpID" id="intEmpID" disabled style="color:black;">
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
                                    <input value="${employee.strEmpFirstName}" name="strEmpFirstName" id="strEmpFirstName" type="text" class="validate active" required>
                                    <label for="strEmpFirstName">First Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input value="${employee.strEmpMiddleName}" name="strEmpMiddleName" id="strEmpMiddleName" type="text" class="validate">
                                    <label for="strEmpMiddleName">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input value="${employee.strEmpLastName}" name="strEmpLastName" id="strEmpLastName" type="text" class="validate" required>
                                    <label for="strEmpLastName">Last Name</label>
                                </div>
                                <%
                                    Employee updateEmp = (Employee)pageContext.getAttribute("employee");
                                    String gender = updateEmp.getStrEmpGender();
                                    month = String.valueOf(updateEmp.getStrEmpGender());
                                    String male = null;
                                    String female = null;
                                    String position = updateEmp.getStrJobQualification();

                                    if(month.equals("M")){
                                      male = "selected"; female="";
                                    }
                                    else{
                                      female = "selected"; male="";
                                    }
                                %>
                                <div class="input-field col s4">
                                    <input type="date" class="datepicker" id="updateBirthday" placeholder=" ">
                                    <label>Birthday</label>
                                </div>
                                <div class="input-field col s4 offset-s4">
                                    <label for="updateAge">Age</label>
                                    <input type="text" class="validate black-text" disabled value="" id="updateAge" placeholder="">
                                </div>
                                <div class="input-field col s12" style="margin-left: 5px; padding: 0px;">
                                    <p style="color:#9e9e9e;font-size:11px;">Gender</p>
                                </div>
                                <div class="input-field col s5" style="margin-top: -1px;">
                                    <select name="strEmpGender" required class="browser-default" autocomplete="off">
                                      <option disabled selected></option>
                                      <option value="M" <%out.println(male);%>>Male</option>
                                      <option value="F" <%out.println(female);%>>Female</option>
                                    </select>
                                </div>
                                <div class="input-field col s1 offset-s2" style="margin-top: -4px;">
                                  <p style="margin-top: 12px; margin-left: -7px;">(+63)</p>
                                </div>
                                <div class="input-field col s4" style="margin-top: -4px;">
                                    <input value="${employee.strEmpContactNo}" name="strEmpContactNo" type="text" id="contact" class="validate" maxlength="10">
                                    <label for="contact">Contact Number</label>
                                </div>
                                <div class="input-field col s12">
                                    <input value="${employee.strEmpAddress}" name="strEmpAddress" type="text" id="address" class="validate" required>
                                    <label for="address">Address</label>
                                </div>
                                <div class="input-field col s12">
                                    <p style="color:#9e9e9e;font-size:12px;">Position</p>
                                </div>
                                <div class="input-field col s4">
                                  <select class="browser-default slct2" id="slct2" name="selectedJob">
                                    <option value="" disabled selected>Choose...</option>
                                    <c:forEach items="${empCategory}" var="name">
                                          <%
                                              String empPosition = null;
                                              EmployeeCategory cate = (EmployeeCategory)pageContext.getAttribute("name");
                                              if(cate.getStrCategoryName().equals(position)){
                                                  empPosition = "selected";
                                              }
                                              else{
                                                  empPosition = "";
                                              }
                                          %>
                                          <option value="${name.strCategoryName}" <%out.println(empPosition);%>>${name.strCategoryName }</option>
                                      </c:forEach>    
                                  </select>
                                </div>
                                <div class="input-field col s2">
                                  <button data-target="updateOption" class="waves-effect waves-light btn-flat modal-optionUpdate orange lighten-1">add</button>
                                </div>
                                <div class="input-field col s6">
                                  <p class="center">
                                        <input type="checkbox" id="access" name="access" />
                                        <label for="access">Grant Access</label>
                                  </p>
                                </div>
                              
                            <!-- </div> -->
                            </div>
                          </div>
                          <div class="modal-footer">
                              <button type="reset" value="Reset" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</button>
                              <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">UPDATE</button>
                          </div>
                          </form>
                    </div>
                  </c:forEach>

                  <!-- update add option -->
                  <div id="updateOption" class="modal" style="margin-top: 30px;">
                          <form>
                            <div class="modal-content">
                              <h4>Add Another Position</h4>
                              <div class="row">
                                <div class="col s12">
                                  <div class="input-field col s8 offset-s2">
                                    <select id="updateAddOptionSelect" class="browser-default" size="10">
                                      <c:forEach items="${empCategory}" var="name">
                                          <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                        </c:forEach>
                                    </select>
                                  </div>
                                  <div class="input-field col s8 offset-s2" style="margin-top: 20px;">
                                    <input type="text" class="validate" id="updateAddOptionName" name="updateAddOptionName">
                                    <label for="updateAddOptionName">Position Name</label>
                                  </div>
                                  <div class="input-field col s8 offset-s2 center">
                                    <a href="" id="updateAddPosition" class="modal-close waves-effect waves-light orange darken-4 btn-flat white-text">SAVE</a>
                                    <button type="reset" value="Reset" class="modal-close waves-effect waves-orange transparent btn-flat white">CANCEL</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </form>
                        </div>
                  <!-- update add option END -->

                  <c:forEach items="${empList}" var="employee">
                      <div id="de${employee.intEmpID}" class="modal" style="width: 30% !important;">
                        <form method="get" action="deactivateEmployee">
                          <div class="container">
                            <div class="modal-content">
                              <div class="row">
                                <h5 class="red-text">Warning!</h5>
                                <p class="center">Are you sure?</p>
                                <input type="hidden" size="10" name="intEmpID" value="${employee.intEmpID}">
                              </div>
                            </div>
                              <div class="col s12 center" style="margin-bottom: 30px;">
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
  #addOptionSelect {
    height: 150px !important;
  }

  #updateAddOptionSelect {
    height: 150px !important;
  }

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

  #addOption {
    width: 40% !important;
  }

  #updateOption {
    width: 40% !important;
  }

  #updateAddOption {
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