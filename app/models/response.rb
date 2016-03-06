class Response < ActiveRecord::Base
  belongs_to :query

  include HTTParty

  attr_accessor :query_url

  def initialize(query_url)
    this.query_url = query_url
    this.new_length = 0
  end

  def getArticles

    more_articles = true
    page = 0
    if this.new_length <= 9
      this.query_url = query_url.gsub(/&page=\d+/, "&page=#{page}")
      new_response = HTTParty.get(this.query_url)["response"]["docs"]
      length = new_response.length
    else
      more_articles = false


  end





end
