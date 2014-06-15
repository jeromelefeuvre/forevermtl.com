module ActiveAdmin::ViewsHelper #camelized file name
  def display_rating(is_star = false)
    is_star ? image_star : image_not_star
  end

  def image_star
    image_tag('rating/true.png', size: '15x15')
  end

  def image_not_star
    image_tag('rating/false.png', size: '15x15')
  end
end