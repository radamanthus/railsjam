$(document).ready(function() {
	$('a.email').each(function(i) {
		var text = $(this).text();
		var address = text.replace(" at ", "@");
		$(this).attr('href', 'mailto:' + address);
		$(this).text(address);
	});
	
  $(".error").click(function () {
  	$(".error").fadeOut("slow");
  });

  $(".notice").click(function () {
  	$(".notice").fadeOut("slow");
  });


  $(".success").click(function () {
  	$(".success").fadeOut("slow");
  });

});

