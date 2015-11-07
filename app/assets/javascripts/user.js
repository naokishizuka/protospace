$(window).load(function(){
  $("#user_avatar").change(function(){
    if(!this.files.length){
      return;
    }
    var file = $(this).prop('files')[0];
    var fr = new FileReader();
    fr.onload = function(){
      $(".user-image").css('background-image', "url(" + fr.result + ")");
    }
    fr.readAsDataURL(file);
  });
});

