require 'rails_helper'

describe Blog do

	it "should have a title" do
		build(:blog, title: nil).should_not be_valid
	end

end
