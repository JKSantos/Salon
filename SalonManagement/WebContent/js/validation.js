$().ready(function(){
  $("#createOption").validate({

    submitHandler: function() {
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
            $('#addOption').closeModal();
            $(form).ajaxSubmit();
    },
    errorPlacement: function(error, element) {
      // Append error within linked label
      $( element )
        .closest( "form" )
          .find( "label[for='" + element.attr( "id" ) + "']" )
            .append( error );
    },
    errorElement: "span",
    rules: {
      addOptionName: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      addOptionName: {
        required: " (Required)",
        minlength: " (Must be at least 5 characters)"
      }
    }
    
  });

});

$().ready(function(){
  $("#updateOptionForm").validate({

    submitHandler: function() {
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
            $('#updateOption').closeModal();
            $(form).ajaxSubmit();
    },
    errorPlacement: function(error, element) {
      // Append error within linked label
      $( element )
        .closest( "form" )
          .find( "label[for='" + element.attr( "id" ) + "']" )
            .append( error );
    },
    errorElement: "span",
    rules: {
      updateAddOptionName: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      updateAddOptionName: {
        required: " (Required)",
        minlength: " (Must be at least 5 characters)"
      }
    }
    
  });

});


$().ready(function(){
  $("#createAddCat").validate({

    submitHandler: function() {
      var opt3 = $("#createAddCategoryName").val();

                  $('#createAddCategorySelect')
                      .append($("<option></option>")
                      .attr("value", opt3)
                      .text(opt3));

                  $('#createPSCategory')
                      .append($("<option selected></option>")
                      .attr("value", opt3)
                      .text(opt3));
                      alert("Successful!");
                      $('#addCategory').closeModal();
                      $(form).ajaxSubmit();

    },
    errorPlacement: function(error, element) {
      // Append error within linked label
      $( element )
        .closest( "form" )
          .find( "label[for='" + element.attr( "id" ) + "']" )
            .append( error );
    },
    errorElement: "span",
    rules: {
      createAddCategoryName: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      createAddCategoryName: {
        required: " (Required)",
        minlength: " (Must be at least 5 characters)"
      }
    }
    
  });

});







      $().ready(function() {
        // validate the form when it is submitted
        $("#createEmpForm").validate({

          submitHandler: function() {
            Materialize.toast('Successfully Created!', 5000, 'green');
            $(form).ajaxSubmit();
          },
          errorPlacement: function(error, element) {
            // Append error within linked label
            $( element )
              .closest( "form" )
                .find( "label[for='" + element.attr( "id" ) + "']" )
                  .append( error );
          },
          errorElement: "span",
          rules: {
            strEmpFirstName: {
              required: true,
              minlength: 2,
              maxlength: 20
            },
            strEmpMiddleName: {
              minlength: 2
            },
            strEmpLastName: {
              required: true,
              minlength: 2
            },
            strBirthdate: {
              required: true
            },
            strEmpGender: {
              required: true
            },
            strEmpContactNo: {
              number: true,
              minlength: 10
            },
            strEmpEmail: {
              required: true,
              email: true
            },
            strEmpAddress: {
              required: true,
              minlength: 10
            },
            selectedJob: {
              required: true
            }
          },
          messages: {
            strEmpFirstName: {
              required: " (Required)",
              minlength: " (Must be at least 2 characters)"
            },
            strEmpMiddleName: {
              minlength: " (Must be at least 2 characters)"
            },
            strEmpLastName: {
              required: " (Required)",
              minlength: " (Must be at least 2 characters)"
            },
            strBirthdate: {
              required: " (Required)"
            },
            strEmpGender: {
              required: " (Required)"
            },
            strEmpContactNo: {
              number: " (Numbers only)",
              minlength: " (Need 10 numbers)"
            },
            strEmpEmail: {
              required: " (Required)",
              email: " (Not Valid Email)"
            },
            strEmpAddress: {
              required: " (Required)",
              minlength: " (Must be at least 10 characters)"
            },
            selectedJob: {
              required: " (Required)"
            }
          }
          
        });

        // SERVICE AND PRODUCT

        $("#createProdSvcForm").validate({

          submitHandler: function() {
            Materialize.toast('Successfully Created!', 5000, 'green');
            $(form).ajaxSubmit();
          },
          errorPlacement: function(error, element) {
            // Append error within linked label
            $( element )
              .closest( "form" )
                .find( "label[for='" + element.attr( "id" ) + "']" )
                  .append( error );
          },
          errorElement: "span",
          rules: {
            strItemCate: {
              required: true
            },
            strItemName: {
              required: true,
              minlength: 5
            },
            strItemDetails: {
              minlength: 5
            },
            strItemCategory: {
              required: true
            },
            dblItemPrice: {
              required: true
            }
          },
          messages: {
            strItemCate: {
              required: " (Required)"
            },
            strItemName: {
              required: " (Required)",
              minlength: " (Must be at least 5 characters)"
            },
            strItemDetails: {
              minlength: " (Must be at least 5 characters)"
            },
            strItemCategory: {
              required: " (Required)"
            },
            dblItemPrice: {
              required: " (Required)"
            }
          }
          
        });


// -----------------------------
$("#updateProdForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Updated!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strItemName: {
      minlength: 5
    },
    strItemDetails: {
      minlength: 5
    }
  },
  messages: {
    strItemName: {
      minlength: " (Must be at least 5 characters)"
    },
    strItemDetails: {
      minlength: " (Must be at least 5 characters)"
    }
  }
  
});
// -------------------------------
$("#updateServForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Updated!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strItemName: {
      minlength: 5
    },
    strItemDetails: {
      minlength: 5
    }
  },
  messages: {
    strItemName: {
      minlength: " (Must be at least 5 characters)"
    },
    strItemDetails: {
      minlength: " (Must be at least 5 characters)"
    }
  }
  
});
// ======================
$("#createDiscountForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Updated!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strDiscountName: {
      required: true,
      minlength: 5
    },
    strDiscountDetails: {
      minlength: 5
    },
    strDiscountType: {
      required: true
    },
    dblDiscountPrice: {
      required: true
    }
  },
  messages: {
    strDiscountName: {
      required: " (Required)",
      minlength: " (Must be at least 5 characters)"
    },
    strDiscountDetails: {
      minlength: " (Must be at least 5 characters)"
    },
    strDiscountType: {
      required: " (Required)"
    },
    dblDiscountPrice: {
      required: " (Required)"
    }
  }
  
});
// =====================
$("#updateDiscountForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Updated!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strDiscountName: {
      minlength: 5
    },
    strDiscountDetails: {
      minlength: 5
    }
  },
  messages: {
    strDiscountName: {
      minlength: " (Must be at least 5 characters)"
    },
    strDiscountDetails: {
      minlength: " (Must be at least 5 characters)"
    }
  }
  
});
// ||||||||||||||||||||||
$("#createCatalogueForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Created!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strCatalogueCategoryID: {
      required: true
    },
    strCatalogueName: {
      required: true,
      minlength: 5
    }
  },
  messages: {
    strCatalogueCategoryID: {
      required: " (Required)"
    },
    strCatalogueName: {
      required: " (Required)",
      minlength: " (Must be at least 5 characters)"
    }
  }
  
});

