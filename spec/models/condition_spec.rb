require 'rails_helper'

describe Condition do
    it "should have a valid name" do
        build(:condition, name: nil).should_not be_valid
    end
    it "should have a site" do
        build(:condition, site: nil).should_not be_valid
    end
    it "should have a valid site" do
        build(:condition, site_id: 2).should_not be_valid
    end

    it "should have a unqiue name within a site" do
    	test_site = build(:site)
    	test_category = create(:condition, name: 'test_condition', site: test_site)
    	build(:condition, name: 'test_condition', site: test_site).should_not be_valid
    end

    it "should allow multiple instances of the name over multiple site" do
    	test_site_1 = build(:site)
    	test_site_2 = build(:site, :alternate_site)
    	test_category = create(:condition, name: 'test_condition', site: test_site_1)
    	build(:condition, name: 'test_condition', site: test_site_2).should be_valid
	end

    it "can be associated to multiple items" do
        site = build(:site)
        condition = create(:condition, site: site)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        condition.items << item << item_2
        condition.items.count.should == 2
    end
    
end
