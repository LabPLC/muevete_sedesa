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
  it { should respond_to(:followed_acciones)}
  it { should respond_to(:doing_action?)}
  it { should respond_to(:do_action! )}

  it { should respond_to(:completed_actions) }
  it { should respond_to(:todo_actions)}

  it { should respond_to(:complete_action!)}

  it { should respond_to(:friend_relationships)}
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:reverse_friend_relationships) }
  it { should respond_to(:followers) }

  describe "seguir accion" do
    let(:accion) { FactoryGirl.create(:accion) }
    before do
      @user.save!
      @user.do_action!(accion)
    end

    it { should be_doing_action(accion)}
    its(:followed_acciones) { should include(accion)}
  end

  describe "completar accion" do
    let(:accion) { FactoryGirl.create(:accion)}

    before do
      @user.save!
      @puntos = @user.points
      @user.do_action!(accion)
      @user.complete_action!(accion)

    end

    its(:followed_acciones) { should include(accion)}
    its(:todo_actions) { should_not include(accion)}

    describe "agregar puntos" do

      its(:points) {should eq(@puntos+accion.points)}
    end

  end

  describe "following" do
    let(:other_user){ FactoryGirl.create(:user) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }
      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user)}
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user)}

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user)}
    end
  end


end
