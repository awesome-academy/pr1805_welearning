class CartsController < ApplicationController

  before_action :current_cart
  before_action :course_unpaid, only: [:update, :index]

  def index
    @carts = @current_cart.paginate page: params[:page]
  end

  def create
    @cart = @current_cart.create course_id: params[:course_id]
    redirect_to courses_path
  end

  def update
    @course_unpaid.ids.each {|n|
      @cart = Cart.find_by id: n
      @course = Course.find_by(id: @cart.course_id)
      @cart.update_attributes(paid: true)
      @course.update_attributes(buy_times: @course.buy_times + 1)
    }
    flash[:success] = "Thanh toán thành công!"
    redirect_to root_path
  end

  def destroy
    @cart = Cart.find_by id: params[:id]
    @cart.destroy
    redirect_to user_carts_path
  end

  private

  def course_unpaid
    @course_unpaid = current_user.carts.unpaid
  end

  def current_cart
    @current_cart = current_user.carts.includes(:course)
  end
end
