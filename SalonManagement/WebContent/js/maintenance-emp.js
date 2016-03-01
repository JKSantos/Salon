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
              opacity: .7, // Opacity of modal background
              in_duration: 300, // Transition in duration
              out_duration: 200, // Transition out duration
            }
          );
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