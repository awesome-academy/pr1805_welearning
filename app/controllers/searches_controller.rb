class SearchesController < ApplicationController

  def index
    # if params[:search]
    #   @results = Course.all
    #   if params[:search][:title].present?
    #     @parameter = params[:search][:title].downcase
    #     @results = @results.by_title @parameter
    #   end
    #   if params[:search][:category_ids].present?
    #     @results = @results.by_category_ids params[:search][:category_ids]
    #   end
    # else
    #   render :index
    # end
    if params[:search].blank?
    else
      @parameter = params[:search][:title].downcase
      @results = Course.by_title(@parameter).by_category_ids(params[:search][:category_ids])
      render :index
    end
  end
end
