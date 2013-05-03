$('#tagAdd').click ->
  if $('#word_tag').val().length == 0
    $('#word_tag').focus()
  else
    $('#tag_form').submit()
