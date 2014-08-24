require 'rails_helper'

describe Site do
    it "should have a title" do
        build(:site, title: nil).should_not be_valid
    end
    it "should have an email address" do
        build(:site, email: nil).should_not be_valid
    end
    it "should have a password" do
        build(:site, password: nil).should_not be_valid
    end
    it "should have a site code" do
        build(:site, code: nil).should_not be_valid
    end
    it "should have a unique site code" do  
        first_site = create(:site, code: '12345')
        second_site = build(:site, code: '12345').should_not be_valid
    end
    it "should have a unique email address" do 
        first_site = create(:site, email: 'test@test.com', code: '1')
        second_site = build(:site, email: 'test@test.com', code: '2').should_not be_valid
    end
end
