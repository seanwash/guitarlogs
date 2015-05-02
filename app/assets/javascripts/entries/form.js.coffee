ready = ->
	return unless $('body').is('.entries') && $('.entries').find('form')?

	$('select').selectize selectOnTab: true

$(document).on 'ready', ready
$(document).on 'page:load', ready
