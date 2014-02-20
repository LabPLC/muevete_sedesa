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

  it { should respond_to(:completed_actions) }
  it { should respond_to(:todo_actions)}

  it { should respond_to(:complete_action!)}

  describe "seguir accion" do
    let(:accion) { FactoryGirl.create(:action) }
    before do
      @user.save!
      @user.do_action!(accion)
    end

    it { should be_doing_action(accion)}
    its(:followed_actions) { should include(accion)}
  end

  describe "completar accion" do
    let(:accion) { FactoryGirl.create(:action)}
    
    before do
      @user.save!
      @user.do_action!(accion)
      @user.complete_action!(accion)

    end

    its(:followed_actions) { should include(accion)}
    its(:todo_actions) { should_not include(accion)}

    describe "agregar puntos" do

      its(:points) {should eq(@user.points+accion.points)}
    end

  end

end
