require 'test_helper'

class IndexPageTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "index page has a list" do
    list = List.create(title: "Hello")

    visit lists_path

    assert page.has_content?(list.title)
  end

  test "index page has more than one list" do
    list = List.create(title: "Hello")
    List.create(title: "Goodbye")

    visit lists_path

    assert page.has_content?(list.title)
    assert page.has_content?("Goodbye")
  end

  test "index page has a link to make new lists" do
    visit lists_path

    click_link_or_button("New List")

    assert_equal new_list_path, current_path
  end

  test "can make a new list" do
    visit new_list_path

    fill_in "list[title]", with: "HOWDY"
    click_link_or_button("Create A New List")

    assert_equal current_path, lists_path
    assert page.has_content?("HOWDY")
  end

  test "can edit a list" do
    list = List.create(title: "Hello")

    visit edit_list_path(list)

    fill_in "list[title]", with: "Goodbye"
  end


end
