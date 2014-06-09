class Product < ActiveRecord::Base
  belongs_to :product_category

  validates :title, :presence   => true,
                    :uniqueness => true

  validates :price, :numericality => true,
                    :presence     => true

  mount_uploader :image, ProductImageUploader
  has_paper_trail

  scope :active, -> { where(active: true) }
end
