FactoryGirl.define do

    factory :site do |s|
        title "oldcomputers"
        email "tim@nevyn.co.za"
        password "test"
        code "oc"
    end

    trait :alternate_site do |s|
        title "marklin"
        email "tim@test.com"
        password "test"
        code "mark"
    end

    factory :item do |t|
        name "Microsoft Adventure"
        site_id 1
        collection_id 1
        visability 0
        active true
        year 1981
        value 0.0
        cost 0.0
        reference_number "1.00"
    end

    trait :alternate_item do |t|
        name "Adventure in Serenia"
        site_id 1
        collection_id 1
        visability 0
        active true
        year 1981
        value 0.0
        cost 0.0
        reference_number "2.00"
    end

    factory :rolodex do |r|
    	name "Microsoft"
    	rolodex_type 0
    	email ""
    	cell ""
    	tel ""
    	history ""
    	address ""
    	site_id 1	
    end

    trait :alternate_rolodex do |r|
        name "Sierra"
        rolodex_type 0
        email ""
        cell ""
        tel ""
        history ""
        address ""
        site_id 1   
    end
    
    factory :condition do |c|
        name "Fair"
        site_id 1
    end

    trait :alternate_condition do |c|
        name "Poor"
        site_id 1
    end

    factory :virtualcollection do |v|
        name "DOS Games"
        site_id 1
    end

    trait :alternate_virtualcollection do |v|
        name "Console Games"
        site_id 1
    end

    factory :category do |c|
        name "Adventure"
        site_id 1
    end

    trait :alternate_category do |c|
        name "Text Game"
        site_id 1
    end

    factory :itemfield do |i|
        name "Media"
        site_id 1
    end

    trait :alternate_itemfield do |i|
        name "Format"
    end

    factory :fieldoption do |f|
        name "CD-ROM"
        itemfield_id 1
    end

    trait :alternate_fieldoption do |f|
        name "Floppy"
        itemfield_id 1
    end

    factory :dialog do |f|
        code "ABOUT"
        content "This is the about page"
        site_id 1
    end

end
