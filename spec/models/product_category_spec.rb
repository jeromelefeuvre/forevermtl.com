require 'rails_helper'

RSpec.describe ProductCategory, :type => :model do

  context "name" do
    let(:product_category) { product_category = ProductCategory.create(title: 'foo with é accent and space') }

    it "should be same as title" do
      expect(product_category.name).to eql('foo_with_e_accent_and_space')
    end
  end
end
