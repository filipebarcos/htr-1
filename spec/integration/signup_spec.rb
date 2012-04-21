# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Signup" do
  context "with valid data" do
    before do
      visit "/"
      click_link "Cadastre-se"

      fill_with "Nome completo", :with => "John Doe"
      fill_with "E-mail", :with => "john@example.org"
      fill_with "Senha", :with => "test"
      fill_with "Confirmação de senha", :with => "test"

      click_button "Quero me cadastrar"
    end

    it "redirects to the login page" do
      current_path.should eql(login_path)
    end

    it "displays success message" do
      page.should have_content("Seu cadastro foi realizado com sucesso!")
    end
  end
end
