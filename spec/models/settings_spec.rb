require 'spec_helper'

describe Settings do

  context "class methods" do

    subject { described_class }

    let(:presenter_klass) { described_class::Presenter }

    Settings::ALL.each do |namespace, settings|

      it "responds to #{namespace}" do
        subject.should respond_to(namespace)
      end

      it "returns an env variable presenter" do
        subject.send(namespace).should be_a(presenter_klass)
      end

      context "namespaces settings" do
        settings.each do |setting|
          context "#{namespace}.#{setting}" do

            let(:value) { "foo" }
            let(:key) { [ namespace, setting ].join("_").downcase }

            before do
              ENV[key] = value
            end

            it "returns the env variable for the setting" do
              subject.send(namespace).send(setting).should == value
            end

          end
        end
      end

    end
  end

end
