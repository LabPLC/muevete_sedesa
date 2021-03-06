class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    puts "OAUTH LOGIN"
    puts resource.sign_in_count
    if resource.sign_in_count == 1
      first_login_path
    else
      user_home_path
    end
  end

  def toast(type, text)
    flash[:toastr] = { type => text }
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

end
