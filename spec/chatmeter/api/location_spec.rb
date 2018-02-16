require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Locations endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #get_all_locations" do
      locations = chatmeter.get_all_locations
      expect(locations.length).to eq 1
    end

    it "should return valid response for #get_locations_by_reseller_location_id" do
      locations = chatmeter.get_locations_by_reseller_location_id('tore')

      expect(locations.length).to eq 1
      expect(locations.first[:id]).to eq "217846"
      expect(locations.first[:resellerLocationId]).to eq "tore"
      expect(locations.first[:accountId]).to eq "56a184a6d4c61f5267b3f386"
      expect(locations.first[:busName]).to eq "Apple Store"
      expect(locations.first[:primaryKeyword]).to eq "Electronics Store"
      expect(locations.first[:website]).to eq "https://www.apple.com/uk/retail/coventgarden/"
      expect(locations.first[:alternateWebsites]).to eq []
      expect(locations.first[:email]).to eq "fraser@chatmeter.com"
      expect(locations.first[:alternateEmails]).to eq []
      expect(locations.first[:address].to_s).to eq "{:street=>\"1-7 The Piazza, Covent Garden\", :city=>\"London\", :state=>\"GB\", :country=>\"GB\", :postalCode=>\"WC2E 8HA\"}"
      expect(locations.first[:primaryPhone]).to eq "02074471400"
      expect(locations.first[:alternatePhoneNumbers]).to eq []
      expect(locations.first[:auditOnly]).to eq false
      expect(locations.first[:brandMonitoring].to_s).to eq "{:listingMonitoring=>[], :socialMonitoring=>[]}"
      expect(locations.first[:rankingKeywords].to_s).to eq '[{:keyword=>"iphone"}]'
      expect(locations.first[:customListings]).to eq []
    end

    it "should return valid response for #add_new_location" do
      locations = chatmeter.add_new_location({})

      expect(locations[:id]).to eq "392939"
      expect(locations[:accountId]).to eq "21"
      expect(locations[:resellerLocationId]).to eq "coffee-shop-10"
      expect(locations[:busName]).to eq "Coffee Shop 2"
      expect(locations[:primaryKeyword]).to eq "Coffee"
      expect(locations[:website]).to eq "http://www.mycoffeeshop.com"
      expect(locations[:alternateWebsites]).to eq [{:website=>"http://shop2.mycoffeeshop.com"}]
      expect(locations[:email]).to eq "contact@mycoffeeshop.com"
      expect(locations[:alternateEmails]).to eq [{:email=>"sales@mycoffeeshop.com"}]
      expect(locations[:address].to_s).to eq "{:street=>\"234 Main Street\", :city=>\"San Diego\", :postalCode=>\"92101\", :state=>\"CA\", :country=>\"USA\"}"
      expect(locations[:primaryPhone]).to eq "5555551234"
      expect(locations[:alternatePhoneNumbers]).to eq [{:phoneNumber=>"5555552341"}]
      expect(locations[:rankingKeywords]).to eq [{:keyword=>"Coffee", :localArea=>"San Diego, CA"}]
      expect(locations[:auditOnly]).to eq false
      expect(locations[:listingManagementSpecs].to_s).to eq "{:hours=>{:Monday=>{:blocks=>[], :status=>\"Closed\"}, :Tuesday=>{:blocks=>[{:from=>\"0000\", :to=>\"2400\"}], :status=>\"Open\"}, :Wednesday=>{:blocks=>[{:from=>\"0030\", :to=>\"1900\"}], :status=>\"Open\"}, :Thursday=>{:blocks=>[{:from=>\"1230\", :to=>\"2000\"}], :status=>\"Open\"}, :Friday=>{:blocks=>[{:from=>\"0330\", :to=>\"0830\"}, {:from=>\"1400\", :to=>\"2100\"}], :status=>\"Open\"}, :Saturday=>{:blocks=>[], :status=>\"Closed\"}, :Sunday=>{:blocks=>[], :status=>\"Closed\"}}, :providerImages=>{:FACEBOOK=>\"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/e3b2883e8dfb198714fe1374f2ac55ab11f6e33dbf3f8bbd65275cda1fac7a86.jpg\", :GOOGLEMAP=>\"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/752a09b1af72547b47f013334609c2884e56a4f4af56bc5b96bccba1d228116c.jpg\", :TWITTER=>\"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/aeae7dbcea88a3e747e24b61e4688a8b3942bc3beb220c4feb181217fda075a4.jpg\"}, :hideAddress=>false, :description=>\"This business is pretty great, I mean, truly fantastic. You would really love this business if you came to check it out, it would really make your day awesome. Highly recommend coming to this business.\", :paymentTypes=>\"American Express,Cash,Check,Discover,MasterCard,Visa\", :businessOwner=>\"Rick\", :businessEmail=>\"rick@business.com\", :faxNumber=>\"555-555-5555\", :product=>\"Businesses and other things\", :brands=>\"Oakley, Nintendo, Dole\", :yearsInBusiness=>8, :licenseNumber=>\"1234556\", :linkedIn=>\"https://www.linkedin.com/company/bubba-bbq\", :logoUrl=>\"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/ee68cbc4c4374b7f2ae29e595250a5a0ff4cfbb80b64d00b9b285ae8b4d6c21c.png\", :imageUrls=>[\"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/9305c42f390dbbc2e7cab50b8d9f6063cc4f37cebe49919f8eee269c53add3df.jpg\", \"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/ee68cbc4c4374b7f2ae29e595250a5a0ff4cfbb80b64d00b9b285ae8b4d6c21c.png\"]}"
    end

  end
end
