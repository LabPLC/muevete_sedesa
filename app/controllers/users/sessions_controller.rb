class Users::SessionsController < Devise::RegistrationsController

  ##HACER PRUEBAS TDD
  def after_sign_in_path_for(resource)
    puts "ASFDASDFASDF"
    if request.env['omniauth.origin']
      puts "AJSFASDFSADJFASJFASJDFS"
    end
    if resource.sign_in_count == 1
      first_login_path
    else
      user_home_path
    end
  end

end
