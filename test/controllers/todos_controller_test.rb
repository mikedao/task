require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  include Capybara::DSL
  test "a list that has todos shows them on its details page" do
    list = List.create(title: "hello")
    list.todos.create(title: "YES", due_date: Date.tomorrow, active: true)

    visit list_path(list)

    assert page.has_content?("YES")
  end

  test "there is an edit page" do
    list = List.create(title: "hello")
    todo = list.todos.create(title: "YES", due_date: Date.tomorrow, active: true)

    visit edit_todo_path(todo)

    assert page.has_content?("EDIT")
  end

end
