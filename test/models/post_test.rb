require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = Post.new(title: "Post title", body: "Body text", user: @user)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should have an associated user" do
    assert @post.user
  end
end
