class Response < ActiveRecord::Base
  belongs_to :query

  include HTTParty

  attr_accessor :query_url

  def initialize(query_url)
    @query_url = query_url
    @new_length = 10
    @total_length = 0
    @page = 0
    @urls_array = []
    @snippets_array = []
    @headlines_array = []
  end

  def getArticles
    while @new_length == 10
      @query_url = query_url.sub(/&page=\d+/, "&page=#{@page}")
      new_response = HTTParty.get(@query_url)["response"]["docs"]

      @urls_array = new_response.select {|article| article['web_url']}
      @snippets_array = new_response.select {|article| article['snippet']}
      @headlines_array = new_response.select {|article| article['headline']['main']}

      @new_length = new_response.length
      @total_length += new_response.length
      @page += 1

      puts "*" * 100
      puts "*" * 100
      puts @page
      puts "*" * 100
      puts "*" * 100
      puts "@urls"
      puts @urls_array.length
      puts @urls_array
      puts "*" * 100
      puts "*" * 100
      puts "@snippets_array"
      puts @snippets_array
      puts "*" * 100
      puts "*" * 100
      puts "@headlines"
      puts @headlines_array
    end
  end





end
