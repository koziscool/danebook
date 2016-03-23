
CommentsModule = (function() {




  var commentCreateHandler = function() {
    $('.submit-comment').submit( function(event) {
      event.preventDefault();
      console.log('comment submit');
      // console.log(event);
      var postId = $(event.target).attr("data-post-id");
      var body = $(event.target).find('#body').val();

      var params = {
        commentable_id: postId,
        commentable_type: "Post",
        body: body,
      };

      $.ajax( {
        url: "/comments.js",
        method: "POST",
        dataType: "script",

        // success: function( data ) {
        //   console.log( data );
        // },

        error: function( xhr, status, error ) {
          console.log( error );
        },

        data: { comment: params },
      } )
    });
  };




  var init = function() {
      console.log('im here')
    commentCreateHandler();
  };

  return {
    init: init,
  };

})();

$(document).ready(function() {
  if($('#users-timeline').length){
    CommentsModule.init();
  } 
});