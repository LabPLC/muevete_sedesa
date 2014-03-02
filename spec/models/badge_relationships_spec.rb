require 'spec_helper'

describe BadgeRelationships do

  let(:usuario) { FactoryGirl.create(:user) }
  let(:badge) { FactoryGirl.create(:badge) }
  let (:badge_relationship) { badge.badge_relationships.build(user_id: usuario.id)}

  subject { badge_relationship }

  it { should be_valid }

end
