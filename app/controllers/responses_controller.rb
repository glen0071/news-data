class ResponsesController < ApplicationController

  def show
    @response = Response.find_by(id: params[:id])
  end




end
