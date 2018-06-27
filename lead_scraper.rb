require 'open-uri'
require 'nokogiri'


class Scraper 
    
    
puts "Please enter a zip code to search ..."

zip_code = gets.chomp

url = "https://www.yogafinder.com/yoga.cfm?Yogacity=" + zip_code.to_s

data = Nokogiri::HTML(open(url))
    

#loop through all studio listings
    
data.css('.maininfo2').each do |studio_info|
        
    #studio_info = data.css('.insidetext').children.text 
    
    puts data.css('.insidetext').children.text 
   
    #puts studio_info
  
end

end

#def create_csv
    
#end


        
