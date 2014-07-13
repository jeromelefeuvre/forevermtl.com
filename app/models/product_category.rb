class ProductCategory < ActiveRecord::Base
  has_many :products

  # validates :title_en, :presence => true, :uniqueness => true
  # validates :title_fr, :presence => true, :uniqueness => true

  translates :title, :description

  before_create :set_name

  default_scope              -> { order("product_categories.title_translations->'fr'")}
  scope :first_category    , -> { joins(:products).first }
  scope :only_with_products, -> {
    joins(:products).
    select('product_categories.*, count(products.id) as products_count').
    order('product_categories.name').
    where(products: {active: true}).
    having('COUNT(products.id) > 0').
    group('product_categories.id')
  }

  def count
    products.count
  end

  private
  def set_name
    self.name = title.parameterize.underscore
  end
end
