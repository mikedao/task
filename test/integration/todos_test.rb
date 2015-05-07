require 'test_helper'
class TodosTest < ActionDispatch::IntegrationTest
  include Capybara::DSL


  test "a todo can be edited" do
    list = List.create(title: "Hello")
    todo = list.todos.create(title: "Goodbye", desc: "woowowo", due_date: Date.tomorrow)

    visit edit_todo_path(todo)
    fill_in "todo[title]", :with => "Steve"
    click_link_or_button "Edit this Todo"

    assert_equal "Goodbye", todo.title
  end

  test "a todo can be created" do
    list = List.create(title: "Hello")
    visit root_path
    click_link_or_button "Details"
    fill_in "todo[title]", :with => "Title"
    fill_in "todo[desc]", :with => "Desc"
    fill_in "todo[due_date]", :with => "05/13/15"

    click_link_or_button "Create A New Todo"

    assert_equal "Title", list.todos.first.title
    assert_equal "Desc", list.todos.first.desc
  end

  test "an active todo is on the active list" do
    list = List.create(title: "Hello")
    todo = list.todos.create(title: "Goodbye", desc: "woowowo",
                             due_date: Date.tomorrow,
                             active: true)

    visit root_path
    click_link_or_button "Details"

    assert page.has_content?("Goodbye")
  end

  test "an active todo can be made inactive" do
    list = List.create(title: "Hello")
    todo = list.todos.create(title: "Goodbye", desc: "woowowo",
                             due_date: Date.tomorrow,
                             active: true)

    visit root_path
    click_link_or_button "Details"
    click_link_or_button "Make Inactive"
    visit inactive_todos_path(list)

    assert page.has_content?("Goodbye")
  end

  test "an inactive todo can be made active" do
    list = List.create(title: "Hello")
    todo = list.todos.create(title: "Goodbye", desc: "woowowo",
                             due_date: Date.tomorrow,
                             active: false)

    visit inactive_todos_path(list)
    click_link_or_button "Make Active"
    visit list_path(list)

    assert page.has_content?("Goodbye")
  end
end
