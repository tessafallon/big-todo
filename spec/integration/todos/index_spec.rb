require 'spec_helper'

describe "todos" do
  describe "index" do
    before do
      @t1 = Todo.create(name: 'Michael Jackson zombie flash mob', complete: true)
      @t2 = Todo.create(name: 'Rob Zombie pop singer flash mob', complete: false)
      @t3 = Todo.create(name: 'Talk to DHH', complete: true)
      @t4 = Todo.create(name: 'Finish todo app', complete: false)

      visit "/"
    end

    describe "todo list" do
      it "should display uncomplete todo items" do
        within("#incomplete") do
          should have_content 'Rob Zombie pop singer flash mob'
          should have_content 'Finish todo app'
        end
      end

      it "should display complete todo items" do
        within("#complete") do
          should have_content 'Talk to DHH'
          should have_content 'Michael Jackson zombie flash mob'
        end
      end

      it "should link to a page for creating new todos" do
        expect(page).to have_link(href: new_todo_path)
      end

      it "should have a button for marking todo items as complete" do
        pending
      end

      it "should have a button to edit existing todo items" do
        pending
      end
    end
  end
end
