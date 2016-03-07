class ResponsesController < ApplicationController

  def show
    @response = Response.find_by(id: params[:id])
    @articles = Response.find_by(id: params[:id]).articles.order(:pub_date)

    @grouped_articles = Response.find_by(id: params[:id]).articles.group_by {
      |article| article.pub_date.beginning_of_month
    }

  end

end
