class ApplicationController < ActionController::Base
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
end
