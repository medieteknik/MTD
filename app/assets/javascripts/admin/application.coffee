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
#= require s3_direct_upload
#= require ../admin/main
#= require_tree ../admin

$(document).ready ->
  $('.ui.accordion').accordion()
  $('.ui.checkbox').checkbox()
  $('select.dropdown').dropdown()
  $('.ui.progress').progress()
  $('.menu .item').tab();

  $('.toggle-menu').click ->
    $('.menu.sidebar').sidebar('toggle')
