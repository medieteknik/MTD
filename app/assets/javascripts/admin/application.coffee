# assets/javascripts/admin/application.coffee
#
# Loads all Semantic javascripts
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require modernizr
#= require nprogress
#= require nprogress-turbolinks
#= require semantic-ui
#= require angular
#= require websocket_rails/main
#= require turbolinks
#= require ../admin/angular/main
#= require_tree ../admin

$(document).ready ->
  $('.ui.accordion').accordion()
  $('.ui.checkbox').checkbox()
  $('select.dropdown').dropdown()

  $('.toggle-menu').click ->
    $('.menu.sidebar').sidebar('toggle')
