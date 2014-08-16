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
end
