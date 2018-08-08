require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'csv'

#"dance" site:clients.mindbodyonline.com
#Mozenda
#https://clients.mindbodyonline.com/classic/

#GOOGLE URLS------<a href="https://clients.mindbodyonline.com/classic/ws?studioid=1648" ping="/url?sa=t&amp;source=web&amp;rct=j&amp;url=https://clients.mindbodyonline.com/classic/ws%3Fstudioid%3D1648&amp;ved=2ahUKEwjz1JWN09jcAhUBXq0KHQ4QDu8QFjAAegQIABAB">LOU CONTE DANCE STUDIO Online - MINDBODY</a>

#GET THE LOGO URL -----<a href="javascript:gotoStudioSite('http://www.kvdancestudio.ca');">

#<img id="studioLogoConsumer" style="max-width:190px; max-height:70px;" src="/studios/KVDanceStudio/logo.gif?imageversion=20" alt="">
#</a>

#-----call google.com
#-----locate search form
#------enter the dance url
#-------parse search results 
#redirect into links
#search for studio logo and retrieve studio website
#export website list into CSV

class Mindboty
    
    URI = 'http://google.com/'
    
    attr_accessor :agent, :page
    
def initialize
    @agent = Mechanize.new
    @page = @agent.get(URI)
#    @get_logo_url = data.css('#studioLogoConsumer')
end


def start_search (search_words)

    form = page.forms.first

    form['q'] = search_words

    page = form.submit
    
    page = page.links_with(:href => %r{/clients.mindbodyonline.com/classic/}).each do |link|
        page = link.click
        puts page.links_with(:href => %r{/javascript:gotoStudioSite/}).uri
#        pp page
    end
      
#    page.links_with(:href => %r{/:gotoStudioSite/}).each do |x|
#        puts x.uri
#    end
    
#    puts page.search('img.a').text
#        
#    pp page
end
        
end
    

mindboty =  Mindboty.new
puts mindboty.start_search('"dance" site:clients.mindbodyonline.com')






    

