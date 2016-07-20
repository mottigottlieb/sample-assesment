class Scrape
require 'pry'
require 'open-uri'
require 'nokogiri'
#  @index_url = "https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=traffic&loc=11225&button="

  @@lawyers = {}
  @@id=1

  def self.lawyers
    @@lawyers
  end

  def scrape_page(index_url)
  site = @doc = Nokogiri::HTML(open(index_url))
     site.search("div.lawyer-search-result").map do |info|
           l_name = info.search("div h3").text
           l_practice = info.search("p.text-truncate").text
           l_rating = info.search("span.text-nowrap strong").text
           l_years =  info.search("time").text.delete("since ").to_i
           l_number = info.search("span.hidden-xs").text

           time = Time.now

           @@lawyers[@@id]={
                           :name => l_name,
                           :practice => l_practice,
                           :rating => l_rating,
                           :years => time.year-l_years,
                           :number => l_number
                           }
                         @@id += 1
                end

     end


        def seed_lawyers
                @lawyers = Scrape.lawyers
                     @lawyers.each do |a,b|
                       @name = b[:name]
                       @rating = b[:rating]
                       @practice = b[:practice]
                       @years = b[:years]
                       @number = b[:number]
                         Lawyer.create(name:@name, practice: @practice, rating: @rating, years: @years, number: @number)
                      end
        end

          end
