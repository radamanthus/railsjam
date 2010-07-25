$(document).ready(function() {
    $('a.email').each(function(i) {
        var text = $(this).text();
        var address = text.replace(" at ", "@");
        $(this).attr('href', 'mailto:' + address);
            $(this).text(address);
        });
});