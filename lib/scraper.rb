require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
    #def get_page
      #Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    #end 
  
  def get_page
      Nokogiri::HTML(open("https://www.my.pdf-it.com/ers.aspx?doc=78e894aaeed84d1fb0358b1ce5bd2498"))
    end 
    
    #def get_courses
     # self.get_page.css(".post")
    #end 
    
    def get_courses
      self.get_page.css("#row0_0").inner_text
      binding.pry
    end 
    
    def make_courses
      self.get_courses.each do |post|
         course = Course.new 
         course.title = post.css("h2").text 
         course.schedule = post.css(".date").text 
         course.description = post.css("p").text
      end
    end
    
    def print_courses
      self.make_courses
      Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
  end
  
end

Scraper.new.print_courses

