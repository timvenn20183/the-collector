require 'rails_helper'

describe Dialog do 

	it "should have a code" do
		build(:dialog, code: nil).should_not be_valid
	end

	it "should be associated with a site" do
		build(:dialog, site: nil).should_not be_valid
	end

	it "should be associated with a valid site" do
		build(:dialog, site_id: 2).should_not be_valid
	end

	it "should have a unique code within a given site" do
		site = create(:site)
		dialog = create(:dialog, site: site, code: "ABOUT")
		build(:dialog, site: site, code: "ABOUT").should_not be_valid
	end

	it "should have a unique code only within a given site" do
		site = create(:site)
		site_2 = create(:site, :alternate_site)
		dialog = create(:dialog, site: site, code: "ABOUT")
		build(:dialog, site: site, code: "ABOUT", site: site_2).should be_valid
	end

	it "should have a the default content on creation if content is undefined" do
		dialog = create(:dialog, content: nil, site: build(:site))
		dialog.content.should eq(I18n.t('dialog.defaults.content'))
	end

end
