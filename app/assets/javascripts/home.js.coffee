# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.fire_and_forget = (endpoint) ->
  $.ajax({
    url: '/insert_event',
    data: {
    },
    dataType : 'json'
  })
