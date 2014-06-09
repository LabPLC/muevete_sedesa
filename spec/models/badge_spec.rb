# == Schema Information
#
# Table name: badges
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  points     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Badge do
  before do
    @badge = Badge.new(name: "Badge1", desc: "Lorem ipsum blbalba", points: 100 )
  end

  subject { @badge }

  it { should respond_to(:name) }
  it { should respond_to(:desc) }
  it { should respond_to(:points) }

  it { should respond_to(:badge_relationships) }


end
