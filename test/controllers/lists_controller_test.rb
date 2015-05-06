require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "it can destroy lists" do
    list = List.create(title: "hello")

    delete :destroy, {'id' => list.id }

    assert_redirected_to lists_path
  end

  test "it can update lists" do
    list = List.create(title: "hello")

    put :update, {'id' => list.id, 'list' => {'title' => 'goodbye'}}

    assert_redirected_to lists_path
  end

  end
