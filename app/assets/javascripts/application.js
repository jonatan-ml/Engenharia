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
//= require jquery_ujs
//= require bootstrap.growl

$(document).ready(function(){ /*chamada ajax, carrega a página com loading site.html&*/
	//Global ajax cursor change
	$(document)
		.ajaxStart(function (){ /*Verifica se o documento iniciou com ajax*/
			$('#global-spin').fadeIn('slow'); /*Coloca o spin rodando*/
		})
		.ajaxStop(function () { /*Quando carregar o conteúdo ele tira o spin*/
			$('#global-spin').fadeOut('slow');
		});
});
