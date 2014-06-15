class Product < ActiveRecord::Base
  belongs_to :product_category

  validates :code, :presence => true, :uniqueness => true

  validates :price, :numericality => true,
                    :presence     => true

  mount_uploader :image, ProductImageUploader
  has_paper_trail

  translates :title, :description

  scope :active, -> { where(active: true) }
  scope :star  , -> { where(star: true) }

end
