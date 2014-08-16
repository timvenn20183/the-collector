require 'rails_helper'

describe Rolodex do
	it "should have a name" do
		build(:rolodex, name: nil).should_not be_valid
	end
    it "should have a valid site" do
        build(:rolodex, :site => nil).should_not be_valid
    end
end
