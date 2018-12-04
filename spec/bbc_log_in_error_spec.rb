require 'spec_helper'

describe 'Incorrect user details produces a valid error' do

  context 'it should respond with the correct error when incorrect details are submitted' do
    it "should produce an error when inputting incorrect password to an incorrect username" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_homepage
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_username_field_valid
      @bbc_site.bbc_sign_in_page.fill_password_field_valid
      @bbc_site.bbc_sign_in_page.click_sign_in_button

      expect(@bbc_site.bbc_sign_in_page.invalid_username_error_message).to eq true
    end

    it "should produce an error when inputting an password has an incorrect format" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_homepage
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_username_field_valid
      @bbc_site.bbc_sign_in_page.fill_password_field_invalid_format
      @bbc_site.bbc_sign_in_page.click_sign_in_button

      expect(@bbc_site.bbc_sign_in_page.invalid_password_format_error_message).to eq true
    end

    it "should produce an error when inputting a password too short" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_homepage
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_username_field_valid
      @bbc_site.bbc_sign_in_page.fill_password_field_invalid_length
      @bbc_site.bbc_sign_in_page.click_sign_in_button

      expect(@bbc_site.bbc_sign_in_page.invalid_password_length_error_message).to eq true
    end
  end



end
