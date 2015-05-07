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

  test "controller can create an todo" do
    list = List.create(title: "hello")

    post :create, {"todo"=> {"title"=>"wowowow",
                             "desc"=>"doge",
                             "due_date"=>"2015-05-12",
                             "parent_id"=> list.id.to_s,
                             "active"=>"true"}}
    assert_response :redirect
  end

  test "controller can update a todo" do
    list = List.create(title: "hello")
    todo = list.todos.create(title: "goodbye")
    put :update, {"utf8"=>"✓",
                  "_method"=>"patch",
                  "authenticity_token"=>
    "E9CTx1HXD0MpTETDea6U7JiuM5Jow6jEnjDmWt4wYDVVJ0t2MxDGgUjgwGLvH6+mVs/8GWRC7YnJdteEpWjCzw==",
      "todo"=>
    {"title"=>"yoyoyo",
     "desc"=>"steve was here",
     "due_date"=>"2015-05-04",
     "parent_id"=>"15",
     "active"=>"1",
     "id"=> todo.id.to_s
    },
     "commit"=>"Edit this Todo",
     "controller"=>"todos",
     "action"=>"update",
     "id"=>todo.id.to_s}

    assert_response :redirect

  end
end

