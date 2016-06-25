// CREATE BEGIN
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
        minlength: " (Must be at least 2 letters)"
      },
      strEmpMiddleName: {
        minlength: " (Must be at least 2 letters)"
      },
      strEmpLastName: {
        required: " (Required)",
        minlength: " (Must be at least 2 letters)"
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
        minlength: " (Must be at least 10 letters)"
      },
      selectedJob: {
        required: " (Required)"
      }
    }
  });


jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");

});
// CREATE END
// CREATE ADD OPTION
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
        minlength: 5,
        lettersonly: true
      }
    },
    messages: {
      addOptionName: {
        required: " (Required)",
        minlength: " (Must be at least 5 letters)",
        lettersonly: " (Letters only)"
      }
    }
    
  });
jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and space only)</span>");
});
// CREATE ADD OPTION END

// UPDATE EMPLOYEE BEGIN
  $(".updateEmpForm").each(function (){
  $(this).validate({

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
        minlength: " (Must be at least 2 letters)"
      },
      strEmpMiddleName: {
        minlength: " (Must be at least 2 letters)"
      },
      strEmpLastName: {
        required: " (Required)",
        minlength: " (Must be at least 2 letters)"
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
        minlength: " (Must be at least 10 letters)"
      },
      selectedJob: {
        required: " (Required)"
      }
    }
    
  });
jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");

jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");
});

// UPDATE EMPLOYEE END
// ADD OPTION UPDATE EMPLOYEE
  $("#updateOptionForm").each(function (){
  $(this).validate({

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
        minlength: " (Must be at least 5 letters)"
      }
    }
    
  });
jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// ADD OPTION UPDATE EMPLOYEE END

// CREATE PROD SVC
$().ready(function() {
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
        minlength: " (Must be at least 5 letters)"
      },
      strItemDetails: {
        minlength: " (Must be at least 5 letters)"
      },
      strItemCategory: {
        required: " (Required)"
      },
      dblItemPrice: {
        required: " (Required)"
      }
    }
    
  });
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// CREATE PROD SVC END

// CREATE PROD SVC ADD CATEGORY
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
        minlength: 5,
        lettersonly: true
      }
    },
    messages: {
      createAddCategoryName: {
        required: " (Required)",
        minlength: " (Must be at least 5 letters)",
        lettersonly: " (Letters and space only)"
      }
    }
    
  });
jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// CREATE PROD SVC ADD CATEGORY END

// UPDATE PROD FORM
$(".updateProdForm").each(function() {
  $(this).validate({

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
        minlength: " (Must be at least 5 letters)"
      },
      strItemDetails: {
        minlength: " (Must be at least 5 letters)"
      },
      strItemCategory: {
        required: " (Required)"
      },
      dblItemPrice: {
        required: " (Required)"
      }
    }
    
  });
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE PROD FORM


// UPDATE SERVICE FORM
$(".updateServForm").each(function() {
  $(this).validate({

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
        minlength: " (Must be at least 5 letters)"
      },
      strItemDetails: {
        minlength: " (Must be at least 5 letters)"
      },
      strItemCategory: {
        required: " (Required)"
      },
      dblItemPrice: {
        required: " (Required)"
      }
    }
    
  });
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE SERVICE FORM END

// CREATE DISCOUNT
$().ready(function() {
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
    }
  },
  messages: {
    strDiscountName: {
      required: " (Required)",
      minlength: " (Must be at least 5 letters)"
    },
    strDiscountDetails: {
      minlength: " (Must be at least 5 letters)"
    },
    strDiscountType: {
      required: " (Required)"
    },
    dblDiscountPrice: {
      required: " (Required)"
    }
  }
  
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// CREATE DISCOUNT END

