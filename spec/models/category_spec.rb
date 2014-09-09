require 'rails_helper'

describe Category do
    it "should have a name" do
        build(:category, name: nil).should_not be_valid
    end

    it "should have a unqiue name within a site" do
    	test_category = create(:category, name: 'test_category')
    	build(:category, name: 'test_category').should_not be_valid
    end


    it "can be associated to multiple items" do
        category = create(:category)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        category.items << item << item_2
        category.items.count.should == 2
    end

end
