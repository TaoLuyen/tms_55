class CoursesController < ApplicationController
  before_action :find_course, only: :show

  def show
    @user_courses = @course.user_courses
  end

  private
  def find_course
    @course = Course.find params[:id]
  end
end
