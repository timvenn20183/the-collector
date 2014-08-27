require 'rails_helper'

describe Virtualcollection do
    it "should have a valid name" do
        build(:virtualcollection, name: nil).should_not be_valid
    end
    it "should have a site" do
        build(:virtualcollection, site: nil).should_not be_valid
    end
    it "should have a valid site" do
        build(:virtualcollection, site_id: 2).should_not be_valid
    end

    it "should have a unqiue name within a site" do
    	test_site = build(:site)
    	test_virtualcollection = create(:virtualcollection, name: 'test_virtualcollection', site: test_site)
    	build(:virtualcollection, name: 'test_virtualcollection', site: test_site).should_not be_valid
    end

    it "should allow multiple instances of the name over multiple site" do
    	test_site_1 = build(:site)
    	test_site_2 = build(:site, :alternate_site)
    	test_virtualcollection = create(:virtualcollection, name: 'test_virtualcollection', site: test_site_1)
    	build(:virtualcollection, name: 'test_virtualcollection', site: test_site_2).should be_valid
	end

    it "can be associated to multiple items" do
        site = build(:site)
        virtualcollection = create(:virtualcollection, site: site)
        item = create(:item)
        item_2 = create(:item, :alternate_item)
        virtualcollection.items << item << item_2
        virtualcollection.items.count.should == 2
    end

end
