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

    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal({
              dismissible: false, // Modal can be dismissed by clicking outside of the modal
              opacity: .9, // Opacity of modal background
              in_duration: 400, // Transition in duration
              out_duration: 400, // Transition out duration
            }
          );
      });


  $('.modal-view').leanModal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .5, // Opacity of modal background
        in_duration: 300, // Transition in duration
        out_duration: 200, // Transition out duration
      }
    );



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