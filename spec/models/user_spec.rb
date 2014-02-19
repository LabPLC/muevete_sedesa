require 'spec_helper'

describe User do


  before do
    @user = User.new(email: "user@example.com",
                     password: "juancar1os", password_confirmation: "juancar1os")
  end
  
  subject{ @user }
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password)}

  it { should respond_to(:relationships)}
  it { should respond_to(:followed_actions)}
  it { should respond_to(:doing_action?)}
  it { should respond_to(:do_action! )}

  describe "seguir accion" do
    let(:accion) { FactoryGirl.create(:action) }
    before do
      @user.save!
      @user.do_action!(accion)
    end

    it { should be_doing_action(accion)}
    its(:followed_actions) { should include(accion)}
  end

end
