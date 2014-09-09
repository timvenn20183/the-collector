require 'rails_helper'

describe Rolodex do
	it "should have a name" do
		build(:rolodex, name: nil).should_not be_valid
	end

    it "should have a unique name" do
    	rolodex_test = create(:rolodex, name: 'test_rolodex')
    	build(:rolodex, name: 'test_rolodex').should_not be_valid
	end

    it "can be associated to multiple items" do
        rolodex = create(:rolodex)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        rolodex.items << item << item_2
        rolodex.items.count.should == 2
    end

end
