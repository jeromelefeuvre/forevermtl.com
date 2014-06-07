class Product < ActiveRecord::Base
  validates :title, :presence   => true,
                    :uniqueness => true

  validates :price, :numericality => true,
                    :presence     => true,
end
