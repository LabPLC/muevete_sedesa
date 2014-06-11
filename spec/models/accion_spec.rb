# == Schema Information
#
# Table name: acciones
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  points     :integer
#  created_at :datetime
#  updated_at :datetime
#  level      :integer          default(1)
#  canjeable  :boolean          default(FALSE)
#  code       :string(255)
#  lugar      :string(255)
#  promotor   :string(255)
#  recurrente :boolean
#  fecha      :string(255)
#  horario    :string(255)
#  url        :string(255)
#

require 'spec_helper'

describe Accion do

  before do
    @accion = Accion.new(name: "Action 1", desc: "Lorem ipsum", points: 20)
  end

  describe "Accion" do
    subject { @accion }

    it { should respond_to(:name) }
    it { should respond_to(:desc) }
    it { should respond_to(:level) }
    it { should respond_to(:points)}

    it { should respond_to(:relationships)}


    it { should respond_to(:users) }

    it { should respond_to(:code) }

    it { should respond_to(:url)}
    it { should respond_to(:fecha_inicio)}
    it { should respond_to(:fecha_fin)}
    it  {should respond_to(:hora_inicio)}
    it {should respond_to(:hora_fin)}



    it { should be_valid }
  end


  describe "when is not created with points" do
    before { @accion.points = nil}
    it { should_not be_valid}
  end

  describe "usuarios" do
    let(:user) { @user = User.new(email: "user@example1.com",
                     password: "juancar1os", password_confirmation: "juancar1os") }
    before do
      user.save!
      @accion.save!
      user.do_action!(@accion)
    end
    subject { @accion }
    its(:users) { should include(user)}
  end

  describe "codigos" do
    before do
      @accion.code = "aaa"
    end

    describe "cuando no es canjeable" do
      before do
        @accion.canjeable = false
        @accion.save
      end
      its(:code) { should be_nil }
    end

    describe "cuando si es canjeable" do
      before do
        @accion.canjeable = true
        @accion.save
      end
      it { should_not be_valid}
    end
  end

end
