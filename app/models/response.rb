class Response < ActiveRecord::Base
  belongs_to :query

  include HTTParty

  # def initialize()

  #   @page = 0
  #   @new_length = 0
  # end

  attr_accessor :query_url

  def getArticles(query_url, response_id)
    @page = 0
    @new_length = 10
    @articles = 0

    while @new_length == 10
      @query_url = query_url.sub(/&page=\d+/, "&page=#{@page}")
      new_response = HTTParty.get(@query_url)["response"]["docs"]

      new_response.each {|this_article|
        p "now looking through articles"
        new_article = Article.new()
        new_article.response_id = response_id
        new_article.url = this_article['web_url']
        new_article.source = this_article['source']
        new_article.snippet = this_article['snippet']
        new_article.headline = this_article['headline']['main']
        new_article.save
        p "printed one article!"
      }

      @page += 1
      @new_length = new_response.length
      @articles += new_response.length

    end

    @articles
  end





end
