
CommentsModule = (function() {

  var postClickHandler = function() {
    $('#comment-submit').submit( function(event) {
      console.log('comment submit')
    });
  };


  var init = function() {
    postClickHandler();
    console.log('im here')
  };

  return {
    init: init,
  };

})();

$(document).ready(function() {
  if($('#users-timeline').length){
    console.log('im here')
    CommentsModule.init();
  } 
});