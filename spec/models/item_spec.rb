require 'rails_helper'

describe Item do
    it "should have a name" do
        build(:item, name: nil).should_not be_valid
    end
    it "should have a site id" do
        build(:item, site_id: nil).should_not be_valid
    end
    it "should have a matching alphabet letter" do
        create(:item).alphabet_letter.should eq(create(:item).name[0].upcase)
    end
    it "should links to a site" do
        item = create(:item)
        site = create(:site)
        item.site = site
        item.save.should eq(true)
    end
end
