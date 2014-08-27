require 'rails_helper'

describe Item do
    it "should have a name" do
        build(:item, name: nil).should_not be_valid
    end
    it "should have a site id" do
        build(:item, site_id: nil).should_not be_valid
    end
    it "should have a matching alphabet letter" do
        site = create(:site)
        create(:item, site: site).alphabet_letter.should eq(create(:item, site: site).name[0].upcase)
    end
    it "should link to a site" do
        site = create(:site)
        item = create(:item, site: site)
        item.site = site
        item.save.should eq(true)
    end
    it "should belong to a site" do
	    build(:item, site: nil).should_not be_valid
    end
    it "can be associated to multiple categories" do
        site = build(:site)
        category = create(:category, site: site)
        category_2 = create(:category, :alternate_category, site: site)
        item = create(:item)
        item.categories << category << category_2
        item.categories.count.should == 2
    end

    it "can be assocaited to multiple conditions" do
        site = build(:site)
        condition = create(:condition, site: site)
        condition_2 = create(:condition, :alternate_condition, site: site)
        item = create(:item)
        item.conditions << condition << condition_2
        item.conditions.count.should == 2
    end

    it "can be assocaited to multiple virtual collections" do
        site = build(:site)
        virtualcollection = create(:virtualcollection, site: site)
        virtualcollection_2 = create(:virtualcollection, :alternate_virtualcollection, site: site)
        item = create(:item)
        item.virtualcollections << virtualcollection << virtualcollection_2 
        item.virtualcollections.count.should == 2
    end

    it "can be assocaited to multiple rolodexes" do
        site = build(:site)
        rolodex = create(:rolodex, site: site)
        rolodex_2 = create(:rolodex, :alternate_rolodex, site: site)
        item = create(:item)
        item.rolodexes << rolodex << rolodex_2
        item.rolodexes.count.should == 2
    end

    it "must have an itemfield via the fieldoptions" do
        site = create(:site)
        item = create(:item, site: site)
        itemfield = create(:itemfield)
        fieldoption = create(:fieldoption, itemfield: itemfield)
        item.fieldoptions << fieldoption
        item.itemfields.first.should == fieldoption.itemfield
    end 
end
