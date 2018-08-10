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
    @company_name = data.css('.sale-row__listed-by').map{|x|x.text}
end
    
def address
    @address = data.css('.sale-row__address').map{|x|x.text}
end
    
def date
    data.css('.sale-row__all-dates__date').map{|x|x.text}
end


end


finder = Finder.new

descriptions = finder.description

company_names = finder.company_name

addresses = finder.address

dates = finder.date


(0..company_names.length).each do |x|

      puts "- - - - - - - - - - - - - -"

    puts "#{descriptions[x]} | #{company_names[x]} | #{addresses[x]} | #{dates[x]}"


end







#CSV.open("data.csv", "w") do |csv|
#       
#    csv << ["NAME", "ADDRESS","PHONE", "WEBSITE", "DECISION MAKER", "NOTES"]
#    
#    (0...names.length).each do |x|
#    
#        csv << ["#{names[x]}","#{addresses[x]}","#{phone_numbers[x]}"]
#    
#end