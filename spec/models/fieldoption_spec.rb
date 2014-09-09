require 'rails_helper'

describe Fieldoption do

	it "should have a name" do
		build(:fieldoption, name: nil).should_not be_valid
	end

	it "should have an itemfield" do
		build(:fieldoption, itemfield: nil).should_not be_valid
	end

	it "should be associated with a valid itemfield" do
		build(:fieldoption, itemfield_id: 2).should_not be_valid
	end

	it "should have a unique name within an itemfield" do
		test_itemfield = build(:itemfield)
		test_fieldoption = create(:fieldoption, name: 'test_fieldoption', itemfield: test_itemfield)
		build(:fieldoption, name: 'test_fieldoption', itemfield: test_itemfield).should_not be_valid
	end

	it "should allow multiple instances f the same name across itemfields" do
		test_itemfield_1 = create(:itemfield)
		test_itemfield_2 = build(:itemfield, :alternate_itemfield)
		test_fieldoption = create(:fieldoption, name: 'test_fieldoption', itemfield: test_itemfield_1)
		build(:fieldoption, name: 'test_fieldoption', itemfield: test_itemfield_2).should be_valid
	end

end
