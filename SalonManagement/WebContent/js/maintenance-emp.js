    $(document).ready(function() {
          $('#example').DataTable( {
            "bLengthChange": false,
            responsive: true,
              columnDefs: [
                  {
                      targets: [ 0, 1, 2 ],
                      className: 'mdl-data-table__cell--non-numeric'
                  }
              ]
          } );
      } );

        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal({
              dismissible: false, // Modal can be dismissed by clicking outside of the modal
              opacity: .9, // Opacity of modal background
              in_duration: 400, // Transition in duration
              out_duration: 400, // Transition out duration
            }
          );


  $('.modal-view').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .5, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );

  $('.modal-option').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .2, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );

  $('.modal-optionUpdate').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .2, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );

  $('.modal-category').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .2, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );

  $('.modal-updateCategory').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .2, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );

  $('#addOptionSelect').click(function(){
      $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
  });

  $('#updateOptionSelect').click(function(){
      $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
  });

  $('#addCatgorySelect').click(function(){
      $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
  });

  $('#updateCatgorySelect').click(function(){
      $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
  });


$('.tooltipped').tooltip({delay: 30});

      $( document ).ready(function(){
        $(".button-collapse").sideNav();
          // Initialize collapsible (uncomment the line below if you use the dropdown variation)
        $('.collapsible').collapsible();
        $('select').material_select();
        

      });

      var loadFile = function(event) {
        var employeeimg = document.getElementById('employeeimg');
        employeeimg.src = URL.createObjectURL(event.target.files[0]);
      };

      var loadUpdate = function(event) {
        var empupdatedImg = document.getElementById('empupdatedImg');
        empupdatedImg.src = URL.createObjectURL(event.target.files[0]);
      };

      var loadProdSvc = function(event) {
        var prodsvcCreate = document.getElementById('prodsvcCreate');
        prodsvcCreate.src = URL.createObjectURL(event.target.files[0]);
      };

      var loadUpdateProdSvc = function(event) {
        var updateProdSvc = document.getElementById('updateProdSvc');
        updateProdSvc.src = URL.createObjectURL(event.target.files[0]);
      };

      var loadCreateCatalogue = function(event) {
        var createCatalogue = document.getElementById('createCatalogue');
        createCatalogue.src = URL.createObjectURL(event.target.files[0]);
      };

      var loadUpdateCatalogue = function(event) {
        var updateCatalogue = document.getElementById('updateCatalogue');
        updateCatalogue.src = URL.createObjectURL(event.target.files[0]);
      };



      // add product / service in table (PROMO)

      function addServPromo() {
          var table = document.getElementById("promoTable");
          var promoType = $("#promoService").val();
          var promoQty = $("#promoServiceQty").val();
          var removeBtn = document.createElement('button');
         
          var rowCount = table.rows.length;
          var row = table.insertRow(rowCount);
          var i = rowCount;
          var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoType+'" id="createServPromType['+i+']" name="createServPromType" readonly style="color:black;"/>';
          var cell2 = row.insertCell(1);
            var servPromQty = document.createElement("input");
            servPromQty.type = "number";
            servPromQty.name = "createServPromQty";
            servPromQty.style = "color: black";
            servPromQty.value = promoQty;
          cell2.appendChild(servPromQty);
          var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteServPromo(this)" />';
          var x = document.getElementById("promoService");
              x.remove(x.selectedIndex);
      }

      function deleteServPromo(row)
      {
          var x=row.parentNode.parentNode.rowIndex;
          // var packageText = document.getElementById("promoTable").rows[i].cells[0].innerHTML;
          var packageText = document.getElementById("promoTable").rows[x].cells[0].firstChild.value;
          document.getElementById('promoTable').deleteRow(x);
          
          alert(packageText);
          var y = document.getElementById("promoService");
          var option = document.createElement("option");
          option.text = packageText;

          y.add(option);
      }

      function addProdPromo() {
          var table = document.getElementById("promoTable");
          var promoProdType = $("#promoProduct").val();
          var promoProdQty = $("#promoProductQty").val();
          var removeBtn = document.createElement('button');
         
           var rowCount = table.rows.length;
          var row = table.insertRow(rowCount);
          var i = rowCount;
          var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoProdType+'" id="createProdPromType['+i+']" name="createProdPromType" readonly style="color:black;"/>';
          var cell2 = row.insertCell(1);
            var prodPromQty = document.createElement("input");
            prodPromQty.type = "number";
            prodPromQty.name = "createProdPromQty";
            prodPromQty.style = "color: black";
            prodPromQty.value = promoProdQty;
          cell2.appendChild(prodPromQty);
          var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteProdPromo(this)" />';
          var x = document.getElementById("promoProduct");
              x.remove(x.selectedIndex);
      }

      function deleteProdPromo(row)
      {
          var i=row.parentNode.parentNode.rowIndex;
          var packageText = document.getElementById("promoTable").rows[i].cells[0].firstChild.value;
          document.getElementById('promoTable').deleteRow(i);
          
          alert(packageText);
          var y = document.getElementById("promoProduct");
          var option = document.createElement("option");
          option.text = packageText;

          y.add(option);
      }


      // add product/service in update BEGIN
      function updateServPromo() {
          var table = document.getElementById("updatePromoTable");
          var promoType = $("#updatePromoService").val();
          var promoQty = $("#updatePromoSQty").val();
          var removeBtn = document.createElement('button');
         
          var rowCount = table.rows.length;
          var row = table.insertRow(rowCount);
          var i = rowCount;
          var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoType+'" id="updateServPromType['+i+']" name="updateServPromType['+i+']" disabled="disabled" style="color:black;"/>';
          var cell2 = row.insertCell(1);
            var updateServPromQty = document.createElement("input");
            updateServPromQty.type = "number";
            updateServPromQty.name = "updateServPromQty["+i+"]";
            updateServPromQty.disabled = true;
            updateServPromQty.style = "color: black";
            updateServPromQty.value = promoQty;
          cell2.appendChild(updateServPromQty);
          var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteUpdateSPromo(this)" />';
          var x = document.getElementById("updatePromoService");
              x.remove(x.selectedIndex);
      }

      function deleteUpdateSPromo(row)
      {
          var i=row.parentNode.parentNode.rowIndex;
          var packageText = document.getElementById("updatePromoTable").rows[i].cells[0].firstChild.value;
          document.getElementById('updatePromoTable').deleteRow(i);
          
          alert(packageText);
          var y = document.getElementById("updatePromoService");
          var option = document.createElement("option");
          option.text = packageText;

          y.add(option);
      }

      function updateProdPromo() {
          var table = document.getElementById("updatePromoTable");
          var promoProdType = $("#updatePromoProduct").val();
          var promoProdQty = $("#updatePromoPQty").val();
          var removeBtn = document.createElement('button');
         
          var rowCount = table.rows.length;
          var row = table.insertRow(rowCount);
          var i = rowCount;
          var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoProdType+'" id="updateProdPromType['+i+']" name="updateProdPromType['+i+']" disabled="disabled" style="color:black;"/>';
          var cell2 = row.insertCell(1);
            var updateProdPromQty = document.createElement("input");
            updateProdPromQty.type = "number";
            updateProdPromQty.name = "updateProdPromQty["+i+"]";
            updateProdPromQty.disabled = true;
            updateProdPromQty.style = "color: black";
            updateProdPromQty.value = promoProdQty;
          cell2.appendChild(updateProdPromQty);
          var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteUpdatePPromo(this)" />';
          var x = document.getElementById("updatePromoProduct");
              x.remove(x.selectedIndex);


      }

      function deleteUpdatePPromo(row)
      {
          var i=row.parentNode.parentNode.rowIndex;
          var packageText = document.getElementById("updatePromoTable").rows[i].cells[0].firstChild.value;
          document.getElementById('updatePromoTable').deleteRow(i);
          
          alert(packageText);
          var y = document.getElementById("updatePromoProduct");
          var option = document.createElement("option");
          option.text = packageText;

          y.add(option);
      }
      // add product/service in update END


      // add product/service in package BEGIN
        function createPackageService() {
            var table = document.getElementById("createPackageTable");
            var packageType = $("#createPackageService").val();
            var packageQty = $("#createPackageServiceQty").val();
            var removeBtn = document.createElement('button');
           
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var i = rowCount;
            var cell1 = row.insertCell(0);
              cell1.innerHTML = '<input type="text" value="'+packageType+'" id="createPackServType['+i+']" name="createPackServType['+i+']" disabled="disabled" style="color:black;"/>';
            var cell2 = row.insertCell(1);
              var createPackServQty = document.createElement("input");
              createPackServQty.type = "number";
              createPackServQty.name = "createPackServQty["+i+"]";
              createPackServQty.disabled = true;
              createPackServQty.style = "color: black";
              createPackServQty.value = packageQty;
            cell2.appendChild(createPackServQty);
            var cell3 = row.insertCell(2);
            // cell1.innerHTML = promoType;
            // cell2.innerHTML = promoQty;
            cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteCreateServPack(this)" />';
            var x = document.getElementById("createPackageService");
                x.remove(x.selectedIndex);
        }

        function deleteCreateServPack(row)
        {
            var i=row.parentNode.parentNode.rowIndex;
            var packageText = document.getElementById("createPackageTable").rows[i].cells[0].firstChild.value;
            document.getElementById('createPackageTable').deleteRow(i);
            
            alert(packageText);
            var y = document.getElementById("createPackageService");
            var option = document.createElement("option");
            option.text = packageText;

            y.add(option);
        }

        function createPackageProduct() {
            var table = document.getElementById("createPackageTable");
            var promoType = $("#createPackageProduct").val();
            var promoQty = $("#createPackageProductQty").val();
            var removeBtn = document.createElement('button');
           
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var i = rowCount;
            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoType+'" id="createPackProdType['+i+']" name="createPackProdType['+i+']" disabled="disabled" style="color:black;"/>';
            var cell2 = row.insertCell(1);
            var createPackProdQty = document.createElement("input");
            createPackProdQty.type = "number";
            createPackProdQty.name = "createPackProdQty["+i+"]";
            createPackProdQty.disabled = true;
            createPackProdQty.style = "color: black";
            createPackProdQty.value = promoQty;
            cell2.appendChild(createPackProdQty);
          var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteCreateProdPack(this)" />';
          var x = document.getElementById("createPackageProduct");
              x.remove(x.selectedIndex);
        }

        function deleteCreateProdPack(row)
        {
            var i=row.parentNode.parentNode.rowIndex;
            var packageText = document.getElementById("createPackageTable").rows[i].cells[0].firstChild.value;
            document.getElementById('createPackageTable').deleteRow(i);
            
            alert(packageText);
            var y = document.getElementById("createPackageProduct");
            var option = document.createElement("option");
            option.text = packageText;

            y.add(option);
        }

        function updatePackageService() {
            var table = document.getElementById("updatePackageTable");
            var promoType = $("#updatePackageService").val();
            var promoQty = $("#updatePackageServiceQty").val();
            var removeBtn = document.createElement('button');
           
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var i = rowCount;
            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoType+'" id="updateServPackType['+i+']" name="updateServPackType['+i+']" disabled="disabled" style="color:black;"/>';
            var cell2 = row.insertCell(1);
            var updateServPackQty = document.createElement("input");
            updateServPackQty.type = "number";
            updateServPackQty.name = "updateServPackQty["+i+"]";
            updateServPackQty.disabled = true;
            updateServPackQty.style = "color: black";
            updateServPackQty.value = promoQty;
            cell2.appendChild(updateServPackQty);
            var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
            cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteUpdateServPack(this)" />';
            var x = document.getElementById("updatePackageService");
              x.remove(x.selectedIndex);
        }

        function deleteUpdateServPack(row)
        {
            var i=row.parentNode.parentNode.rowIndex;
            var packageText = document.getElementById("updatePackageTable").rows[i].cells[0].firstChild.value;
            document.getElementById('updatePackageTable').deleteRow(i);
            
            alert(packageText);
            var y = document.getElementById("updatePackageService");
            var option = document.createElement("option");
            option.text = packageText;

            y.add(option);
        }

        function updatePackageProduct() {
            var table = document.getElementById("updatePackageTable");
            var promoType = $("#updatePackageProduct").val();
            var promoQty = $("#updatePackageProductQty").val();
            var removeBtn = document.createElement('button');
           
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var i = rowCount;
            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" value="'+promoType+'" id="updateProdPackType['+i+']" name="updateProdPackType['+i+']" disabled="disabled" style="color:black;"/>';
            var cell2 = row.insertCell(1);
            var updateProdPackQty = document.createElement("input");
            updateProdPackQty.type = "number";
            updateProdPackQty.name = "updateProdPackQty["+i+"]";
            updateProdPackQty.disabled = true;
            updateProdPackQty.style = "color: black";
            updateProdPackQty.value = promoQty;
            cell2.appendChild(updateProdPackQty);
            var cell3 = row.insertCell(2);
          // cell1.innerHTML = promoType;
          // cell2.innerHTML = promoQty;
            cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteUpdateProdPack(this)" />';
            var x = document.getElementById("updatePackageProduct");
              x.remove(x.selectedIndex);
        }

        function deleteUpdateProdPack(row)
        {
            var i=row.parentNode.parentNode.rowIndex;
            var packageText = document.getElementById("updatePackageTable").rows[i].cells[0].firstChild.value;
            document.getElementById('updatePackageTable').deleteRow(i);
            
            alert(packageText);
            var y = document.getElementById("updatePackageProduct");
            var option = document.createElement("option");
            option.text = packageText;

            y.add(option);
        }
      // add product/service in package END


      // add another option BEGIN
      // EMPLOYEE BEGIN
      $("#createAddPosition").click(function () {
            var opt = $("#addOptionName").val();
            $('#addOptionSelect')
                .append($("<option></option>")
                .attr("value", opt)
                .text(opt));

            $('#slct1')
                .append($("<option selected></option>")
                .attr("value", opt)
                .text(opt));
                alert("Successful!");
        });

      $("#updateAddPosition").click(function () {
            var opt2 = $("#updateAddOptionName").val();
            $('#updateAddOptionSelect')
                .append($("<option></option>")
                .attr("value", opt2)
                .text(opt2));

            $('.slct2')
                .append($("<option selected></option>")
                .attr("value", opt2)
                .text(opt2));
                alert("Successful!");
        });
      // EMPLOYEE END

      // PRODUCT AND SERVICE BEGIN
      $("#createAddCatBtn").click(function () {
            var opt = $("#createAddCategoryName").val();
            $('#createAddCategorySelect')
                .append($("<option></option>")
                .attr("value", opt)
                .text(opt));

            $('#createPSCategory')
                .append($("<option selected></option>")
                .attr("value", opt)
                .text(opt));
                alert("Successful!");
        });
      // product
      $("#updateAddProdCatBtn").click(function () {
            var opt = $("#updateAddCatProdName").val();
            $('#updateAddCatProdSelect')
                .append($("<option></option>")
                .attr("value", opt)
                .text(opt));

            $('.updateProdCategory')
                .append($("<option selected></option>")
                .attr("value", opt)
                .text(opt));
                alert("Successful!");
        });
      // service
      $("#updateAddServCatBtn").click(function () {
            var opt = $("#updateAddCatServName").val();
            $('#updateAddCatProdSelect')
                .append($("<option></option>")
                .attr("value", opt)
                .text(opt));

            $('.updateServCategory')
                .append($("<option selected></option>")
                .attr("value", opt)
                .text(opt));
                alert("Successful!");
        });
      // PRODUCT AND SERVICE END
      // add another option END


      // bday BEGIN
      $('.datepicker').pickadate({
        selectYears: 40,
        labelMonthNext: 'Next month',
        labelMonthPrev: 'Previous month',
        labelMonthSelect: 'Select a month',
        labelYearSelect: 'Select a year',
        monthsFull: [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ],
        monthsShort: [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],
        weekdaysFull: [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ],
        weekdaysShort: [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
        weekdaysLetter: [ 'S', 'M', 'T', 'W', 'T', 'F', 'S' ],
        today: 'Today',
        clear: 'Clear',
        close: 'Close',
        format: 'mmmm/d/yyyy',
        max: 'Today',
        yearRange: "1970:Today"
      });
      // bday END

      // promo BEGIN
      $('.datepicker-promo').pickadate({
        selectYears: 10,
        labelMonthNext: 'Next month',
        labelMonthPrev: 'Previous month',
        labelMonthSelect: 'Select a month',
        labelYearSelect: 'Select a year',
        monthsFull: [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ],
        monthsShort: [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],
        weekdaysFull: [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ],
        weekdaysShort: [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
        weekdaysLetter: [ 'S', 'M', 'T', 'W', 'T', 'F', 'S' ],
        today: 'Today',
        clear: 'Clear',
        close: 'Close',
        format: 'mmmm/d/yyyy',
        min: 'Today',
        yearRange: "Today:2020"
      });
      // promo END

      $(document).ready(function(){

            $('#createBirthday').change(function(){

            var today = new Date();
            var dd = Number(today.getDate());
            var mm = Number(today.getMonth()+1);

            var yyyy = Number(today.getFullYear()); 

            var myBD = $('#createBirthday').val();
            var myBDM = Number(myBD.split("/")[0])
            var myBDD = Number(myBD.split("/")[1])
            var myBDY = Number(myBD.split("/")[2])
            var age = yyyy - myBDY;

                    if(mm < myBDM)
                    {
                    age = age - 1;      
                    }
                    else if(mm == myBDM && dd < myBDD)
                    {
                    age = age - 1;
                    }

                    $('#createAge').val(age);
                });

      });


      $(document).ready(function(){

            $('#updateBirthday').change(function(){

            var today = new Date();
            var dd = Number(today.getDate());
            var mm = Number(today.getMonth()+1);

            var yyyy = Number(today.getFullYear()); 

            var myBD = $('#updateBirthday').val();
            var myBDM = Number(myBD.split("/")[0])
            var myBDD = Number(myBD.split("/")[1])
            var myBDY = Number(myBD.split("/")[2])
            var age = yyyy - myBDY;

                    if(mm < myBDM)
                    {
                    age = age - 1;      
                    }
                    else if(mm == myBDM && dd < myBDD)
                    {
                    age = age - 1;
                    }

                    $('#updateAge').val(age);
                });

      });