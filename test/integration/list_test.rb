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

  test "active lists are on the home page" do
    list = List.create(title: "Hello", active: true)

    visit root_path

    assert page.has_content?("Hello")
  end

  test "inactive lists appear on the hidden page" do
    list = List.create(title: "Hello")
    list.active = false
    list.save

    visit hidden_path

    assert page.has_content?("Hello")
  end

  test "theres a link to the hidden page on the front page" do
    visit root_path

    click_link_or_button "Hidden lists!"

    assert_equal hidden_path, current_path
  end

  test "theres a link to the active lists page on the hidden lists page" do
    visit hidden_path

    click_link_or_button "See Active Lists"

    assert_equal root_path, current_path
  end

  test "an active link has an edit link" do
    list = List.create(title: "Hello")

    visit root_path
    click_link_or_button "Edit"

    assert_equal current_path, edit_list_path(list)
  end

  test "an active link has a details link" do
    list = List.create(title: "Hello")

    visit root_path
    click_link_or_button "Details"

    assert_equal current_path, list_path(list)
  end

  test "a hidden link has an edit link" do
    list = List.create(title: "Hello")
    list.active = false
    list.save

    visit hidden_path
    click_link_or_button "Edit"

    assert_equal current_path, edit_list_path(list)
  end

  test "a hidden link has a details link" do
    list = List.create(title: "Hello")
    list.active = false
    list.save

    visit hidden_path
    click_link_or_button "Details"

    assert_equal current_path, list_path(list)
  end

  test "an active list has no delete" do
    list = List.create(title: "Hello")

    visit root_path
    refute page.has_link?("Delete")
  end

  test "an inactive list has a delete link" do
    list = List.create(title: "Hello")
    list.active = false
    list.save

    visit hidden_path

    assert page.has_link?("Delete")
  end

  test "an inactive list can be deleted" do
    list = List.create(title: "Hello")
    list.active = false
    list.save

    visit hidden_path
    click_link_or_button "Delete"

    visit hidden_path
    refute page.has_content?("Hello")
  end

end
