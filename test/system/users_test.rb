require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup { @user = users(:one) }

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'creating a User' do
    visit users_url
    click_on 'New User'

    fill_in 'Club', with: @user.club
    fill_in 'Greater region', with: @user.greater_region
    fill_in 'Notes', with: @user.notes
    fill_in 'Province', with: @user.province
    fill_in 'Reddit username', with: @user.reddit_username
    fill_in 'Specific city', with: @user.specific_city
    click_on 'Create User'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'updating a User' do
    visit users_url
    click_on 'Edit', match: :first

    fill_in 'Club', with: @user.club
    fill_in 'Greater region', with: @user.greater_region
    fill_in 'Notes', with: @user.notes
    fill_in 'Province', with: @user.province
    fill_in 'Reddit username', with: @user.reddit_username
    fill_in 'Specific city', with: @user.specific_city
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'User was successfully destroyed'
  end
end
