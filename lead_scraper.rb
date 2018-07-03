require 'open-uri'
require 'nokogiri'


class Scraper 
    
    attr_accessor :data 
    
    def initialize 
        
        puts "Please enter a zip code to search ..."

        zip_code = gets.chomp

        url = "https://www.yogafinder.com/yoga.cfm?Yogacity=" + zip_code.to_s
         
        @data ||= Nokogiri::HTML(open(url))

    end
    
    
    def name 
        data.css('.insidetext')[0].text
    end
    
    
    def address 
        data.css('.insidetext')[1].text.strip
    end
    
    
    def phone 
        data.css('.insidetext')[2].text.strip
    end
    
    
    def description 
        data.css('.descriptionstyle')[0].text.strip
    end
    
end


scraper = Scraper.new

scraper.data.css('td').each do |studio_info|
    
    puts "================================="
    
studio_info = [
    Name: scraper.name,
    Address: scraper.address,
    Phone: scraper.phone,
    Description: scraper.description]
    
puts studio_info
    
       
    
end

#end





        
        #studio_info.push(Scraper) 

       # puts data.css('.insidetext').children.text 
        
        
        #studio_data = {}
#        studio_data[:address] = data.css('.insidetext').children[0]
#        
#        puts "Address: #{studio_data[:address]}"

        #puts studio_info

   

#def create_csv
    
#end


        
