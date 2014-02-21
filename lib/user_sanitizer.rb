# Clase que sobreescribe el metodo de 
# la actualizacion de los campos para 
# poder usar strong parameters y poder 
# almacenar otros campos del usuario

class User::ParameterSanitizer < Devise::ParameterSanitizer

  private

  def account_update
    default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :points)
  end
end