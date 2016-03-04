<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="./css/materialize.css"/>
	<link type="text/css" rel="stylesheet" href="./css/mystyle.css"/>
	<link rel="stylesheet" type="text/css" href="./css/datatables.min.css"/>
	<link rel="stylesheet" type="text/css" href="./css/datatables.material.min.css"/>
	<link rel="stylesheet" type="text/css" href="./css/material.min.css">
	<link type="text/css" rel="stylesheet" href="./css/trans-reservation.css"/><!--Let browser know website is optimized for mobile-->
	<!-- full calendar declrations -->
	<link href='./css/fullcalendar.css' rel='stylesheet' />
	<link href='./css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='./js/moment.min.js'></script>
	<script src='./js/jquery.min.js'></script>
	<script src='./js/fullcalendar.min.js'></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js" type="text/javascript"></script>


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
																<a class="collapsible-header"><b>Maintenance</b></a>
																	<div class="collapsible-body">
																		<ul>
																			<li><a href="employeeMaintenance.action">Employee</a></li>
																			<li><a href="productServiceMaintenance.action">Product & Service</a></li>
																			<li><a href="maintenance-promo.jsp">Promo</a></li>
																			<li><a href="discountMaintenance.action">Discount</a></li>
																			<li><a href="maintenance-package.jsp">Package</a></li>
																			<li><a href="maintenance-catalogue.jsp">Catalogue</a></li>
																			<li><a href="extraChargeMaintenance.action">Extra Charge</a></li>
																		</ul>
																	</div>
															</li>
															<li>
																<a class="collapsible-header active"><b>Transaction</b></a>
																	<div class="collapsible-body">
																		<ul>
																			<li><a href="transactions-inventory.jsp">Inventory</a></li>
																			<li class="orange"><a href="transactions-reservation.jsp">Reservation</a></li>
																			<li><a href="transactions-vip.jsp">VIP</a></li>
																			<li><a href="transactions-productorder.jsp">Product Order</a></li>
																			<li><a href="#!">Walk-In</a></li>
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
																				 <li><a href="maintenance-discount.jsp">Discount</a></li>
																				 <li><a href="maintenance-package.jsp">Package</a></li>
																				 <li><a href="maintenance-catalouge.jsp">Catalogue</a></li>
																				 <li><a href="maintenance-extra.jsp">Extra Charge</a></li>
																			 </ul>
																		 </div>
																 </li>
																 <li>
																	 <a class="waves-effect waves-orange collapsible-header"><b>Transaction</b></a>
																		 <div class="collapsible-body">
																			 <ul>
																				 <li><a href="transactions-inventory.jsp">Inventory</a></li>
																				 <li class="orange"><a href="transactions-reservation.jsp">Reservation</a></li>
																				 <li><a href="transactions-productorder.jsp">Product Order</a></li>
																				 <li><a href="transactions-walkin.jsp">Walk-In</a></li>
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
									<div class="white z-depth-barts">
											<div class="container">
												<form class="col s12" id="myForm">

													<div class="row center">
														<div class="input-field col s12">
															<h2 class="thin">Create Reservation</h2>
														</div>
													</div>

													<div class="row">
															<p class="red-text">(*) Includes required field</p>
													</div>

												 <div class="input-field col s12">
														 <input type="number" class="validate" required id="reserve_headcount" maxlength="4" onkeyup="notifyStylist()">
														 <label for="reserve_headcount">Head Count <span class="red-text">*</span></label>
												 </div>
													
												 <div class="row">
														 <div class="input-field col s6">
																 <select id="reserve_eventhome" onchange="enableService(this);">
																			 <option value="choose" disabled selected>Choose...</option>
																			 <option value="event">Event</option>
																			 <option value="home">Home Service</option>
																 </select>
																 <label>Service <span class="red-text">*</span></label>
														 </div>
														 <div class="input-field col s3">
																 <input type="date" class="datepicker" id="datetimestart" placeholder="Date Start" disabled="disabled">
														 </div>
														 <div class="input-field col s3">
																 <input type="date" class="datepicker" id="datetimeend" placeholder="Date End" disabled="disabled">
														 </div>
													</div>

												<div class="row">     
													 <div class="input-field col s6">
															 <select id="" onchange="enableVIP(this);">
																		 <option value="vip1">VIP - Ainan Ongsip</option>
																		 <option value="guest" selected>Guest</option>
															 </select>
															 <label>VIP List <span class="red-text">*</span></label>
													 </div>
													 <div class="input-field col s6">
															 <select id="guesttype" onchange="enableCompany(this);">
																 <option value="individual">Individual</option>
																 <option value="company">Company</option>
															 </select>
															 <label>Guest Type</label>
													 </div>
												 </div>

												 <div class="input-field col s12">
														 <input type="text" class="validate" name="reserve_companyname" id="reserve_companyname" disabled="disabled">
														 <label for="reserve_companyname">Company Name</label>
												 </div>
												 <div class="input-field col s12">
														 <input type="text" class="validate" required name="reserve_customername" id="reserve_customername">
														 <label for="reserve_customername">Name <span class="red-text">*</span></label>
												 </div>
												 <div class="input-field col s12">
														 <input type="text" class="validate" id="reserve_venue" required>
														 <label for="reserve_venue">Venue <span class="red-text">*</span></label>
												 </div>

												 <div class="row">
														<div class="input-field col s4">
														 <select id="package-list"  class="browser-default">
																	 <option value="" disabled selected>Choose your option</option>
																	 <option value="Package 1">Package 1</option>
																	 <option value="Package 2">Package 2</option>
																	 <option value="Package 3">Package 3</option>
																	 <option value="customize">Custom</option>
														 </select>
														 <!-- <label>Package Available</label> -->
														</div>

														<div class="input-field col s4">
															 <input type="number" class="validate" id="package_quantity">
															 <label for="package_quantity">Quantity</label>
														</div>

														<div class="col s4" align="middle">
															 <button class="waves-effect waves-light btn col s4" onclick="myFunction()">ADD</button>
														</div>
												 </div>							 

														 <div class="row">
															 <table class="center-aligned highlight" id="packageTable">

															 </table>
														 </div>
												 
												 <div class="row">
														<div class="input-field col s4" stype="margin-top: -10px;">
														 <select id="servicelist" disabled="disabled" multiple>
																	 <option value="" disabled selected>Choose your option</option>
																	 <c:forEach items="${productList}" var="product">
																		<option value="${product.intProductName}">{product.intProductName}</option>
																	 </c:forEach>
														 </select>
														 <label>Service Available</label>
														</div>

														 <div class="input-field col s4">
																 <input type="number" class="validate" id="package_quantity">
																 <label for="service_quantity">Quantity</label>
														 </div>

														 <div class="col s4">
															 <a class="waves-effect waves-light btn">ADD</a>
														 </div>
												 </div>
														 <div id="div1">
															 
														 </div>

												<div class="row">
													<p id="notify"></p>
												</div>
															 
												 <div class="input-field col s12">
														 <select id="stylistlist" multiple>
																	 <option value="" disabled selected>Choose your option</option>
																	 <option value="">stylist1</option>
																	 <option value="">stylist2</option>
																	 <option value="">stylist3</option>
																	 <option value="">stylist4</option>
																	 <option value="">stylist5</option>
																	 <option value="">stylist6</option>
														 </select>
														 <!-- <label>Stylist Available<span class="red-text">*</span></label> -->
												 </div>
												 
											
												<div class="row col s12 center">
													 <a href="transactions-reservation.jsp" class=" modal-action modal-close waves-effect waves-orange transparent btn-flat">CANCEL</a>
														 <button class="waves-effect waves-light orange darken-3 white-text btn-flat" type="submit" value="Submit">CREATE</button>   
												</div>
																						
													</form>
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
		<script type="text/javascript" src="./js/addPackage.js"></script>

		<script type="text/javascript">	
			$(function () {
			    $('#mySuperCoolForm').validate({
			        rules: {
			            things: {
			                required: true
			            }
			        },
			        messages: {
			            things: {
			                required: 'Please select at least one thing.'
			            }
			        }
			    });
			});
		</script>

		<script type="text/javascript">
				$(document).ready(function(){
						// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
						$('.modal-trigger').leanModal();
					}); 
		</script>

		<script type="text/javascript">
		 function notifyStylist(){
		 	var headCount = document.getElementById('reserve_headcount').value
		 	alert(headCount);
		 	if(headCount <= 3){
		 		document.getElementById("notify").innerHTML = "Choose at least 1 stylist!";
		 		howMany(1);
		 	}
		 	else if(headCount <= 6){
		 		document.getElementById("notify").innerHTML = "Choose at least 2 stylists!";
		 	}
		 	else if(headCount <= 9){
		 		document.getElementById("notify").innerHTML = "Choose at least 3 stylist!";
		 	}
		 	else if (headCount <= 12) {
		 		document.getElementById("notify").innerHTML = "Choose at least 4 stylists!";
		 	}
		 	else{
		 		document.getElementById("notify").innerHTML = "Choose at least 1 stylist!";
		 	}
		 }

		 $(function howMany(stylist) {
		     $('#myForm').validate({
		         rules: {
		             things: {
		                 minlength: stylist
		             }
		         },
		         messages: {
		             things: {
		                 minlength: $.format('Please select at least {0} things.')
		             }
		         }
		     });
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
				function enableService(datetime){
						var dtmstart = document.getElementById('datetimestart');
						var dtmend = document.getElementById('datetimeend');

						if(datetime.options[datetime.selectedIndex].value=='home'){
							dtmstart.disabled = false;
							dtmend.disabled = true;
							dtmend.value = '';
							dtmstart.value = '';
						}else if(datetime.options[datetime.selectedIndex].value=='event'){
							dtmstart.disabled = false;
							dtmend.disabled = false;
							dtmstart.value = '';
							dtmend.value = '';
						}
						return;
					}
		</script>

		

		<script type="text/javascript">
				$(function(){
					$('#package-list').change(function(){
						if ($(this).val()=='customize'){
							$('#servicelist').prop('disabled', false);
						}else{
							$('#servicelist').prop('disabled', true);
						}
					});
				});
		</script>
	 
		<script type="text/javascript">
				$(document).ready(function(){
						// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
						$('.modal-trigger').leanModal();
					}); 
		</script>

		<script type="text/javascript">
				function enableVIP(selectguest){
					guest = document.getElementById('reserve_customername');

					if(selectguest.options[selectguest.selectedIndex].value=='guest'){
						guest.disabled = false;
					}else{
						guest.disabled = true;
						guest.value = '';
					}
					return;
				}
		</script>

<!-- reservation schedule viewer -->
	</body>

</html>