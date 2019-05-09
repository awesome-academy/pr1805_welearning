class CoursesController < ApplicationController

  def index
   @courses = Course.paginate page: params[:page], per_page: 15
  end

  def show
    @course = Course.find_by id: params[:id]
    @reviews = @course.reviews.paginate page: params[:page], per_page: 5
    @avg_review = @course.avg_rate
  end

  private

  def course_params
  	params.require(:course).permit :name, :buy_times, :rate, :price, :description
  end
end
