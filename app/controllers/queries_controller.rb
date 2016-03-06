class QueriesController < ApplicationController

  require 'HTTParty'

  def index
    @query = Query.new
  end

  def new
    @query = Query.new
  end

  def create
    base_url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?"
    begining = query_params[:begin_date].gsub(/-/, '')
    ending = query_params[:end_date].gsub(/-/, '')

    query_url = "#{base_url}q=#{query_params[:search_terms]}&begin_date=#{begining}&end_date=#{ending}&page=0&api-key=#{ENV['NYT_ARTICLE_SEARCH_KEY']}"


    @response = Response.new(query_url)
    @response.getArticles

    # query_url
    # # @response = HTTParty.get("http://rubygems.org/api/v1/versions/httparty.json")
    # @web_urls = []
    # HTTParty.get(query_url)["response"]["docs"].each {|article|
    #   @web_urls << article['web_url']
    # }

    render 'show'
  end

# HTTParty::Response

  private
    def query_params
      params.require(:query).permit(:search_terms, :begin_date, :end_date)
    end


end
