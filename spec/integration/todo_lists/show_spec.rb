require 'spec_helper'

describe TodoList do
  describe "show" do
    before do
      @list = TodoList.create(name: 'Best Day Ever')

      @t1 = @list.todos.create(name: 'Michael Jackson zombie flash mob', complete: true)
      @t2 = @list.todos.create(name: 'Rob Zombie pop singer flash mob', complete: false)
      @t3 = @list.todos.create(name: 'Talk to DHH', complete: true)
      @t4 = @list.todos.create(name: 'Finish todo app', complete: false)

      visit todo_list_path(@list)
    end

    it "should display complete todo items" do
      within("#complete") do
        page.should have_content 'Talk to DHH'
        page.should have_content 'Michael Jackson zombie flash mob'

        page.should_not have_content 'Rob Zombie pop singer flash mob'
        page.should_not have_content 'Finish todo app'
      end
    end

    it "should display incomplete todo items" do
      within("#incomplete") do
        page.should have_content 'Rob Zombie pop singer flash mob'
        page.should have_content 'Finish todo app'

        page.should_not have_content 'Talk to DHH'
        page.should_not have_content 'Michael Jackson zombie flash mob'
      end
    end
  end
end
