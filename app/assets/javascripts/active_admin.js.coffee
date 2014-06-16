#= require active_admin/base
#= require ckeditor/override
#= require ckeditor/init

$ ->
  $('td.col-star img').on "click", this, (e) ->
    image_object = this
    e.preventDefault()
    $.ajax(
        url: "/admin/products/"+ $(this).closest('tr').find('input').first().val() + "/star"
        beforeSend: (xhr) ->
          xhr.overrideMimeType "text/plain; charset=x-user-defined"
          return
      ).done (data) ->
        $(image_object).attr("src", "/assets/rating/" + data + ".png")
        return

