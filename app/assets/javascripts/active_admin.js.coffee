#= require active_admin/base
#= require ckeditor/override
#= require ckeditor/init

$ ->
  $('td.col-active').on "click", this, (e) ->
    image_object = this
    e.preventDefault()
    $.ajax(
        url: "/admin/products/"+ $(this).closest('tr').find('input').first().val() + "/active"
        beforeSend: (xhr) ->
          xhr.overrideMimeType "text/plain; charset=x-user-defined"
          return
      ).done (data) ->
        if data is 'true'
          text = '✔'
        else
          text = '✗'
        $(image_object).text(text)
        return

  $('td.col-star img').on "click", this, (e) ->
    image_object = this
    e.preventDefault()
    $.ajax(
        url: "/admin/products/"+ $(this).closest('tr').find('input').first().val() + "/star"
        beforeSend: (xhr) ->
          xhr.overrideMimeType "text/plain; charset=x-user-defined"
          return
      ).done (data) ->
        $(image_object).attr("src", "/images/rating/" + data + ".png")
        return

  $('.sidebar_section h3').on 'click', this, (e) ->
    $(this).parent().find('.panel_contents').toggle()