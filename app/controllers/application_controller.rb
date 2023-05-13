class ApplicationController < ActionController::Base
  before_action :set_current_user

  def after_sign_in_path_for(_resource)
    signout_path
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  before_action :print_display_message

  after_action :print_display

  private

  def print_display_message
    puts '-------------------Iam inherited before action filter----------------------------'
  end

  def print_display
    puts '================================================================================'
    puts '-------------------Iam inherited after action filter----------------------------'
  end

  def set_current_user
    @current_user = Use.find_by(id: session[:user_id])
  end

  attr_reader :current_user
end
