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

  it { should be_valid }

  describe "when is not created with points" do 
    before { @action.points = nil}
    it { should_not be_valid}
  end

end
