class Product < ActiveRecord::Base
  belongs_to :product_category

  validates :code, :presence => true, :uniqueness => true

  validates :price, :numericality => true,
                    :presence     => true

  mount_uploader :image, ProductImageUploader
  has_paper_trail

  translates :title, :description

  default_scope -> { order(:id)}
  scope :active, -> { where(active: true) }
  scope :star  , -> { where(star: true) }

  ransacker :title do |parent|
    Arel::Nodes::InfixOperation.new('->', parent.table[:title_translations], 'fr')
  end

end
