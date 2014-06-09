# == Schema Information
#
# Table name: friend_relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe FriendRelationship do
  
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:friend_relationship) { follower.friend_relationships.build(followed_id: followed.id)}

  subject { friend_relationship }

  it { should be_valid }

  describe "metodos de seguir " do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

  describe "cuando no hay id de followed" do
    before { friend_relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "cuando no hay id de follower" do
    before { friend_relationship.follower_id = nil }
    it { should_not be_valid}
  end

end