// UPDATE DISCOUNT
$(".updateDiscountForm").each(function() {
$(this).validate({

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
    }
  },
  messages: {
    strDiscountName: {
      required: " (Required)",
      minlength: " (Must be at least 5 letters)"
    },
    strDiscountDetails: {
      minlength: " (Must be at least 5 letters)"
    },
    strDiscountType: {
      required: " (Required)"
    },
    dblDiscountPrice: {
      required: " (Required)"
    }
  }
  
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE DISCOUNT END


// UPDATE PRODUCT ADD CATEGORY
  $(".prodAddCatForm").each(function (){
  $(this).validate({

    submitHandler: function() {
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
            $('#addUpdateProdCategory').closeModal();
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
      updateAddCatProdName: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      updateAddCatProdName: {
        required: " (Required)",
        minlength: " (Must be at least 5 letters)"
      }
    }
    
  });
jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE PRODUCT ADD CATEGORY END

// UPDATE SERVICE ADD CATEGORY
  $(".updateAddCatServ").each(function (){
  $(this).validate({

    submitHandler: function() {
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
            $('#addUpdateProdCategory').closeModal();
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
      updateAddCatServName: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      updateAddCatServName: {
        required: " (Required)",
        minlength: " (Must be at least 5 letters)"
      }
    }
    
  });
jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE SERVICE ADD CATEGORY END


// CREATE CATALOGUE
$().ready(function() {
$("#createCatalogueForm").validate({

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
    strCatalogueCategoryID: {
      required: true
    },
    strCatalogueName: {
      required: true
    }
  },
  messages: {
    strCatalogueCategoryID: {
      required: " (Required)"
    },
    strCatalogueName: {
      required: " (Required)"
    }
  }
  
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// CREATE CATALOGUE END

// UPDATE CATALOGUE
$('.updateCataForm').each(function() {
$(this).validate({

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
    strCatalogueCategoryID: {
      required: true
    },
    strCatalogueName: {
      required: true
    }
  },
  messages: {
    strCatalogueCategoryID: {
      required: " (Required)"
    },
    strCatalogueName: {
      required: " (Required)"
    }
  }
  
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE CATALOGUE END

// CREATE OTHER CHARGE
$().ready(function() {
$("#createExtraForm").validate({

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
    strECName: {
      required: true,
      minlength: 5
    }
  },
  messages: {
    strECName: {
      required: " (Required)",
      minlength: " (Must be at least 5 letters)"
    }
  },
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});

// CREATE OTHER CHARGE END


// UPDATE OTHER CHARGE
$('.updateExtraForm').each(function() {
$(this).validate({

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
    strECName: {
      required: true,
      minlength: 5
    }
  },
  messages: {
    strECName: {
      required: " (Required)",
      minlength: " (Must be at least 5 letters)"
    }
  },
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
});
// UPDATE OTHER CHARGE END

// CREATE PACKAGE FORM
$().ready(function() {
$("#createPackageForm").validate({

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
    strPackageName: {
      required: true,
      minlength: 2
    },
    strPackageDesc: {
      minlength: 5
    },
    intPackageType: {
      required: true
    },
    dblPackagePrice: {
      required: true
    }
  },
  messages: {
    strPackageName: {
      required: " (Required)",
      minlength: " (Must be at least 2 letters)"
    },
    strPackageDesc: {
      minlength: " (Must be at least 5 letters)"
    },
    intPackageType: {
      required: " (Required)"
    },
    dblPackagePrice: {
      required: " (Required)"
    }
  }
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");

jQuery.validator.addClassRules("group-required", {
    require_from_group: [1,".group-required"]
}, " (Required)");

});
// CREATE PACKAGE FORM END

// CREATE PROMO
$().ready(function() {
$("#createPromoForm").validate({

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
    strPromoName: {
      required: true,
      minlength: 2
    },
    strPromoDesc: {
      minlength: 5
    },
    require_from_group: [1, ".fillone"]
  },
  messages: {
    strPromoName: {
      required: " (Required)",
      minlength: " (Must be at least 2 letters)"
    },
    strPromoDesc: {
      minlength: " (Must be at least 5 letters)"
    },
    require_from_group: " (Required)"
  }
});
jQuery.validator.addMethod("specialname", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z ` - ' are allowed)</span>");

jQuery.validator.addMethod("specialprodsvc", function(value, element) {
     return this.optional(element) || /([a-zA-Z-`'\s])$/.test(value);
  },"<span class='red-text'> (A-z - are allowed)</span>");

jQuery.validator.addMethod("specialaddress", function(value, element) {
     return this.optional(element) || /([#A-Za-z0-9\s.,-])$/.test(value);
  },"<span class='red-text'> (A-z 0-9 . , - # are allowed)</span>");

jQuery.validator.addMethod("specialprice", function(value, element) {
     return this.optional(element) || /([0-9])$/.test(value);
  },"<span class='red-text'> (Numbers only)</span>");

jQuery.validator.addMethod("specialoption", function(value, element) {
     return this.optional(element) || /([a-zA-Z\s])$/.test(value);
  },"<span class='red-text'> (Letters and spaces are allowed)</span>");

jQuery.validator.addMethod("noSpace", function(value, element) { 
    return value.indexOf(" ") != ""; 
  }, " (Empty field)");
jQuery.validator.addClassRules("fillone", {
    require_from_group: [1,".fillone"]
}, " (Required)");

jQuery.validator.addClassRules("filltwo", {
    require_from_group: [1,".filltwo"]
}, " (Required)");

jQuery.validator.addClassRules("fillthree", {
    require_from_group: [1,".fillthree"]
}, " (Required)");

});
// CREATE PROMO END