$(document).ready(function() {
  $('.recipe-form').on('cocoon:before-remove', function(event, insertedItem) {
    var confirmation = confirm("Are you sure?");
    if ( confirmation === false ) {
      // This is not working in the current version of cocoon
      event.preventDefault();
    }
  });
});
