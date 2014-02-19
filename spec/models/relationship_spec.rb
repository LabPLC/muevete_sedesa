require 'spec_helper'

describe Relationship do
  
  let(:usuario) { FactoryGirl.create(:user) }
  let(:accion) { FactoryGirl.create(:action)}

  let(:relationship) {usuario.relationships.build(action_id: accion.id)}

  subject { relationship }

  it { should be_valid }

  describe "action methods" do
    it { should respond_to(:user) }
    it { should respond_to(:action) }
    its(:user) { should eq usuario }
    its(:action) { should eq accion }
  end

  describe "cuando no hay id de usuario" do
    before { relationship.user_id = nil }
    it { should_not be_valid }
  end

  describe "cuando no hay id de accion" do
    before { relationship.action_id = nil }
    it { should_not be_valid }
  end

end
