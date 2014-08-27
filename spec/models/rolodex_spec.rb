require 'rails_helper'

describe Rolodex do
	it "should have a name" do
		build(:rolodex, name: nil).should_not be_valid
	end
    it "should have a valid site" do
        build(:rolodex, :site => nil).should_not be_valid
    end

    it "should have a unique name within a given site" do
        test_site = build(:site)
    	rolodex_test = create(:rolodex, name: 'test_rolodex', site: test_site)
    	build(:rolodex, name: 'test_rolodex', site: test_site).should_not be_valid
	end

    it "should allow the same name over multiple sites" do
        test_site_1 = build(:site)
        test_site_2 = build(:site, :alternate_site)
        rolodex_test = create(:rolodex, name: 'test_rolodex', site: test_site_1)
        build(:rolodex, name: 'test_rolodex', site: test_site_2).should be_valid
    end

    it "can be associated to multiple items" do
        site = build(:site)
        rolodex = create(:rolodex, site: site)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        rolodex.items << item << item_2
        rolodex.items.count.should == 2
    end
    
end
