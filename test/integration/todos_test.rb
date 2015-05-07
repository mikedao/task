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


end

