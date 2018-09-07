class CreateGrandchild < ActiveRecord::Migration[5.2]
  def up
    create_table :grandchildren do |t|
      t.references :child
      t.string :body

      t.timestamps
    end
  end

  def down
    drop_table :grandchildren
  end
end
