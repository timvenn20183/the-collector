FactoryGirl.define do

    factory :item do |t|
        name "Microsoft Adventure"
        collection_id 1
        visability 0
        active true
        year 1981
        value 0.0
        cost 0.0
        reference "1.00"
    end

    trait :alternate_item do |t|
        name "Adventure in Serenia"
        collection_id 1
        visability 0
        active true
        year 1981
        value 0.0
        cost 0.0
        reference "2.00"
    end

    factory :rolodex do |r|
    	name "Microsoft"
    	rolodex_type 0
    	email ""
    	cell ""
    	tel ""
    	history ""
    	address ""
    end

    trait :alternate_rolodex do |r|
        name "Sierra"
        rolodex_type 0
        email ""
        cell ""
        tel ""
        history ""
        address ""
    end

    factory :condition do |c|
        name "Fair"
    end

    trait :alternate_condition do |c|
        name "Poor"
    end

    factory :virtualcollection do |v|
        name "DOS Games"
    end

    trait :alternate_virtualcollection do |v|
        name "Console Games"
    end

    factory :category do |c|
        name "Adventure"
    end

    trait :alternate_category do |c|
        name "Text Game"
    end

    factory :itemfield do |i|
        name "Media"
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

    factory :blog do |b|
        title "A test blog"
        content "This is a test blog"
        draft true
        publish_start { Time.now }
        publish_end { Time.now + 1.days }
    end

    factory :image do |i|
        name "Test image of something"
        content "The details of the image are as follows ..."
    end

end
