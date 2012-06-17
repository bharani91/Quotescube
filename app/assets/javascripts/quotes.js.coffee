jQuery ($) ->
  $(document).bind("keyup", "h", ->
    document.location = $("#logo").attr("href")
  )
  
  $("#keyboard_shortcuts").live("click", ->
    ul = $(this).find("ul")
    if(ul.is(":visible"))
      ul.slideUp("slow")
    else
      ul.slideDown("slow")
  )
  
  if($(".index_page").length)
    $(document).bind("keyup", "space", ->
      $("#shuffle").trigger("click")
    )
    $(document).bind("keyup", "t", ->
      $("li.twitter a").trigger("click")
    )
    
  else if($(".show_page").length)
    $(document).bind("keyup", "left", ->
      new_location = $(".prev").attr("href")
      document.location = new_location
    )
    $(document).bind("keyup", "right", ->
      new_location = $(".next").attr("href")
      document.location = new_location
    )
    
  else if($(".quote_list").length)
    $(document).bind("keyup", "left", ->
      new_location = $(".previous_page").attr("href")
      if new_location
        document.location = new_location
    )
    $(document).bind("keyup", "right", ->
      new_location = $(".next_page").attr("href")
      if new_location
        document.location = new_location
    )
  