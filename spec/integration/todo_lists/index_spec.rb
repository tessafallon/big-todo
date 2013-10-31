require 'spec_helper'

describe TodoList do
  describe "index" do
    before do
      @l1 = TodoList.create(name: 'Homeworks and Labs')

      @l1.todos.create(name: 'Pollywogs')
      @l1.todos.create(name: 'TV Land')
      @l1.todos.create(name: 'The Big Todo')

      @l2 = TodoList.create(name: 'Weekend Plans')

      @l2.todos.create(name: 'Play Magic: the Gathering')
      @l2.todos.create(name: 'Eat a full brick of cheddar cheese with no beverage')

      visit todo_lists_path
    end

    it "should display the todo list names linked to their pages" do
      expect(page).to have_link(@l1.name, href: todo_list_path(@l1))
      expect(page).to have_link(@l2.name, href: todo_list_path(@l2))
    end

    it "should have a form for creating new todo lists" do
      todo_list_name = 'New York City bucket list'

      fill_in(:todo_list_name, with: todo_list_name)
      click_button('Create Todo list')

      expect(page).to have_content(todo_list_name)
    end
  end
end
