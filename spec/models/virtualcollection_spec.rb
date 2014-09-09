require 'rails_helper'

describe Virtualcollection do
    it "should have a valid name" do
        build(:virtualcollection, name: nil).should_not be_valid
    end

    it "should have a unqiue name" do
    	test_virtualcollection = create(:virtualcollection, name: 'test_virtualcollection')
    	build(:virtualcollection, name: 'test_virtualcollection').should_not be_valid
    end

    it "can be associated to multiple items" do
        virtualcollection = create(:virtualcollection)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        virtualcollection.items << item << item_2
        virtualcollection.items.count.should == 2
    end

end
