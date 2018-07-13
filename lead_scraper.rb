require 'open-uri'
require 'nokogiri'
require 'csv'


class Scraper 
    
    attr_accessor :data, :name, :address
    
    def initialize 
        
        puts "Please enter a zip code to search ..."

        zip_code = gets.chomp

        url = "https://www.yogafinder.com/yoga.cfm?Yogacity=" + zip_code.to_s
         
        @data = Nokogiri::HTML(open(url))

    end
    
    def studio_info
         data.css('.insidetext').children.map{|t|t.text}.each_slice(2).to_a
    end
    
end


scraper = Scraper.new

puts scraper.studio_info



        
#def create_csv

CSV.open("data.csv", "w") do |data|
       #data << ['NAME', 'ADDRESS','PHONE']
        
        scraper.studio_info.each do |row|
            data << [row]
            #data << [""]
        end
        
        
end
    
#end






        
