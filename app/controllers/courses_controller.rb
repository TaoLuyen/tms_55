class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:show, :index]
  before_action :load_course, :authorize_user, only: :show

  def show
  end

  def index
    @user_courses = current_user.user_courses.paginate page: params[:page], per_page: 10
  end

  private
  def load_course
    @course = Course.find params[:id]
  end

  def authorize_user
    unless @course.users.include? current_user
      redirect_to root_path
    end
  end
end
