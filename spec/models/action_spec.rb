require 'spec_helper'

describe Action do

  before do
    @action = Action.new(name: "Action 1", desc: "Lorem ipsum", points: 20)
  end

  subject { @action }

  it { should respond_to(:name) }
  it { should respond_to(:desc) }
  it { should respond_to(:level) }
  it { should respond_to(:points)}

  it { should respond_to(:relationships)}


  it { should respond_to(:users) }

  it { should respond_to(:code) }

  it { should respond_to(:url)}



  it { should be_valid }

  describe "when is not created with points" do
    before { @action.points = nil}
    it { should_not be_valid}
  end

  describe "usuarios" do
    let(:user) { @user = User.new(email: "user@example1.com",
                     password: "juancar1os", password_confirmation: "juancar1os") }
    before do
      user.save!
      @action.save!
      user.do_action!(@action)

    end

    subject { @action }
    its(:users) { should include(user)}
  end

  describe "codigos" do
    before do
      @action.code = "aaa"
    end

    describe "cuando no es canjeable" do
      before do
        @action.canjeable = false
        @action.save
      end
      its(:code) { should be_nil }
    end

    describe "cuando si es canjeable" do
      before do
        @action.canjeable = true
        @action.save
      end
      its(:code) { should_not be_nil}
    end
  end

end
