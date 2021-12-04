require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup { @user = users(:one) }

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url,
           params: {
             user: {
               club: @user.club,
               greater_region: @user.greater_region,
               notes: @user.notes,
               province: @user.province,
               reddit_username: @user.reddit_username,
               specific_city: @user.specific_city
             }
           }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user),
          params: {
            user: {
              club: @user.club,
              greater_region: @user.greater_region,
              notes: @user.notes,
              province: @user.province,
              reddit_username: @user.reddit_username,
              specific_city: @user.specific_city
            }
          }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) { delete user_url(@user) }

    assert_redirected_to users_url
  end
end
