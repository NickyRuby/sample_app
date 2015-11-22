require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "Insvalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path , user: {name: "" , email: "user@invalid",
                                password: "foo",password_confirmation: "bar"}

    end
    assert_template 'users/new'
  end

  test "Valid signup information" do
    get signup_path
    assert_no_difference 'User.count',1 do
      post_via_redirect users_path, user: {name:"Example User", email: "example@railstutorial.org",
                                           password: "foobar", password_confirmation:"foobar"}
    end
    assert_template 'users/show'
  end
end