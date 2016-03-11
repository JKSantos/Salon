<!DOCTYPE html>
<!--   <%@ taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.gss.model.Employee" %>
  <%@ page import="com.gss.model.EmployeeCategory" %>
 -->
<html ng-app>
  <head>
  <link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
  <link type="text/css" rel="stylesheet" href="./css/mtnc-emp.css"/>

  <link rel="stylesheet" type="text/css" href="./css/bartstable.css"/>
  <link rel="stylesheet" type="text/css" href="./css/material.min.css"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>

  <body class="purple lighten-5">
<!--   <%!
      String month = null;
      String gender = null;
      String position = null;
      String granAccess = null;
  %> -->

  <div class="wrapper">
            <header class="headnav">
                <ul id="slide-out" class="side-nav fixed z-depth-0">
                  <div class="center">
                      <img src="./img/logo.png" class="circle" style="width: 100%; height: 100%; margin-top: 40px; margin-bottom: 20px;">
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
                              <li class="purple lighten-4"><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
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
                 <div class="nav-wrapper purple darken-4">
                   <a href="#!" class="brand-logo purple-text text-lighten-5" style="margin-left: 20px;">Salon Management System</a>
                 
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
                                 <li class="blue"><a href="employeeMaintenance">Employee</a></li>
                                      <li><a href="productServiceMaintenance">Product & Service</a></li>
                                      <li><a href="promoMaintenance">Promo</a></li>
                                      <li><a href="discountMaintenance">Discount</a></li>
                                      <li><a href="maintenance-package.jsp">Package</a></li>
                                      <li><a href="catalogueMaintenance">Catalogue</a></li>
                                      <li><a href="extraChargeMaintenance">Extra Charge</a></li>
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
                        <a class="waves-effect waves-light modal-trigger btn-flat purple darken-2 left white-text" href="#create" style="margin-top: 50px; margin-left: 15px;">CREATE</a>
                        <table id="example" class="display centered responsive-table highlight" cellspacing="0" width="100%" style="border: 1px solid #bdbdbd; padding: 10px;" rowspan="10">
                                <thead>
                                    <tr>
                                        <th><center>Name</center></th>
                                        <th><center>Position</center></th>
                                        <th><center>Date Employed</center></th>
                                        <th><center>Status</center></th>
                                        <th><center>Actions</center></th>
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
                                        <td><center>${employee.strEmpFirstName} ${employee.strEmpLastName}</center></td>
                                        <td><center>${employee.strJobQualification}</center></td>
                                        <td><center>01/01/01</center></td>
                                        <td><center>${employee.strEmpStatus}</center></td>
                                        <td class="center" style="padding:0; margin:0;"><a data-delay="30" data-position="bottom" data-tooltip="Update" class="tooltipped waves-effect waves-purple modal-trigger btn-flat transparent black-text" href="#emp<%=str%>" style="padding-left: 10px;padding-right:10px; margin: 5px;"><i class="material-icons">edit</i></a>
                                        <a data-delay="30" data-position="bottom" data-tooltip="Deactivate" class="tooltipped waves-effect waves-purple modal-trigger btn-flat transparent red-text text-accent-4" href="#de<%=de%>" style="padding-left: 10px;padding-right:10px; margin: 5px;" title="Deactivate"><i class="material-icons">delete</i></a>
                                        </td>
                                    </tr>

									               </c:forEach>
                                    
                                </tbody>
                            </table>

                      </div>

                      <!-- Modal Structure -->
                       <div id="create" class="modal modal-fixed-footer">
                        <form class="col s12" method="post" action="createEmployee" enctype="multipart/form-data">
                          <div class="modal-content" style="padding-bottom: 0px !important;">
                            <!-- <div class="container"> -->
                          <div class="wrapper">
                            <div class="input-field col s12">
                                  <h4 class="grey-text text-darken-1">Create Employee</h4>
                            </div>
                                  <div class="aside aside1 z-depth-0">
                                  <!-- first -->
                                    <div class="row">
                                      <div class="input-field col s12">
                                           <img name="image" id="employeeimg" class="circle" style="width: 200px; height: 200px;" src="./img/anon.jpg" alt=""/>
                                       </div>
                                       <div class="input-field col s12">
                                           <div class="file-field">
                                                 <div class="btn purple darken-1">
                                                   <span class="">Image</span>
                                                   <input name="upload" type="file" accept="image/.jpg, image/.png" onchange="loadFile(event)">
                                                 </div>
                                                 <div class="file-path-wrapper">
                                                   <input name="path" value="image" class="file-path validate" type="text">
                                                 </div>
                                             </div>
                                       </div>
                                    </div>
                                  </div>
                                  <!-- END ASIDE 1 -->


                                    <div class="aside aside2 z-depth-0">
                                    <!-- second -->
                                      <div class="row">
                                        <div class="col s12" style="margin-bottom: 5px;">
                                             <label class="red-text left">(*) Indicates required field</label>
                                        </div>
                                        <div class="input-field col s12">
                                            <input name="strEmpFirstName" placeholder="Ex: Benigno" id="strEmpFirstName" type="text" class="validate" required>
                                            <label for="strEmpFirstName">First Name<span class="red-text"><b>*</b></span></label>
                                        </div>
                                        <div class="input-field col s12">
                                            <input name="strEmpMiddleName" placeholder="Ex: Cojuangco" id="strEmpMiddleName" type="text" class="validate">
                                            <label for="strEmpMiddleName">Middle Name</label>
                                        </div>
                                        <div class="input-field col s12">
                                            <input name="strEmpLastName" placeholder="Ex: Aquino" id="strEmpLastName" type="text" class="validate" required>
                                            <label for="strEmpLastName">Last Name<span class="red-text"><b>*</b></span></label>
                                        </div>
                                        <div class="input-field col s12">
                                            <input type="date" name="strBirthdate" placeholder="January 1, 1996" class="datepicker active" id="createBirthday" required>
                                            <label for="createBirthday" class="active">Birthday<span class="red-text">*</span></label>
                                        </div>
                                        <div class="input-field col s12">
                                            <label for="createAge">Age</label>
                                            <input type="text" class="validate black-text" disabled id="createAge" placeholder="Ex: 18">
                                        </div>
                                    </div>
                                  </div>
                                  <!-- END ASIDE 2 -->


                                  <div class="aside aside3 z-depth-0">
                                  <!-- third -->
                                    <div class="row">
                                      <div class="input-field col s12" style="margin-top: 40px !important;">
                                          <select required class="browser-default" name="strEmpGender" id="strEmpGender">
                                            <option value="" disabled selected></option>
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                          </select>
                                          <label for="strEmpGender" class="active">Gender<span class="red-text">*</span></label>
                                      </div>
                                      <div class="input-field col s1">
                                          <label style="margin-left: -3px; margin-top: 15px !important;" for="contact">(+63)</label>
                                      </div>
                                      <div class="input-field col s10" style="margin-top: 28px !important; margin-left: 10px;">
                                          <input name="strEmpContactNo" placeholder="Ex: 9268806979" type="text" id="contact" class="validate" maxlength="10">
                                          <label for="contact" style="margin-left: -35px;">Contact Number</label>
                                      </div>
                                      <div class="input-field col s12">
                                          <input type="email" placeholder="Ex: indexsalon@yahoo.com" class="validate" required id="emailadd">
                                          <label for="emailadd" class="active">Email<span class="red-text">*</span></label>
                                      </div>
                                      <div class="input-field col s12">
                                          <input name="strEmpAddress" placeholder="Ex: #20 Julian Eymard St. Sto.Nino Meycauayan, Bulacan" type="text" id="address" class="validate" required>
                                          <label for="address">Address<span class="red-text">*</span></label>
                                      </div>
                                      <div class="input-field col s8">
                                          <select class="browser-default" id="slct1" name="selectedJob" required>
                                              <option value="" disabled selected> </option>
                                              <c:forEach items="${empCategory}" var="name">
                                                <option value="${name.strCategoryName}">${name.strCategoryName }</option>
                                              </c:forEach>
                                          </select>
                                          <label for="slct1" class="active">Position<span class="red-text">*</span></label>
                                      </div>
                                      <div class="input-field col s4">
                                        <button data-target="addOption" class="waves-effect waves-light btn-flat modal-option orange lighten-1">add</button>
                                      </div>
                                      <div class="input-field col s12 left-align" style="margin-top: -4px;">
                                              <input type="checkbox" id="access" name="access" />
                                              <label for="access">Grant Access</label>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- END OF ASIDE3 -->

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
                                  <input type="text" value="${employee.intEmpID}" name="intEmpID" id="intEmpID" style="color:black;">
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
                                    <input name="strBirthdate" type="date" class="datepicker" id="updateBirthday" placeholder=" ">
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
    width: 80% !important;
    height: 86% !important;
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
    <script type="text/javascript" src="./js/bartstable.js"></script>
  </body>


</html>