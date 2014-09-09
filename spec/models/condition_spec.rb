require 'rails_helper'

describe Condition do
    it "should have a valid name" do
        build(:condition, name: nil).should_not be_valid
    end

    it "should have a unqiue name" do
    	test_category = create(:condition, name: 'test_condition')
    	build(:condition, name: 'test_condition').should_not be_valid
    end

    it "can be associated to multiple items" do
        condition = create(:condition)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        condition.items << item << item_2
        condition.items.count.should == 2
    end

end
