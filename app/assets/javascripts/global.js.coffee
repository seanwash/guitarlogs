ready = ->

  # Auto remove flash messages after 5sec
  setTimeout ->
    $('#flash').slideUp()
  , 5000


$(document).ready ready
$(document).on 'page:load', ready