$("#updateCataForm").validate({

  submitHandler: function() {
    Materialize.toast('Successfully Updated!', 5000, 'green');
    $(form).ajaxSubmit();
  },
  errorPlacement: function(error, element) {
    // Append error within linked label
    $( element )
      .closest( "form" )
        .find( "label[for='" + element.attr( "id" ) + "']" )
          .append( error );
  },
  errorElement: "span",
  rules: {
    strCatalogueName: {
      minlength: 5
    }
  },
  messages: {
    strCatalogueName: {
      minlength: " (Must be at least 5 characters)"
    }
  }
  
});
// |||||||||||||||||||||

        jQuery.validator.addMethod("specialname", function(value, element) {
             return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
          },"<span class='red-text'> (A-Z ` - ' are allowed)</span>");

        jQuery.validator.addMethod("specialprodsvc", function(value, element) {
             return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
          },"<span class='red-text'> (A-Z - are allowed)</span>");

        jQuery.validator.addMethod("specialaddress", function(value, element) {
             return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
          },"<span class='red-text'> (A-Z 0-9 . , - # are allowed)</span>");

        jQuery.validator.addMethod("specialprice", function(value, element) {
             return this.optional(element) || /([0-9])$/.test(value);
          },"<span class='red-text'> (Numbers only)</span>");

        jQuery.validator.addMethod("specialoption", function(value, element) {
             return this.optional(element) || /([a-zA-Z\s])$/.test(value);
          },"<span class='red-text'> (Letters and spaces are allowed)</span>");
      });
