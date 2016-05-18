$ ->
  $("form#taskform").bind("ajax:success", (event, xhr, settings) ->
    $(this).parents('.reveal').foundation('close')
    console.log("success")
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    error_messages = if xhr.responseJSON['error']
      "<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
    else if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        "<div class='alert alert-danger pull-left'>" +  " " + v.title + "</div>"
      ).join ""
    else
      "<div class='alert alert-danger pull-left'>Unknown error</div>"

    $(".formerrors").html(error_messages)

  )

