# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->  
  $("#keyboard_shortcuts").click ->
    ul = $(this).find("ul")
    if ul.is(":visible")
      ul.slideUp("slow")
    else
      ul.slideDown("slow")
    
  if ($("#quote").length)
    $(document).bind('keyup', 'left', ->
      window.history.go(-1)
    );
  
    $(document).bind('keyup', 'right', ->
      document.location = $("#shuffle").attr("href")
    );
  else if ($(".quote_list").length)
    $(document).bind('keyup', 'left', ->
      new_location = $(".pagination a.previous_page").attr("href")
      if new_location
        document.location = new_location
    );
  
    $(document).bind('keyup', 'right', ->
      new_location = $(".pagination a.next_page").attr("href")
      if new_location
        document.location = new_location
    );