# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  accion_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  completed  :boolean          default(FALSE)
#

require 'spec_helper'

describe Relationship do

  let(:usuario) { FactoryGirl.create(:user) }
  let(:accion) { FactoryGirl.create(:accion)}

  let(:relationship) {usuario.relationships.build(accion_id: accion.id)}

  subject { relationship }

  it { should be_valid }

  describe "accion methods" do
    it { should respond_to(:user) }
    it { should respond_to(:accion) }
    its(:user) { should eq usuario }
    its(:accion) { should eq accion }
  end

  describe "cuando no hay id de usuario" do
    before { relationship.user_id = nil }
    it { should_not be_valid }
  end

  describe "cuando no hay id de accion" do
    before { relationship.accion_id = nil }
    it { should_not be_valid }
  end

end
