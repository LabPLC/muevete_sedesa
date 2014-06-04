#!/bin/env ruby
# encoding: utf-8


require 'spec_helper'

include Warden::Test::Helpers
describe 'User Pages' do

  describe 'homepage' do
    it "NO debe tener el dashboard del usuario" do
      visit '/userhome'
      puts page.status_code
      page.should_not have_content('¿Qué puedo hacer?')
    end

    describe 'cuando el usuario inicia sesion' do
      before { login_as FactoryGirl.create(:user) }
      it "solo cuando inicie sesion" do
        visit '/userhome'
        page.should have_content('¿Qué puedo hacer?')
      end
    end


  end
end
