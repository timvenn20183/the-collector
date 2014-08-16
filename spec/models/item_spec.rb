require 'rails_helper'

describe Item do
    it "should have a name" do
        build(:item, name: nil).should_not be_valid
    end
    it "should have a site id" do
        build(:item, site_id: nil).should_not be_valid
    end
    it "should have a matching alphabet letter" do
        create(:item, :site => create(:site)).alphabet_letter.should eq(create(:item, :site => create(:site)).name[0].upcase)
    end
    it "should links to a site" do
        site = create(:site)
        item = create(:item, :site => create(:site))
        item.site = site
        item.save.should eq(true)
    end
    it "should have a valid site" do
	build(:item, :site => nil).should_not be_valid
    end
end
