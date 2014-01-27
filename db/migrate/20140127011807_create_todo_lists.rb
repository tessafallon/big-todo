class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
    	t.string :name
    	t.string :item1
    	t.string :item2
    	t.string :item3
    	t.string :item4
    	t.string :item5

      t.timestamps
    end
  end
end
