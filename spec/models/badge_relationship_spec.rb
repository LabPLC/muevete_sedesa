require 'spec_helper'

describe BadgeRelationship do

  let(:usuario) { FactoryGirl.create(:user) }
  let(:badge) { FactoryGirl.create(:badge) }
  let (:badge_relationship) { badge.user_relationships.build(user_id: usuario.id)}

  subject { badge_relationship }

  it { should be_valid }

end
