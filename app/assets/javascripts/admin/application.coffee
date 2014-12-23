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
#= require turbolinks

$(document).ready ->
  $('.ui.accordion').accordion()
  $('.ui.checkbox').checkbox()
