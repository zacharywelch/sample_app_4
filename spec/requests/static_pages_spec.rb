require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
    it { should have_selector('h1', text: heading) }
  end

  describe "Home page" do

    let(:page_title) { '' }
    let(:heading)    { 'Sample App' }

    before { visit root_path }
    
    it_should_behave_like "all static pages"
    
    it { should_not have_title('| Home') }
  end

  describe "Help page" do

    before { visit help_path }

    let(:page_title) { 'Help' }
    let(:heading)    { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do

    before { visit about_path }
    
    let(:page_title) { 'About Us' }
    let(:heading)    { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do

    before { visit contact_path }
    
    let(:page_title) { 'Contact' }
    let(:heading)    { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_title full_title('About Us')
    click_link "Help"
    page.should have_title full_title('Help')
    click_link "Contact"
    page.should have_title full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_title full_title('Sign up')
    click_link "sample app"
    page.should have_title full_title('')
  end  
end