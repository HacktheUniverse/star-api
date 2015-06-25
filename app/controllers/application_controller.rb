class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def home
  end

  def all_stars
    send_file Rails.root.join("app", "assets", "data", "all_stars.json.tar.gz")
  end

end
