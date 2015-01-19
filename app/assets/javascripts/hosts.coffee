# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.host-position').change ->
    $('.host-position').children().removeAttr('disabled')
    $('.host-position').each ->
      $('.host-position:not(#'+this.id+')').children('option[value="'+this.value+'"]').attr('disabled', 'disabled')
