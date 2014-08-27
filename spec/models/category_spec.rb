require 'rails_helper'

describe Category do
    it "should have a name" do
        build(:category, name: nil).should_not be_valid
    end
    it "should have a site" do
        build(:category, site_id: nil).should_not be_valid
    end
    it "should have a valid site" do
        build(:category, site_id: 2).should_not be_valid
    end

    it "should have a unqiue name within a site" do
    	test_site = build(:site)
    	test_category = create(:category, name: 'test_category', site: test_site)
    	build(:category, name: 'test_category', site: test_site).should_not be_valid
    end

    it "should allow multiple instances of the name over multiple site" do
    	test_site_1 = build(:site)
    	test_site_2 = build(:site, :alternate_site)
    	test_category = create(:category, name: 'test_category', site: test_site_1)
    	build(:category, name: 'test_category', site: test_site_2).should be_valid
	end

    it "can be associated to multiple items" do
        site = build(:site)
        category = create(:category, site: site)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        category.items << item << item_2
        category.items.count.should == 2
    end

end
