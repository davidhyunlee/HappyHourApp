// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require turbolinks
//= require_tree .

// $('.ui.modal').modal('attach events', '.test', 'show');

$('.long.test.modal')
  // .modal('attach events', '.test2', 'show')
  .modal('attach events', '.testie', {onApprove : function() {window.alert('Approved!');}})

  

;

$('select.dropdown')
  .dropdown()
;

$('.ui.checkbox')
  .checkbox()
;

$('.ui.radio.checkbox')
  .checkbox()
;

$('.dropdown')
  .dropdown({
    // you can use any ui transition
    transition: 'drop'
  })
;