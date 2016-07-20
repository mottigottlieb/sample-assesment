class LawyerController < ApplicationController


  require 'pry'

  get '/search_for_a_lawyer' do
      erb :"lawyer/lawyer_search"
    end
    post '/save' do
      @show = Lawyer.all
      @find = @show.find_by(id: @saved_lawyer)
      binding.pry
     end

    post "/results" do
        @legal = params[:legal]
        @location = params[:location]
        @new_scrape = Scrape.new
        @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=#{@legal}&loc=#{@location}&button=")
        @new_scrape.seed_lawyers
        @show = Lawyer.all
          erb :"lawyer/results"
          end
          #  [#<Lawyer id: 1, name: nil,  nil, rating: nil, years: nil, number: nil>
        end
