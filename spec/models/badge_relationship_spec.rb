# == Schema Information
#
# Table name: badge_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  badge_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe BadgeRelationship do

  let(:usuario) { FactoryGirl.create(:user) }
  let(:badge) { FactoryGirl.create(:badge) }
  let (:badge_relationship) { badge.badge_relationships.build(user_id: usuario.id)}

  subject { badge_relationship }

  it { should be_valid }

end
