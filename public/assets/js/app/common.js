$(function() {
	
	var $header = $('header');
	var $search = $('.clip-search');
	// Nav Fixed
	$(window).scroll(function() {
		if ($(window).scrollTop() > 350) {
			$header.addClass('fixed');
		} else {
			$header.removeClass('fixed');
		}
	});
	// Nav Toggle Button
	$('#nav-toggle').click(function(){
		$header.toggleClass('open');
	});
	// Nav Toggle Button
	$('#search-toggle').click(function(){
		$search.toggleClass('open');
	});
	
	$('.clipList li').matchHeight();
});