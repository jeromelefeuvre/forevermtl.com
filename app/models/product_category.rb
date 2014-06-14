class ProductCategory < ActiveRecord::Base
  has_many :products

  # validates :title_en, :presence => true, :uniqueness => true
  # validates :title_fr, :presence => true, :uniqueness => true

  translates :title, :description

  before_create :set_name

  # scope :first_category, joins(:products).first

  def count
    products.count
  end

  private
  def set_name
    self.name = title.parameterize.underscore
  end
end
