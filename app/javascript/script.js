
  $(document).on('turbolinks:load', function() {
    $('.jquery').on('click', function(){
      $(".favorite-btn").html("<%= escape_javascript(render partial: 'favorites/favorite', locals: {book: @book}) %>");
    });
  });

