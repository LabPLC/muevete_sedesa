# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  progress = $('#barbar')
  max = progress.attr('max')
  time = (1000/max)*5
  value = progress.val()

  loading = -> 
    value += 1
    agregar_valor = progress.val(value)
    $('.progress-value').html(value + '%')
    if value == max 
      clearInterval(animate)

  animate = -> 
    setInterval ->
      loading
    , time
