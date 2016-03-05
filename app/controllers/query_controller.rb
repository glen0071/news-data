class QueryController < ApplicationController

  def show
    base_url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?"
    query_url = "#{base_url}q=#{params[:search_term]}&begin_date=#{params[:begin_date]}&end_date=#{params[:end_date]}&page=0&api-key=#{ENV['NYT_ARTICLE_SEARCH_KEY']}"

    p query_url
  end

end
