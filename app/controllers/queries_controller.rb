class QueriesController < ApplicationController

  require 'HTTParty'

  def index
    @responses = Response.all

    render 'index'
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      base_url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?"
      begining = query_params[:begin_date].gsub(/-/, '')
      ending = query_params[:end_date].gsub(/-/, '')
      words = query_params[:search_terms].gsub(/\s/, '+')
      query_url = "#{base_url}q=#{words}&begin_date=#{begining}&end_date=#{ending}&page=0&api-key=#{ENV['NYT_ARTICLE_SEARCH_KEY']}"
      binding.pry
      @response = Response.new(search_terms: query_params[:search_terms], query_url: query_url, articles_amount: 0, query_id: @query.id)
      # logic for if @response['meta']['hits'] > 1000 need to modify range so pages does not exceed 100
      if @response.save
        @response.query_id = @query.id
        @response.articles_amount = @response.getArticles(query_url, @response.id)
        @response.save
      end
    end
    @query.response_id = @response.id
    @query.save
    @articles = @response.articles.order(:pub_date)
    render 'show'
  end

  def show

  end

  private
    def query_params
      params.require(:query).permit(:search_terms, :begin_date, :end_date)
    end

end
