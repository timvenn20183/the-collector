FactoryGirl.define do

    factory :site do |s|
        title "oldcomputers"
        email "tim@nevyn.co.za"
        password "test"
        code "oc"
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
    
    factory :condition do |c|
        name "Fair"
        site_id 1
    end

    factory :virtualcollection do |v|
        name "DOS Games"
        site_id 1
    end

end
