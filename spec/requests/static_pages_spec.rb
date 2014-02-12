require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "¡Muévete!" }
  
  describe "pagina de inicio" do
    
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
    
    it "should have the title 'Inicio'" do
      visit '/static_pages/index'
      expect(page).to have_title('Inicio')
    end
    
  end
  
  describe "pagina de ayuda" do
    it "should have the content 'Ayuda'" do
      visit '/static_pages/ayuda'
      expect(page).to have_content('Ayuda')
    end
    
    it "should have the title 'Ayuda'" do
      visit '/static_pages/ayuda'
      expect(page).to have_title("#{base_title} | Ayuda")
    end
  end
  
  describe "pagina de informacion" do
    it "should have the content 'Informacion'" do
      visit '/static_pages/info'
      expect(page).to have_content('Información')
    end
    
    it "shoud have the title 'Información'" do
      visit '/static_pages/info'
      expect(page).to have_title('Información')
    end
  end
end
