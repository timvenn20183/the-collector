require 'rails_helper'

describe Condition do
    it "should have a valid name" do
        build(:condition, name: nil).should_not be_valid
    end
    it "should have a valid site" do
        build(:condition, site: nil).should_not be_valid
    end
end
