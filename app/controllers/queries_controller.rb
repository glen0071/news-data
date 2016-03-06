class QueriesController < ApplicationController

  require 'HTTParty'

  def index
    @query = Query.new
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

      query_url = "#{base_url}q=#{query_params[:search_terms]}&begin_date=#{begining}&end_date=#{ending}&page=0&api-key=#{ENV['NYT_ARTICLE_SEARCH_KEY']}"

      @response = Response.new(search_terms: query_params[:search_terms], query_url: query_url, docs_length: 0, query_id: @query.id)
      p "*" * 100
      p @response
      if @response.save
        @response.query_id = @query.id
        @response.docs_length = @response.getArticles(query_url, @response.id)
        @response.save
      end
    end

    render 'show'
  end

  private
    def query_params
      params.require(:query).permit(:search_terms, :begin_date, :end_date)
    end


end
