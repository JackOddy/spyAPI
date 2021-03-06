require 'rails_helper'

feature 'updating an API' do

  before do
    sign_up
    add_api
  end

  scenario 'user can update an API key linked to their account' do
    visit '/'
    click_link 'Test API'
    click_link 'Edit API'
    check 'key_api'
    click_button 'Update Api'
    expect(page).to have_link 'Test API'
  end

  scenario 'user can update an API name linked to their account' do
    visit '/'
    click_link 'Test API'
    click_link 'Edit API'
    fill_in 'Name', with: 'New API'
    click_button 'Update Api'
    expect(page).to have_link 'New API'
    expect(page).not_to have_link 'Test API'
  end

  scenario 'user can delete an API linked to their account' do
    visit '/'
    click_link 'Test API'
    click_link 'Delete API'
    expect(page).not_to(have_content("Test API"))
    expect(page).to have_content 'API successfully deleted'
  end

  scenario 'JSONs associated with the API are also deleted when an API is deleted' do
    add_JSON
    click_link 'Delete API'
    expect(page).not_to(have_content("Test 1"))
  end


end
