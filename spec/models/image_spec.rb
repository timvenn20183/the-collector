require 'rails_helper'

describe Image do

	it "should have a name" do
		build(:image, name: nil).should_not be_valid
	end

end
