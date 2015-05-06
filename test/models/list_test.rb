require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "it has a title" do
    list = List.create(title: "hello")

    assert_equal "hello", list.title
  end

  test "it is active by default" do
    list = List.create(title: "hello")

    assert list.active
  end
end
