require 'rails_helper'

describe Itemfield do 
	
	it "should have a valid name" do
		build(:itemfield, name: nil).should_not be_valid
	end

	it "should have a valid site associated" do	
		build(:itemfield, site_id: nil).should_not be_valid
	end

	it "should have a unique name within a given site" do
		test_site = build(:site)
		itemfield_test = create(:itemfield, name: 'test_field', site: test_site)
		build(:itemfield, name: 'test_field', site: test_site).should_not be_valid
	end

	it "should allow unique names over multiple sites" do
		test_site_1 = build(:site)
		test_site_2 = build(:site, :alternate_site)
		itemfield_test = create(:itemfield, name: 'test_field', site: test_site_1)
		create(:itemfield, name: 'test_field', site: test_site_2).should be_valid
	end

end
