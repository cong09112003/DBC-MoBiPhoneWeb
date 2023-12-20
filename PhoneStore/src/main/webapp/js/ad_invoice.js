$(document).ready(function() {

  // Event listener when signing details is hidden
  $('.signing-details-collapse').on('hide.bs.collapse', function () {
    toggleIcon(this);
  })

  // Event listener when signing details is shown
  $('.signing-details-collapse').on('show.bs.collapse', function () {

    // Hides all others signing details except the one that was shown
    $('.signing-details-collapse').collapse('hide').not(this);

    toggleIcon(this);
  })

  // Toggles icon class for element that was collapsed
  function toggleIcon(element) {
    var id = $(element).attr('id');
    $('[data-target="#'+ id + '"]').find('.glyphicon').toggleClass('glyphicon-menu-down glyphicon-menu-up');
  }
  
})