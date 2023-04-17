/**
 * 가게 찜 기능
 */


	$(document).ready(function() {
  $('body').on('click', '.product-thumb-link', function(e) {
    e.preventDefault();
    var storeId = $(this).siblings('input[type=hidden]').val();
    var heartIcon = $(this).find('i');
    var isDib = heartIcon.hasClass('dib'); // 하트가 채워져 있는지 확인합니다.
    $.ajax({
      type: 'POST',
      url: '/wishlist',
      data: {
        storeId: storeId,
        isDib: isDib
      },
      success: function(response) {
        if (isDib) {
          heartIcon.removeClass('dib');
        } else {
          heartIcon.addClass('dib');
        }
      },
      error: function(error) {
        console.log(error);
      }
    });
  });
});
 