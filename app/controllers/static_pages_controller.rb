class StaticPagesController < ApplicationController

  def home
    @popularcourses = Course.popular.limit 3
    @courses = Course.popular.limit 6
  end

  def help; end

  def about; end

  def contact; end

  def news; end

end
