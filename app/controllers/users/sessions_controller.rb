class Users::SessionsController < Devise::RegistrationsController

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      acciones_path
    else
      user_home_path
    end
  end

end
