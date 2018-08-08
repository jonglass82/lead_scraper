require 'open-uri'
require 'nokogiri'
require 'csv'


class Scraper 
    
    attr_accessor :data, :name, :address
    
    def initialize 
        
        puts "Please enter a zip code to search ..."
        
        zip_code = gets.chomp
        
        puts "what type of studios would you like to search?"
        
        search_type = gets.chomp

        url = "https://www.yellowpages.com/search?search_terms=" + search_type + "+studio&geo_location_terms=" + zip_code.to_s 
         
        @data = Nokogiri::HTML(open(url))

    end
    
    
def names
    @name = data.css('.business-name').map{|n|n.text}
end
    

def addresses
    @address = data.css('.adr').map{|a|a.text}
end
    

def phone_numbers
    @phone = data.css('.phones').map{|a|a.text}
end
    

scraper = Scraper.new

names = scraper.names

addresses = scraper.addresses
    
phone_numbers = scraper.phone_numbers

   
(0...names.length).each do |x|
    
    puts "- - - - - - - - - - - - - -"

    puts "#{names[x]} | #{addresses[x]} | #{phone_numbers[x]}"

end

       
#EXPORT TO CSV FILE

CSV.open("data.csv", "w") do |csv|
       
    csv << ["NAME", "ADDRESS","PHONE", "WEBSITE", "DECISION MAKER", "NOTES"]
    
    (0...names.length).each do |x|
    
        csv << ["#{names[x]}","#{addresses[x]}","#{phone_numbers[x]}"]
    
end
    
end


end





        
