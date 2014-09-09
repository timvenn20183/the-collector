require 'rails_helper'

describe Itemfield do

	it "should have a valid name" do
		build(:itemfield, name: nil).should_not be_valid
	end

	it "should require a unique name" do
		itemfield_test = create(:itemfield, name: 'test_field')
		build(:itemfield, name: 'test_field').should_not be_valid
	end

end
