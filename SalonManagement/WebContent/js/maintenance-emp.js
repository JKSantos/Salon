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

  $('#addOptionSelect').click(function(){
      $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
  });



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


      // add product / service in table (PROMO)

      function addServPromo() {
          var table = document.getElementById("promoTable");
          var promoType = $("#promoService").val();
          var promoQty = $("#promoServiceQty").val();
          var removeBtn = document.createElement('button');
         
          var row = table.insertRow(0);
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2); 
          cell1.innerHTML = promoType;
          cell2.innerHTML = promoQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteServPromo(this)" />';
          var x = document.getElementById("promoService");
              x.remove(x.selectedIndex);
      }

      function deleteServPromo(row)
      {
          var i=row.parentNode.parentNode.rowIndex;
          var packageText = document.getElementById("promoTable").rows[i].cells[0].innerHTML;
          document.getElementById('promoTable').deleteRow(i);
          
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
         
          var row = table.insertRow(0);
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2); 
          cell1.innerHTML = promoProdType;
          cell2.innerHTML = promoProdQty;
          cell3.innerHTML = '<input id="removeBtn" type="button" value="Remove" class="waves-effect waves-light btn red" onclick="deleteProdPromo(this)" />';
          var x = document.getElementById("promoProduct");
              x.remove(x.selectedIndex);
      }

      function deleteProdPromo(row)
      {
          var i=row.parentNode.parentNode.rowIndex;
          var packageText = document.getElementById("promoTable").rows[i].cells[0].innerHTML;
          document.getElementById('promoTable').deleteRow(i);
          
          alert(packageText);
          var y = document.getElementById("promoProduct");
          var option = document.createElement("option");
          option.text = packageText;

          y.add(option);
      }


      // add another option BEGIN
      function addOption(){
        // var newOpt = document.getElementById('addOptionName').val();
        // var option = document.createElement("option");
        // option.text = newOpt;

        // var selectbox = document.getElementById('position');
        // selectbox.addOption(option);

      }
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