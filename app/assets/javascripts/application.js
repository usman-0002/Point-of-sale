// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require toastr_rails

$(document).on('turbolinks:load', function() {
  sidebar_submenu_onclick();
  products_listing_onclick();
})

const sidebar_submenu_onclick = () => { 
  var dropdown = document.getElementsByClassName('sidebar-submenu');
  var i;

  for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function() {
      var dropdownContent = this.nextElementSibling;
      if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
      } else {
        dropdownContent.style.display = "block";
      }
    });
  }
};

const products_listing_onclick = () => {
  $('.product-body, #cros-expand').click(function(e) {
    if ($(this).hasClass('product-body')) {
      $( ".product-expand" ).each(function() {
        if (!$(this).hasClass('d-none')) {
          $(this).addClass('d-none');
          $(this).prev().removeClass('d-none');
        }
      });
      $(this).addClass('d-none');
      $(this).next().removeClass('d-none');
    }
    else {
      $(this).parent().addClass('d-none');
      $(this).parent().prev().removeClass('d-none');
    }
  });
}
