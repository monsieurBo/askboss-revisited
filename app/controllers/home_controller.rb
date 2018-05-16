class HomeController < ApplicationController
  include Clearance::Controller
  protect_from_forgery with: :exception

  def home
  	@questions = Question.all
  end
  
end