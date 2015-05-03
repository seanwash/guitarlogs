ready = ->
  return unless $('body').is('.exercises') && $('.exercises').find('form')?

  $('select').selectize
    selectOnTab: true
    hideSelected: true
    create: true

$(document).on 'ready', ready
$(document).on 'page:load', ready
