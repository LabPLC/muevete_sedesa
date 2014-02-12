require 'spec_helper'

describe "Static Pages" do
  
  describe "Pagina de inicio" do
    
    it "should have the content '¡Muévete!'" do
      visit '/static_pages/index'
      expect(page).to have_content('¡Muévete!')
    end
    
    it "should have the content 'Iniciar sesión'" do
      visit '/static_pages/index'
      expect(page).to have_content('Iniciar sesión')
    end
    
    it "should have the content 'Información'" do
      visit '/static_pages/index'
      expect(page).to have_content('Información')
    end
    
  end
end
