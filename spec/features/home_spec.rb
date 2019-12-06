require 'rails_helper'

feature "Homes", type: :feature do
  let!(:user) { create(:user) } 
  let!(:videos) { create_list(:video, 2, user: user) } 

  scenario 'Show welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Check the registration link' do
    visit(root_path)
    expect(find('ul > li:last-child')).to have_link('Sign_up') 
  end

  scenario 'Check log in link' do
    visit(root_path)
    expect(find('ul > li:first-child')).to have_link('Sign_in') 
  end


  scenario 'lists videos' do
    visit(root_path)
    expect(page).to have_text('Videos') 
    expect(page).to have_content(videos.first.title)
    expect(page).to have_content(videos.last.title) 
  end
  
end
