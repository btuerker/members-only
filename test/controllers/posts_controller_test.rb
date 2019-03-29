require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "new action should redirect to sign in page when not logged in" do
    get new_post_path
    assert_redirected_to signin_path
    follow_redirect!
    assert_template 'sessions/new'
  end

  test "should get new when user is already logged in" do
    sign_in_as(@user)
    get new_post_path
    assert_response :success
  end

  test "create action should redirect to sign in page when user is not logged in" do
     assert_difference 'Post.count', 0 do
      post posts_path, params: {post: {title: "new_title", body: "new_body" }}
    end
     assert_redirected_to signin_path
     follow_redirect!
     assert_template 'sessions/new'
  end

  test "should create a new post when user is already logged in" do
    sign_in_as(@user)
    assert_difference 'Post.count' do
      post posts_path, params: {post: {title: "new_title", body: "new_body" }}
    end
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end
end
