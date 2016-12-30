# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', ->
  $(".timestamp").attr('maxLength', '11')
  $(".timestamp").keyup ->
    length = this.value.length
    fixedLength = this.value.replace(/\:/g, "").length
    if fixedLength % 2 == 0 && length < 11 && fixedLength < 8 && fixedLength > 1 && this.value.search(/:$/) == -1 && this.value.search(/::/) == -1
      this.value += ":"
      #$(this).next('input').focus()

  $(".notes-button").click ->
    $(".notes").toggle()
    if $(this).prop("checked") == true
      $("#p-notes").show()
    else
      $("#p-notes").hide()

  $(".p-notes-button").click ->
    $(".p-notes").toggle()

  $(".omitted-cue-button").click ->
    $(".omitted-cue").toggle()

  $(".js-copytext").val(window.location)

  $(".js-copytextbtn").click (event) ->
    $(".js-copytext").select()
    try
      successful = document.execCommand('copy')
    catch err
      console.log('Oops, unable to copy')

  $(document).keypress (e) ->
    tag = e.target.tagName.toLowerCase()
    if (e.key == 'N' && e.shiftKey && tag != 'input' && tag != 'textarea')
      $('#cue-creation').collapse('show')
      $('#new_cue #cue_character').focus()
      $('html, body').stop().animate({
          scrollTop: $('#cue_collapse').offset().top
        }, 1000)

)
