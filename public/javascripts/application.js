$(document).ready(function() {
	$('a.email').each(function(i) {
		var text = $(this).text();
		var address = text.replace(" at ", "@");
		$(this).attr('href', 'mailto:' + address);
		$(this).text(address);
	});


});

$('a[data-remote=true]').livequery('click', function() {
  return request({ url : this.href });
});
 

$('form[data-remote=true]').livequery('submit', function() {
  return request({ url : this.action, type : this.method, data : $(this).serialize() });
});

$(function() {
  $(".alert").click(function() {
    alert(this.getAttribute("data-confirm"));
    return false;
  })
})

$(".error").click(function () {
	$(".error").fadeOut("slow");
});

$(".notice").click(function () {
	$(".notice").fadeOut("slow");
});