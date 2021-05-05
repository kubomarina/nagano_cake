class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    admin_items_path(resource)
  end
end