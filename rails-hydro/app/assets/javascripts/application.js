// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready = function() {
	var fixcheck = $(".nav-fix");

	$(document).scroll(function() {
		scroll_start = $(this).scrollTop();
		if (fixcheck.length === 0 && scroll_start !== 0) {
			$(".nav-custom").addClass("dark-fix");
		} else if (fixcheck.length == 0) {
			console.log("Called");
			$(".nav-custom").removeClass("dark-fix");
		} else {
			$(".nav-custom").addClass("dark-fix");
		}
	});
};

$(document).on('page:load', ready);
$(document).ready(ready);
$(document).on("page:restore", ready);
