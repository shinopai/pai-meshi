$(document).on('turbolinks:load', function () {
  // header menu
  $('.menu-button').on('click', function () {
    $('.menu').toggleClass('hidden');
  });

  // header menu sp
  $('.menu-button-sp').on('click', function () {
    $('.menu-sp').toggleClass('hidden');
  });

  // google login
  $('.google-login-button').on('click', function () {
    $('.google-login').toggleClass('hidden');
  });

  // parking range
  $('#parking').change(function () {
    $('#parking-value').text($(this).val());
  })

  // price range
  $('#price').change(function () {
    $('#price-value').text($(this).val());
  })

  // score range
  $('#score').change(function () {
    $('#score-value').text($(this).val());
  })
});
