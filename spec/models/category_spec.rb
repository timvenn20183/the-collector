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
end
