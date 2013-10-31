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

    it "should have an ordered list of TodoLists in descending alphabetical order" do
      todo_lists = all('li')
      todo_lists.count.should == 2

      expect(todo_lists[0]).to have_content @l1.name
      expect(todo_lists[1]).to have_content @l2.name
    end

    it "should display the number of todos each todo list has" do
      todo_lists = all('li')
      todo_lists.count.should == 2

      expect(todo_lists[0]).to have_content @l1.todos.count
      expect(todo_lists[1]).to have_content @l2.todos.count
    end

    it "should link to the todo list" do
      todo_list_links = all('li a')
      todo_list_links.count.should == 2

      todo_list_links[0][:href].should == todo_list_path(@l1)
      todo_list_links[1][:href].should == todo_list_path(@l2)
    end

    it "should have a form for creating new todo lists" do
      todo_list_name = 'New York City bucket list'

      fill_in(:todo_list_name, with: todo_list_name)
      click_button('Create Todo list')

      expect(page).to have_content(todo_list_name)
    end
  end
end
