require 'open-uri'
require 'nokogiri'
require 'csv'

#https://www.estatesales.net/IL/Lake-Zurich/60047

class Finder
    
    attr_accessor :data , :description
    
def initialize
    
    puts "Please enter a zip code to search ..."
        
    zip_code = gets.chomp
    
    url = "https://www.estatesales.net/IL/Lake-Zurich/" + zip_code.to_s 
         
    @data = Nokogiri::HTML(open(url))

end
    
    
def description
    @description = data.css('h3').map{|x|x.text}
end
    
def company_name
end
    
def address
end
    
def date
end



end