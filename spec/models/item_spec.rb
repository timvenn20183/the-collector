require 'rails_helper'

describe Item do
    it "should have a name" do
        build(:item, name: nil).should_not be_valid
    end

    it "should have a matching alphabet letter" do
        create(:item).alphabet_letter.should eq(create(:item).name[0].upcase)
    end

    it "can be associated to multiple categories" do
        category = create(:category)
        category_2 = create(:category, :alternate_category)
        item = create(:item)
        item.categories << category << category_2
        item.categories.count.should == 2
    end

    it "can be assocaited to multiple conditions" do
        condition = create(:condition)
        condition_2 = create(:condition, :alternate_condition)
        item = create(:item)
        item.conditions << condition << condition_2
        item.conditions.count.should == 2
    end

    it "can be assocaited to multiple virtual collections" do
        virtualcollection = create(:virtualcollection)
        virtualcollection_2 = create(:virtualcollection, :alternate_virtualcollection)
        item = create(:item)
        item.virtualcollections << virtualcollection << virtualcollection_2
        item.virtualcollections.count.should == 2
    end

    it "can be assocaited to multiple rolodexes" do
        rolodex = create(:rolodex)
        rolodex_2 = create(:rolodex, :alternate_rolodex)
        item = create(:item)
        item.rolodexes << rolodex << rolodex_2
        item.rolodexes.count.should == 2
    end

    it "must have an itemfield via the fieldoptions" do
        item = create(:item)
        itemfield = create(:itemfield)
        fieldoption = create(:fieldoption, itemfield: itemfield)
        item.fieldoptions << fieldoption
        item.itemfields.first.should == fieldoption.itemfield
    end

end
