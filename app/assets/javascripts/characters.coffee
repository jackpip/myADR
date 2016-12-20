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

  $(".p-notes-button").click ->
    $(".p-notes").toggle()

  $(document).keypress (e) ->
    tag = e.target.tagName.toLowerCase()
    if (e.key == '=' && tag != 'input' && tag != 'textarea')
      $('#cue-creation').collapse('show')
      $('#cue_character').focus()

)
